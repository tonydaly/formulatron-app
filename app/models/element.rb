# This class was originally called `Field`, however, this is a 
# keyword in Mongoid.
class Element
  include Mongoid::Document
  field :name, type: String
  field :element_type, type: String
  embedded_in :form

  TYPES = {
    string: 'Single Line Text',
    text: 'Paragraph Text'
  }

  validates_inclusion_of :element_type, in: Element::TYPES.keys.map(&:to_s)

  # Have a clever method to work out the class and styles for different elements
  # e.g. text areas should have 3 rows.
end