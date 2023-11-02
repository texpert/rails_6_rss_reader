# frozen_string_literal: true

class LambdaUploader < Uploader
  unless Rails.env.test?
    Attacher.promote_block do
      LambdaPromoteJob.enqueue(self.class.name, record.class.name, record.id, name, file_data)
    end
  end

  plugin :upload_options, store: lambda { |_io, context|
    if %i[avatar logo].include?(context[:name])
      { acl: 'public-read' }
    else
      { acl: 'private' }
    end
  }

  plugin :versions

  def lambda_process_versions(io, context)
    assembly = {
      function: Rails.env.production? ? :image_resize_production : 'lambda-test-ImageResizeOnDemand-1BYKRPZK611IJ'
    }

    # rubocop:disable Naming/VariableNumber
    if DocumentTypes::SharpImage::VALUES.include?(io&.data&.dig('metadata', 'mime_type'))
      case context[:name]
        when :logo
          assembly[:versions] =
            [{ name: :size270_180, storage: :store, width: 270, height: 180, background: :transparent, format: :jpg }]
        when :avatar
          assembly[:versions] =
            [
              { name: :size40, storage: :store, width: 40, height: 40, format: :jpg },
              { name: :size80, storage: :store, width: 80, height: 80, format: :jpg },
              { name: :size120, storage: :store, width: 120, height: 120, format: :jpg }
            ]
        when :doc
          assembly[:versions] =
            [{ name: :size800, storage: :store, width: 600, height: 800, background: :transparent, format: :jpg },
             { name: :size100, storage: :store, width: 100, height: 100, background: :transparent, format: :jpg }]
      end
      # rubocop:enable Naming/VariableNumber
    end
    assembly
  end
end
