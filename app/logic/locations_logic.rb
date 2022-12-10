class LocationsLogic
  attr_accessor :location, :forecast

  def initialize(location: )
    @location = location
    fetch_forecast
  end
  def fetch_forecast(location = @location)
    @forecast ||= Api::WeatherMan.new.get_forecast_for(location)
  end

  # "Address"=>"Chicago",
  #   "Date time"=>"11/28/2022",
  #   "Latitude"=>"41.8843",
  #   "Longitude"=>"-87.6324",
  #   "Resolved Address"=>"Chicago, IL, United States",
  #   "Name"=>"Chicago",
  #   "Wind Direction"=>"162.8",
  #   "Minimum Temperature"=>"30.8",
  #   "Maximum Temperature"=>"35.7",
  #   "Temperature"=>"33.1",
  #   "Wind Speed"=>"7.4",
  #   "Cloud Cover"=>"68.9",
  #   "Heat Index"=>nil,
  #   "Chance Precipitation (%)"=>"33.3",
  #   "Precipitation"=>"0.0",
  #   "Sea Level Pressure"=>"1035.6",
  #   "Snow Depth"=>"0.0",
  #   "Snow"=>"0.0",
  #   "Relative Humidity"=>"50.8",
  #   "Wind Gust"=>"26.4",
  #   "Wind Chill"=>"24.5",
  #   "Conditions"=>"Partially cloudy"}
  def high(day_hash)
    day_hash['Maximum Temperature']
  end

  def low(day_hash)
    day_hash['Minimum Temperature']
  end

  def date(day_hash)
    day_hash['Date time']
  end

  def highs_and_lows
      [
        { name: 'Highs', data: highs },
        { name: 'Lows',  data: lows }
      ]
  end

  def highs
    h = {} # TODO: improve
    @forecast[0..6].each{ |day| h[date(day)] = high(day)}
    h
  end

  def lows
    h = {} # TODO: improve
    @forecast[0..6].each{ |day| h[date(day)] = low(day)}
    h
  end

end