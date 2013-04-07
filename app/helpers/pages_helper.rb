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
  def parsely
    @pjson = JSON.parse(open("#{@parsely_base}/shares/posts?apikey=#{@parsely_api_key}").read)
   # @purl =  @pjson['data']['url']
    #@ptitle = @pjson['data']['title']
    #@pthumb = @pjson['data']['thumb_url_medium']
    @presult = @pjson['data']
  end
  
  def sentiment_return(title, url, thumb)
   sentiment= get_sentiment(url) 
  if sentiment == "positive" 
     @sreturn = link_to title, url, {:style => 'color: #008000'} 
  elsif sentiment == "negative" 
    @sreturn = link_to title, url, {:style => 'color: #FF0000'} 
  else 
    @sreturn = link_to title, url 
   end 
   @sreturn += image_tag(thumb, :size => "100x100") unless thumb == nil
   @sreturn += "<br />".html_safe
   return @sreturn.html_safe
  end
end
