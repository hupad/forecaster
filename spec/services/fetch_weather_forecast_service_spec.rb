require 'rails_helper'

RSpec.describe FetchWeatherForecastService do
  it 'returns weather overview for a given zip' do
    overview = "The current weather is overcast with a temperature of 16°C and a feels-like temperature of 16°C. "

    stub_request(
      :get, "http://api.openweathermap.org/data/3.0/onecall/overview?lat=51.509865&lon=-0.118092&appid=123")
      .to_return(body: {
        "lat": 51.509865,
        "lon": -0.118092,
        "weather_overview": overview
      }.to_json)
        
    response = FetchWeatherForecastService.new([51.509865, -0.118092]).call

    expect(response).to eq(overview)
  end
end
