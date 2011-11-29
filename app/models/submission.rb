class Submission
  include Mongoid::Document
  belongs_to :form
  embeds_many :values
  # TODO validation
  accepts_nested_attributes_for :values

  def quantitative_values
    values.any_in(element_type: ['check_boxes', 'radio']).all
  end

  def qualitative_values
    values.any_in(element_type: ['string', 'text']).all
  end
end