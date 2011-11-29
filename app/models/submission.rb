class Submission
  include Mongoid::Document
  # field :values, type: Hash
  belongs_to :form
  embeds_many :values
  # TODO validation
  accepts_nested_attributes_for :values

  # Return an array that contains all of the dynamic attributes that
  # have been set on this object.
  def dynamic_fields
    _attributes = attributes
    fields.keys.each do |key|
      _attributes.delete(key)
    end

    return _attributes.keys
  end

  def quantitative_values
    values.any_in(element_type: ['check_boxes', 'radio']).all
  end

  def qualitative_values
    values.any_in(element_type: ['string', 'text']).all
  end
end