# frozen_string_literal: true

class PromoteJob < Que::Job
  def run(attacher_class, record_class, record_id, name, file_data)
    ActiveRecord::Base.transaction do
      attacher_class = Object.const_get(attacher_class)
      record         = Object.const_get(record_class).find(record_id) # if using Active Record

      attacher = attacher_class.retrieve(model: record, name: name, file: file_data)
      attacher.atomic_promote
    rescue Shrine::AttachmentChanged, ActiveRecord::RecordNotFound
      # attachment has changed or record has been deleted, nothing to do
    end
  end
end
