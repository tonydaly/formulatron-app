class Submission
  include Mongoid::Document
  belongs_to :form

  # This is pretty hacky.
  def method_missing(m, *args, &block)
    return ''
  end
end