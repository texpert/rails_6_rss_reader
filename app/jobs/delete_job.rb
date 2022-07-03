# frozen_string_literal: true

class DeleteJob < Que::Job
  def run(attacher_class, data)
    attacher_class = Object.const_get(attacher_class)
    attacher = attacher_class.from_data(data)
    ActiveRecord::Base.transaction do
      attacher.destroy
    end
  end
end
