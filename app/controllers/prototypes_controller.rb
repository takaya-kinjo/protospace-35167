class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def index
    @prototype = Prototype.all
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render  :new
    end
  end

  def edit
    unless @prototype.user_id == current_user.id 
      redirect_to root_path
    end
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path
    else
      render :edit
    end
  end

  def destroy
    @prototype.destroy
      redirect_to root_path
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
