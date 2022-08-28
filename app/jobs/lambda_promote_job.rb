# frozen_string_literal: true

class LambdaPromoteJob < Que::Job
  def run(...)
    ActiveRecord::Base.transaction do
      Shrine::Attacher.lambda_process(...)
    end
  end
end
