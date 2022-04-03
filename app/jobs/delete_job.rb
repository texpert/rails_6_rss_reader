# frozen_string_literal: true

class DeleteJob < Que::Job
  def run(data)
    ActiveRecord::Base.transaction do
      Shrine::Attacher.delete(data.stringify_keys) # TODO: Remove `stringify_keys` when Shrine will get it fixed
    end
  end
end
