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
  
  def get_title(url)
    json = JSON.parse(open("#{@source_url}/v3/link/info?access_token=#{@access_token}&link=#{url}").read)
    @title = json['data']
    return @title
  end
  def get_sentiment(url)
    json = JSON.parse(open("#{@nlp_base}/calls/url/URLGetTextSentiment?apikey=#{@nlp_key}&url=#{url}&outputMode=json").read)
    @sentiment = json['docSentiment']['type']
  end
end
