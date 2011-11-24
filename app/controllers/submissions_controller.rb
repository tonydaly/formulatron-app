class SubmissionsController < ApplicationController
  def new
    @form = Form.find params[:form_id]
    @submission = @form.submissions.build
  end

  def create
    @form = Form.find params[:form_id]

    # Check boxes supply blank strings, need to reject them.
    params[:submission].values.first.reject!(&:blank?)
    @submission = @form.submissions.build params[:submission]

    if @submission.save
      redirect_to @form
    else
      render :new
    end
  end
end
