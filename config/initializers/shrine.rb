# frozen_string_literal: true

require 'shrine'

if Rails.env.test?
  require 'shrine/storage/file_system'

  Shrine.storages = { cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'),
                      store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/store') }
else
  require 'shrine/storage/s3'

  aws_credentials = Rails.application.credentials.aws

  s3_options = { access_key_id:     aws_credentials[:access_key_id],
                 secret_access_key: aws_credentials[:secret_access_key],
                 region:            'us-east-2' }

  if Rails.env.production?
    cache_bucket = store_bucket = credentials.aws_s3_bucket
  else
    cache_bucket = 'texpert-test-cache'
    store_bucket = 'texpert-test-store'
  end

  Shrine.storages = { cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options.merge(bucket: cache_bucket)),
                      store: Shrine::Storage::S3.new(prefix: 'store', **s3_options.merge(bucket: store_bucket)) }

  lambda_callback_url = if Rails.env.development?
                          "http://#{ENV['USER']}.localtunnel.me/rapi/lambda"
                        else
                          "https://#{ENV.fetch('APP_HOST')}/rapi/lambda"
                        end

  Shrine.plugin :lambda, s3_options.merge(callback_url: lambda_callback_url)
  Shrine.lambda_function_list
end

Shrine.plugin :activerecord
Shrine.plugin :backgrounding
Shrine.plugin :cached_attachment_data # for forms
Shrine.plugin :logging, logger: Rails.logger
Shrine.plugin :parsed_json

Shrine.plugin :presign_endpoint, presign_options: lambda { |request|
  filename     = request.params['filename']
  extension    = File.extname(filename)
  content_type = Rack::Mime.mime_type(extension)

  { content_length_range: 0..(1.gigabyte), # limit filesize to 1 GB
    content_disposition:  "attachment; filename=\"#{filename}\"", # download with original filename
    content_type:         content_type } # set correct content type
}

Shrine.plugin :rack_file # for non-Rails apps
Shrine.plugin :remote_url, max_size: 1.gigabyte

Shrine::Attacher.promote { |data| PromoteJob.enqueue(data) }
Shrine::Attacher.delete { |data| DeleteJob.enqueue(data) }
