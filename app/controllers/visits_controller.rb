class VisitsController < ApplicationController
  def create
    @link = Link.find_by(slug: params[:slug])
    redirect_to "http://#{@link.target_url}"
  end
end
