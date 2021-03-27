# frozen_string_literal: true

class Uploader < Shrine
  def generate_location(_io, context)
    if (@record = context[:record])
      id = @record.id
      resource_class = class_location(@record.class)
      type = owner_type_and_id == "#{resource_class}/#{id}" ? resource_class : "#{owner_type_and_id}/#{resource_class}"
    end
    name = context[:name]

    dirname, slash, basename = super.rpartition('/')
    basename = "#{context[:version]}-#{basename}" if context[:version]
    original = dirname + slash + basename

    [type, id, name, original].compact.join('/')
  end

  private

  def class_location(klass)
    parts = klass.name.downcase.split('::')
    if (separator = opts[:pretty_location_namespace])
      parts.join(separator)
    else
      parts.last
    end
  end

  def owner_type_and_id
    @owner_type_and_id ||= "#{@record.owner_type.downcase}/#{@record.owner_id}"
  end
end
