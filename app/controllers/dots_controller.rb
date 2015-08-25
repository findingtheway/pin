class DotsController < ApplicationController
  before_action :set_dot, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @dots = Dot.all
    respond_with(@dots)
  end

  def show
    respond_with(@dot)
  end

  def new
    @dot = Dot.new
    respond_with(@dot)
  end

  def edit
  end

  def create
    @dot = Dot.new(dot_params)
    @dot.save
    flash[:notice] = 'Dot was successfully created.' if @pin.save
    respond_with(@dot)
  end

  def update
    @dot.update(dot_params)
    flash[:notice] = 'Dot was successfully created.' if @dot.save
    respond_with(@dot)
  end

  def destroy
    @dot.destroy
      redirect_to dots_url
    respond_with(@dot)
  end

  private
    def set_dot
      @dot = Dot.find(params[:id])
    end

    def dot_params
      params.require(:dot).permit(:description)
    end
end
