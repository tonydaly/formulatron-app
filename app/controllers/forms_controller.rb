class FormsController < ApplicationController
  def index
    
  end

  def new
    @form = Form.new
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
