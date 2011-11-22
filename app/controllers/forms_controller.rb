class FormsController < ApplicationController
  def index
    @forms = Form.all
  end

  def new
    @form = Form.new
    @form.elements.build
  end

  def create
    @form = Form.new(params[:form])
    if @form.save
      redirect_to @form
    else
      render :new
    end
  end
end
