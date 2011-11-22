class Field
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  TYPES = %w{text_field text_area}

  attr_accessor :name, :type

  def initialize(attributes={})
    attributes.each do |k, v|
      next if k == '_destroy' # for the moment
      send("#{k}=", v)
    end
  end

  def persisted?
    false
  end

  def _destroy
    false
  end

end