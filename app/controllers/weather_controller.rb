class WeatherController < ApplicationController
  def new
    @address = Address.new
  end

  def forecast
    @address = Address.new(permit_params)

    if @address.valid?
      result = OpenWeatherApiService.new(permit_params).call
      @forecast = result[:data]
      @cached = result[:cached]
    end

  rescue OpenWeather::Exception => e
    flash.now[:alert] = "Error fetching data: #{e.message}"
  ensure
    render :new
  end

  private

  def permit_params
    params.require(:address).permit(:zip)
  end
end
