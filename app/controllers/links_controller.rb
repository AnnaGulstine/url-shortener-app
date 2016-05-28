class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
  end

  def create
    @link = Link.create(   
      user_id: params[:user_id],
      slug: params[:slug],
      target_url: params[:target_url]
    )
    redirect_to "/"    
  end
end
