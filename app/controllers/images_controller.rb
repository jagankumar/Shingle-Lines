class ImagesController < ApplicationController
  require 'net/http'
  require 'json'

  def index
    url = 'https://mdms.owenscorning.com/api/v1/product/shingles?zip=43659'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    json_response = JSON.parse(response)
    puts json_response
    @array = []
    @options = []
    json_response.each do |foo|
      @array.push(foo['hero_1600x565_url'])
      @options.push(foo['proper_name'])
    end

    # puts @array
  end
end