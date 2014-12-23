class PintsController < ApplicationController
  before_action :set_pint, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index 
    @pints = Pint.all
    respond_with(@pints)
  end

  def show
    respond_with(@pint)
  end

  def new
    @pint = Pint.new
    respond_with(@pint)
  end

  def edit
  end

  def create
    @pint = Pint.new(pint_params)
   if @pint.save
    respond_with(@pint)
    redirect_to @pin, notice: 'Pin was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @pint.update(pint_params)
    respond_with(@pint)
    redirect_to @pin, notice: 'Pin was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @pint.destroy
    redirect_to pins_url
    respond_with(@pint)
  end

  private
    def set_pint
      @pint = Pint.find(params[:id])
    end

    def pint_params
      params.require(:pint).permit(:description)
    end
end
