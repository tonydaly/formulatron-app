# This class was originally called `Field`, however, this is a 
# keyword in Mongoid.
class Element
  extend ActiveSupport::Memoizable
  include Mongoid::Document
  field :name, type: String
  field :label, type: String
  field :element_type, type: String
  embedded_in :form
  embeds_many :options

  # These types correspond to the mappings in SimpleForm.
  # This allows us to get SimpleForm to render the correct type of field.
  TYPES = {
    string: 'Single Line Text',
    text: 'Paragraph Text',
    check_boxes: 'Checkboxes',
    radio: 'Multiple Choice'
  }

  validates_inclusion_of :element_type, in: Element::TYPES.keys.map(&:to_s)
  validates_presence_of :name, :label
  accepts_nested_attributes_for :options, :allow_destroy => true

  # TODO Have a clever method to work out the class and styles for different elements
  # e.g. text areas should have 3 rows.

  def check_box?
    element_type == 'check_boxes'
  end

  def radio?
    element_type == 'radio'
  end

  # Returns a hash of each option and its count.
  # Useful for quantitative values.
  def option_counts
    submissions = form.submissions
    
    values = Hash.new(0)
    submissions.each do |submission|
      submission.quantitative_values.each do |value|
        
        # Radio buttons only have one choice
        if value.content.is_a?(String)
          values[value.content] += 1
          next
        end

        # Checkboxes can have multiple choices
        value.content.each do |choice|
          values[choice] += 1
        end
      end
    end
    
    return values
  end
  memoize :option_counts

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