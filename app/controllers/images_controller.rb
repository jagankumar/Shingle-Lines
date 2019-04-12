class ImagesController < ApplicationController
  require 'net/http'
  require 'json'

  def index
    url = 'https://mdms.owenscorning.com/api/v1/product/shingles?zip=43659'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @json_response = JSON.parse(response)
    puts @json_response
    @options = []
    @json_response.each do |foo|
      @options << foo['name']
    end
  end
end