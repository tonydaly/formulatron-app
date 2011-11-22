class SubmissionsController < ApplicationController
  def new
    @form = Form.find params[:form_id]
    @submission = @form.submissions.build
  end
end
