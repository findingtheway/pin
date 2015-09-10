class DotsController < ApplicationController
  before_action :set_dot, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  respond_to :html

  def index
    @dots = Dot.all
    respond_with(@dots)
  end

  def show
    respond_with(@dot)
  end

  def new
    @dot = current_user.dots.build
    respond_with(@dot)
  end

  def edit
  end

  def create
    @dot = current_user.dots.build(dot_params)
    @dot.save
    flash[:notice] = 'Dot was successfully created.' if @dot.save
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

    def correct_user
      @dot = current_user.dots.find_by(id: params[:id])
      redirect_to dots_path, notice: "Not Authorized to edit this dot" if @dot.nil?
    end

    def dot_params
      params.require(:dot).permit(:description)
    end
end
