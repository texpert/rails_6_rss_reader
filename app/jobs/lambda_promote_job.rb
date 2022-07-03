# frozen_string_literal: true

class LambdaPromoteJob < Que::Job
  def run(attacher_class, record_class, record_id, name, file_data)
    ActiveRecord::Base.transaction do
      Shrine::Attacher.lambda_process(attacher_class, record_class, record_id, name, file_data)
    end
  end
end
