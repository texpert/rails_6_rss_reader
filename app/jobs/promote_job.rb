# frozen_string_literal: true

class PromoteJob < Que::Job
  def run(data)
    ActiveRecord::Base.transaction do
      Shrine::Attacher.promote(data.stringify_keys) # TODO: Remove `stringify_keys` when Shrine will get it fixed
    end
  end
end
