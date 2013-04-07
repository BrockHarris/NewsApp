module PagesHelper
    def get_data(datatype)
      if datatype == "highvalue"
        json = JSON.parse(open("#{@source_url}/v3/highvalue?access_token=#{@access_token}&limit=#{@limit}").read)
        @result = json['data']['values']
      elsif datatype == "toplinks"
        json = JSON.parse(open(@top_links).read)
        @result = json['data']['phrases']
      else
        @result = "Wrong Datatype"
      end
  end
  
  def get_lang(url)
    json = JSON.parse(open("#{@source_url}/v3/link/language?access_token=#{@access_token}&link=#{url}").read)
    @lang = json['data']['languages'][url]
  end
end
