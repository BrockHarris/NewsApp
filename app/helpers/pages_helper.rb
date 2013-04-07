module PagesHelper
    def get_data(datatype)
      if datatype == "highvalue"
        json = JSON.parse(open("#{@source_url}/v3/highvalue?access_token=#{@access_token}&limit=#{@limit}").read)
        @result = json['data']['values']
       # @result = ActiveSupport::JSON.decode(result)
      else
        @result = "Wrong Datatype"
      end
  end
end
