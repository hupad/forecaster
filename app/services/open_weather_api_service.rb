class OpenWeatherApiService
  attr_reader :zip

  CACHE_TTL = 30.minutes.freeze

  def initialize(address)
    @zip = address[:zip]
  end

  def call
    cached_result = Rails.cache.read(cache_key)
    
    if cached_result && fresh?(cached_result[:fetched_at])
      cached_result.merge(cached: true)
    else
      data = FetchWeatherForecastService.new(lat_lon).call

      forecast_data = {
        data: data,
        fetched_at: Time.current,
        cached: false
      }
      Rails.cache.write(cache_key, forecast_data)
      forecast_data
    end
  end

  private

  def cache_key
    "#{zip}_weather_forecast"
  end

  def fresh?(timestamp)
    Time.current - timestamp < CACHE_TTL
  end

  def lat_lon
    Rails.cache.fetch("#{zip}_lat_lon", expires_in: 1.day) do
      FetchLatLongByZipService.new(zip).call
    end
  end
end
