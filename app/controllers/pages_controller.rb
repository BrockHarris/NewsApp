class PagesController < ApplicationController
  require 'open-uri'
  require 'json'
  
	def home
		@source_url = "https://api-ssl.bitly.com"
		@access_token = "4d8175b24369da3c224352ebf1687e513cc714b9"
		@nlp_key = "9f0aec9447486a35afa39bd94ca67203fde92800"
		@nlp_base = "http://access.alchemyapi.com"
		@limit = 15
		@top_links = "#{@source_url}/v3/realtime/hot_phrases?access_token=#{@access_token}&limit=#{@limit}"
    @search_url = "#{@source_url}/v3/search?access_token=#{@access_token}&query=#{@query}&limit=#{@limit}&fields=aggregate_link%2Ctitle%2Curl"
	end
end
