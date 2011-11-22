# This class was originally called `Field`, however, this is a 
# keyword in Mongoid.
class Element
  include Mongoid::Document
  field :name, type: String
  field :element_type, type: String
  embedded_in :form

  TYPES = %w{text_field text_area}

  validates_inclusion_of :element_type, in: Element::TYPES
end