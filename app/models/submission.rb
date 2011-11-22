class Submission
  include Mongoid::Document
  belongs_to :form

  def method_missing(m, *args, &block)
    if m.to_s =~ /^field_(.+)$/
      return ''
    else
      super
    end
  end
end