require 'rails_helper'

RSpec.describe WeatherController, type: :controller do
  describe 'when valid zip code is entered' do
    it 'should return forecast data' do
      forcast_data = {
        data: "The current weather is overcast with a temperature of 16°C and a feels-like temperature of 16°C.",
        cached: false
      }

      service_instance = instance_double(OpenWeatherApiService)
      allow(OpenWeatherApiService).to receive(:new).and_return(service_instance)
      allow(service_instance).to receive(:call).and_return(forcast_data)

      post :forecast, params: { address: { zip: "95014" } }

      expect(assigns(:forecast)).to eq("The current weather is overcast with a temperature of 16°C and a feels-like temperature of 16°C.")
      expect(assigns(:cached)).to be_falsy
    end
  end

  describe "when invalid zip code is entered" do
    it 'should return an error' do
      service_instance = instance_double(OpenWeatherApiService)
      allow(OpenWeatherApiService).to receive(:new).and_return(service_instance)
      allow(service_instance).to receive(:call).and_raise(OpenWeather::Exception.new("Unsuccessful response"))

      post :forecast, params: { address: { zip: "abc" } }

      expect(flash[:alert]).to eq("Error fetching data: Unsuccessful response")
    end
  end
end
