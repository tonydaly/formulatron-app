class SubmissionsController < ApplicationController
  def new
    @form = Form.find params[:form_id]
    @submission = @form.submissions.build
  end

  def create
    @form = Form.find params[:form_id]
    @submission = @form.submissions.build params[:submission]

    if @submission.save
      redirect_to @form
    else
      render :new
    end
  end
end
