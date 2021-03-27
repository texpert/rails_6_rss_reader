# frozen_string_literal: true

class DeleteJob < Que::Job
  def perform(data)
    ActiveRecord::Base.transaction do
      Shrine::Attacher.delete(data)
    end
  end
end
