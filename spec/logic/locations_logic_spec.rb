require 'rails_helper'

RSpec.describe LocationsLogic do
  let(:location) { 'Chicago, IL' }
  let(:logic) { LocationsLogic.new(location: location) }

  it 'instantiates' do
    expect(logic).to be_a LocationsLogic
  end

  describe '#fetch_forecast' do
    let(:weather_api){ Api::WeatherMan.new }
    
    context 'when location is a city and state' do
      let(:weather_vane_api) { Api::WeatherMan.new }

      it 'will call the correct api' do
        allow(Api::WeatherMan).to receive(:new).and_return(weather_vane_api)
        expect(weather_api).to receive(:get_forecast_for).with(location)
        logic
      end
    end
  end
end