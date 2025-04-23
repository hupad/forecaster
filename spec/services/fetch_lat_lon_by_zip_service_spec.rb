require 'rails_helper'

RSpec.describe FetchLatLongByZipService do
  it 'returns lat and lon for a given zip' do
    zip = "90210"

    stub_request(
      :get, "http://api.openweathermap.org/geo/1.0/zip?zip=#{zip}&appid=123")
      .to_return(body: {
          "zip": "90210",
          "name": "Beverly Hills",
          "lat": 34.0901,
          "lon": -118.4065,
          "country": "US"
        }.to_json)
        
    response = FetchLatLongByZipService.new(zip).call

    expect(response).to eq([34.0901, -118.4065])
  end
end
