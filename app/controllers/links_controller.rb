class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(   
      user_id: params[:user_id],
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

  def destroy
    @link = Link.find_by(:id => params[:id], :user_id => current_user.id)

    if @link && @link.destroy
      flash[:success] = "Link destroyed successfully"
    else
      flash[:warning] = "Unsuccessful"
    end
    redirect_to "/"
  end
end
