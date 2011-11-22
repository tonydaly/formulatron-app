class Form
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :description, :fields

  def initialize(attributes={})
    @fields = []
    attributes.each do |k, v|
      send("#{k}=", v)
    end
  end

  def persisted?
    false
  end

  def fields_attributes=(attributes={})
    # Process the attributes hash
    attributes.each do |k, v|
      @fields << Field.new(v)
    end
  end

  def fields
  end

end