# frozen_string_literal: true

class Uploader < Shrine
  def generate_location(_io, metadata: {}, context: nil)
    if (@record = context[:record])
      id = @record.id
      type = owner_type_and_id == "#{resource_class}/#{id}" ? resource_class : "#{owner_type_and_id}/#{resource_class}"
    end
    name = context[:name]

    dirname, slash, basename = super.rpartition('/')
    basename = "#{context[:version]}-#{basename}" if context[:version]
    original = dirname + slash + basename

    [type, id, name, original].compact.join('/')
  end

  private

  def resource_class
    return @resource_class if defined?(@resource_class)

    parts = @record.class.name.downcase.split('::')
    @resource_class = (separator = opts[:pretty_location_namespace]) ? parts.join(separator) : parts.last
  end

  def owner_type_and_id
    return @owner_type_and_id if defined?(@owner_type_and_id)

    if @record.respond_to?(:owner)
      record_owner_type = @record.owner_type.downcase
      record_owner_id = @record.owner_id
    else
      record_owner_type = resource_class
      record_owner_id = @record.id
    end

    @owner_type_and_id = "#{record_owner_type}/#{record_owner_id}"
  end
end
