class Value
  include Mongoid::Document
  field :name
  field :content # Could be a string (text) or an array (checkboxes)
  field :element_type
  embedded_in :submission

  # This is pretty hacky.
  def method_missing(m, *args, &block)
    return ''
  end

  def to_s
    content
  end
  
  def content=(attribute)
    if attribute.is_a?(Array)
      # Remove any blank attributes sent via the form
      super(attribute.reject(&:blank?))
    else
      super # If we're dealing with a string just pass it up
    end
  end
end