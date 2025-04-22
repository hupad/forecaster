class FetchLatLongByZipService
  include ::OpenWeather::ApiClient

  attr_reader :zip

  def initialize(zip)
    @zip = zip
  end

  def call
    parsed_response = parse_body_with_error_handling do
      connection.get("geo/1.0/zip?zip=#{zip}&appid=#{API_KEY}")
    end

    return [parsed_response["lat"], parsed_response["lon"]] unless parsed_response.blank?
  end
end
