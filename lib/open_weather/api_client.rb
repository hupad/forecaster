module OpenWeather
  module ApiClient
    API_KEY = ENV.fetch("OPEN_WEATHER_API_KEY", "123" )
    BASE_URL = "http://api.openweathermap.org"

    def connection
      Faraday.new(url: BASE_URL, headers: {
        "Accept" => "application/json"
      })
    end

    def parse_body_with_error_handling
      response = yield

      if !response.success?
        raise OpenWeather::Exception.new("Unsuccessful response")
      end

      if response.body.blank?
        raise OpenWeather::Exception.new("Successful response but blank body")
      end

      JSON.parse(response.body)
    rescue JSON::ParserError => e
      raise OpenWeather::Exception.new("Successful response but invalid JSON body")
      nil
    rescue Faraday::ConnectionFailed, Faraday::TimeoutError => e
      raise OpenWeather::Exception.new("Connection Failed or Timeout")
    end
  end
end
