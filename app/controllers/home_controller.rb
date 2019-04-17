class HomeController < ApplicationController
  def index
    @favourites = Favourite.where(:user_id => current_user.id)
    if @favourites.present? and @favourites.count > 0
     redirect_to favourite_index_path
     else
    redirect_to images_index_path
    end

  end
end
