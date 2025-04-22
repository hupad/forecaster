class OpenWeather::Exception < StandardError
  def initialize(msg="")
    @msg = msg
    super(msg)
  end
end