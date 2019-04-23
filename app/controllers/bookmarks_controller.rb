class BookmarksController < ApplicationController
  skip_before_action :authenticate_user!
  def create_bookmark
    puts params[:name]
    puts params[:img_path]
    puts params[:bookmarkCode]
    @bookmark = Bookmark.create(:name =>params[:name],:img_path => params[:img_path],:bookmark_code => params[:bookmarkCode])
    @bookmark.save!
  end
  def index
   puts params[:bookmark_code]
    @bookmark = Bookmark.where(:bookmark_code => params[:bookmark_code]).first
  end
end
