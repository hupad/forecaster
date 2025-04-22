class FetchWeatherForecastService
  include ::OpenWeather::ApiClient

  attr_reader :lat, :lon

  def initialize(lat_lon)
    @lat = lat_lon[0]
    @lon = lat_lon[1]
  end

  def call
    parsed_response = parse_body_with_error_handling do
      connection.get("data/3.0/onecall/overview?lat=#{lat}&lon=#{lon}&appid=#{API_KEY}")
    end

    parsed_response["weather_overview"] unless parsed_response.blank?
  end
end
