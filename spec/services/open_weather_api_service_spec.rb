require 'rails_helper'

RSpec.describe OpenWeatherApiService do
  let(:zip) { "95014" }
  let(:lat_lon) { [51.509865, -0.118092]  }
  let(:t) { Time.local(2025, 04, 22, 10, 5, 0) }
  before { Timecop.freeze(t) }

  describe "when data is not cached" do
    it "should return data from the external service" do
      overview = "The current weather is overcast with a temperature of 16°C and a feels-like temperature of 16°C."

      allow(Rails.cache).to receive(:fetch).with("#{zip}_lat_lon", expires_in: 1.day) { lat_lon }
      allow(Rails.cache).to receive(:read).with("#{zip}_weather_forecast") { nil }
      
      expect(Rails.cache).to receive(:write).with("#{zip}_weather_forecast", {
        data: overview,
        cached: false,
        fetched_at: t
      })

      stub_request(
        :get, "http://api.openweathermap.org/data/3.0/onecall/overview?lat=#{lat_lon[0]}&lon=#{lat_lon[1]}&appid=12908c39e26307fc22d835c57e87831d")
        .to_return(body: {
          "lat": 51.509865,
          "lon": -0.118092,
          "weather_overview": overview
        }.to_json)
        
      response = OpenWeatherApiService.new({zip: zip}).call

      expect(response[:data]).to eq(overview)
    end
  end

  describe "when cache is available" do
    it "should return data from the cache" do
      overview = "from cache"
      forecast = {
        data: overview,
        cached: true,
        fetched_at: t
      }

      allow(Rails.cache).to receive(:fetch).with("#{zip}_lat_lon", expires_in: 1.day) { lat_lon }
      allow(Rails.cache).to receive(:read).with("#{zip}_weather_forecast") { forecast }

      response = OpenWeatherApiService.new({zip: zip}).call

      expect(response[:data]).to eq(overview)
    end
  end
end