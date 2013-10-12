class LinksController < ApplicationController
  before_filter :authorize, only: [:new, :create, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create 
    @link = current_user.links.new(link_params)
    if @link.save
      flash[:notice] = "Your link has been saved."
    end
      redirect_to root_path
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:notice] = "Your link has been removed."
    redirect_to root_path
  end

  def show
    @link = Link.find(params[:id])
  end

  private

  def link_params
    params.require(:link).permit(:description, :url)
  end

end