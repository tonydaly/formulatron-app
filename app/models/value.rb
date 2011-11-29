class Value
  include Mongoid::Document
  field :name
  field :value # Could be a string (text) or an array (checkboxes)
  field :element_type
  embedded_in :submission

  # This is pretty hacky.
  def method_missing(m, *args, &block)
    return ''
  end

  # Return an array that contains all of the dynamic attributes that
  # have been set on this object.
  def dynamic_fields
    _attributes = attributes
    fields.keys.each do |key|
      _attributes.delete(key)
    end

    return _attributes.keys
  end

  def to_s
    value
  end
  
  def value=(attribute)
    if attribute.is_a?(Array)
      # Remove any blank attributes sent via the form
      super(attribute.reject(&:blank?))
    else
      super # If we're dealing with a string just pass it up
    end
  end
end