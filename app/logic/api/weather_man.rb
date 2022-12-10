module Api
  class WeatherMan
    attr_reader :adapter
    def initialize(adapter: nil)
      @adapter = adapter || default_adapter
    end

    def get_forecast_for(location)
      @adapter.fetch_forecast_for(location)
    end

    private

    # hard coded for simplicity, but doesn't need to be as there could be many adapters
    def default_adapter
      Api::Adapters::VisualCrossingAdapter.new
    end
  end
end