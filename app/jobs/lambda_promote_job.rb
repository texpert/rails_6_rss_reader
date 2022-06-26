# frozen_string_literal: true

class LambdaPromoteJob < Que::Job
  def run(data)
    ActiveRecord::Base.transaction do
      Shrine::Attacher.lambda_process(data.stringify_keys) # TODO: Remove `stringify_keys` when Shrine will get it fixed
    end
  end
end
