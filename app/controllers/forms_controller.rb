class FormsController < ApplicationController
  def index
    @forms = Form.all
  end

  def show
    @form = Form.find params[:id]
    @submissions = @form.submissions

    @qualitative_elements   = @form.qualitative_elements
    @quantitative_elements  = @form.quantitative_elements
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

  def edit
    @form = Form.find params[:id]
  end

  def update
    @form = Form.find params[:id]
    if @form.update_attributes params[:form]
      redirect_to @form
    else
      render :new
    end
  end
end
