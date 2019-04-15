class ImagesController < ApplicationController
  require 'net/http'
  require 'json'
# This method call when we call home page
  def index
    @json_response = get_response
    @array = []
    @options = []
    @json_response.each do |foo|
      # @array.push(foo['hero_1600x565_url'])
      @options.push(foo['name'])
    end
  end
# This is method which is called by AJAX request and based selected parameter will give the response
  def child_images
    puts params[:select_value]
    json_response = get_response
    select_val = []
    urls = []
    chaild_images = []
    json_response.each do |foo|
      if foo['name'] == params[:select_value]
        puts foo['name']
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

  private
# This is private method which we can call across same class level and getting api response to this
  def get_response
    url = 'https://mdms.owenscorning.com/api/v1/product/shingles?zip=43659'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    return JSON.parse(response)
  end

end