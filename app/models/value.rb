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