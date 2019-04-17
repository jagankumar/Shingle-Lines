class FavouriteController < ApplicationController
  def index
    @favourites = Favourite.where(:user_id => current_user.id)
  end
end
