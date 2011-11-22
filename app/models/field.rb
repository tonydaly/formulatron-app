class Field
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :type

  def persisted?
    false
  end

  def _destroy
    false
  end

end