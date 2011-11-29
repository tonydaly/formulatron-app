class Form
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  embeds_many :elements
  has_many :submissions

  validates_presence_of :name, :description
  accepts_nested_attributes_for :elements, :allow_destroy => true

  def quantitative_elements
    elements.any_in(element_type: ['check_boxes', 'radio'])
  end

  def qualitative_elements
    elements.any_in(element_type: ['string', 'text'])
  end
end