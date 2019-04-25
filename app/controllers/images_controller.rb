class ImagesController < ApplicationController
  require 'net/http'
  require 'json'
# This method call when we call home page
  def index
    @options = []
    @json_response = get_response(params)
        if params[:bookmark_code].present?
          @url = []
            @json_response.each do |foo|
              @options.push(foo['name'])
              foo['gallery_images'].each do |f|
                if foo['name'] == params[:bookmark_code]
                  puts f['name']
                  if f['name'] == params[:chaild_name]

              @url << f['img_url']
            end
            end
              end
              end
        else
        @array = []
        @json_response.each do |foo|
           @options.push(foo['name'])
          end
          end
        end

# This is method which is called by AJAX request and based selected parameter will give the response
  def child_images
    json_response = get_response(params)
    select_val = []
    urls = []
    chaild_images = []
    json_response.each do |foo|
      if foo['name'] == params[:select_value]
        foo['gallery_images'].each do |f|
          select_val << f['name']
          urls << f['img_url']
        end
      end
    end
    # rendering the response
    options = {'options' => select_val,
               'urls' => urls
    }
    render json: options
  end

  def email_to_friend
    email = params[:email]
    image = params[:imgurl]
    UserMailer.image_link_to_friend(email, image).deliver
    success = "email has been sent"
    msg = {'success' => success
    }
    render json: msg
  end
  def add_favourite
    puts params[:name]
    puts params[:user_id]
    puts params[:img_url]
    old_fav = Favourite.where(:image_name=> params[:name],:user_id => current_user.id, :img_url => params[:img_url])
    if !old_fav.present?
      fav = Favourite.create(:image_name=> params[:name],:user_id => params[:user_id], :img_url => params[:img_url])
      fav.save!
      @like = Like.where(:image_name=> params[:name],:img_url => params[:img_url])
      if @like.present?
        like_count = @like.count
        new_count =    like_count += 1
        @like.update(:like_count => new_count)
      else
      like = Like.create(:image_name=> params[:name],:img_url => params[:img_url],:like_count=> 1)
      puts like.like_count
      like.save
      end
    success = "Added as favourite"
    msg = {'success' => success
    }
    render json: msg
    else
      flash[:notice] = "You  have already added this as favourite"
      redirect_to images_index_path
      end
  end

  private
# This is private method which we can call across same class level and getting api response to this

  def get_response(params)
    zip = params[:zip_code]
    zip = params[:zip_code].present? ?  params[:zip_code] : 43659
   url = "https://mdms.owenscorning.com/api/v1/product/shingles?zip=#{zip}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    return JSON.parse(response)
  end

end