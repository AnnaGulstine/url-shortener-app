class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(   
      slug: params[:slug],
      target_url: params[:target_url]
    )
    @link.standardize_target_url!
    if @link.save
      redirect_to "/"
    else
      render "/links/new"
    end
  end

  def show
    @link = Link.find_by(id: params[:id])
  end

  def edit
    @link = Link.find_by(id: params[:id])
  end

  def update
    @link = Link.find_by(id: params[:id])
    @link.update(
      slug: params[:slug],
      target_url: params[:target_url]
    )
    flash[:success] = "Link successfully updated!"
    redirect_to "/links/#{@link.id}"
  end  

  def destroy
    @link = Link.find_by(:id => params[:id])

    if @link && @link.destroy
      flash[:success] = "Link deleted successfully!"
    else
      flash[:warning] = "Unsuccessful"
    end
    redirect_to "/"
  end
end
