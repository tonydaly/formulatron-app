class Option
  include Mongoid::Document
  field :value, type: String
  embedded_in :element
end