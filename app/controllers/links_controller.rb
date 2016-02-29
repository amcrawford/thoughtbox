class LinksController < ApplicationController
  def index
    @links = current_user.links
  end

  def new
    @link = Link.new
  end

  def edit
    @link = Link.find(params["id"])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:notice] = "Successfully Edited Link"
      redirect_to links_path
    else
      flash.now[:error] = "A link must have a name and url"
      render :edit
    end
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      flash[:notice] = "Successfully added Link"
      redirect_to links_path
    else
      flash.now[:error] = "Invalid Link."
      @links = current_user.links
      render :index
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
