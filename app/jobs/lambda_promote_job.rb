# frozen_string_literal: true

class LambdaPromoteJob < Que::Job
  def perform(data)
    ActiveRecord::Base.transaction do
      Shrine::Attacher.lambda_process(data)
    end
  end
end
