# This class was originally called `Field`, however, this is a 
# keyword in Mongoid.
class Element
  include Mongoid::Document
  field :name, type: String
  field :label, type: String
  field :element_type, type: String
  field :options, type: Array # => [[value, label], [value, label], [value, label]]
  embedded_in :form

  TYPES = {
    string: 'Single Line Text',
    text: 'Paragraph Text',
    check_boxes: 'Checkboxes',
    radio: 'Multiple Choice'
  }

  validates_inclusion_of :element_type, in: Element::TYPES.keys.map(&:to_s)
  validates_presence_of :name, :label

  # Have a clever method to work out the class and styles for different elements
  # e.g. text areas should have 3 rows.

  protected

  # Sets the label attribute from the form value. We then downcase it, turn 
  # all the spaces into underscores, rip out any non-word characters and
  # assign it as the name attribute.
  #
  # We do this is because the user provides the label for the form field, but
  # they won't understand why they also need to provide a name.
  def label=(attribute)
    super
    self.name = label.downcase.tr(" ", "_").gsub(/\W/, '')
  end
end