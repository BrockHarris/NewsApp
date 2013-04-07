class PagesController < ApplicationController
	def home
		@source_url = "https://api-ssl.bitly.com"
		@access_token = "4d8175b24369da3c224352ebf1687e513cc714b9"

		@return_top_links = "#{@source_url}/v3/realtime/bursting_phrases?access_token=#{@access_token}&limit=10"

	end
end
