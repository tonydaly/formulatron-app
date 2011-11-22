class Form
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :description

  def persisted?
    false
  end

  def fields
    [Field.new, Field.new]
  end

  def fields_attributes=(attributes)
    # Process the attributes hash
  end

end