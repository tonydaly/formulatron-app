class Field
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  TYPES = %w{text_field text_area}

  attr_accessor :name, :type

  def persisted?
    false
  end

  def _destroy
    false
  end

end