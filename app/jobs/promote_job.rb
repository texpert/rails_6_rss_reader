# frozen_string_literal: true

class PromoteJob < Que::Job
  def perform(data)
    ActiveRecord::Base.transaction do
      Shrine::Attacher.promote(data)
    end
  end
end
