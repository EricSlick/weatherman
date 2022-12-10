require 'httparty'

module Api
  module Adapters
    class VisualCrossingAdapter
      
      def initialize
        @forecast_base_url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/weatherdata/forecast"
      end

      def fetch_forecast_for(location)
        response = HTTParty.get(@forecast_base_url, query: query_params(location))
        convert_response_to_hash(response)
      end

      private

      def query_params(location)
        {
          'key': 'MKMN8EGBELXJ2WTY9JKKA8AM5', # Rails.application.credentials.visual_crossing[:key],
          'locations': location,
          'aggregateHours': 24,
          'unitGroup': 'us',
          'shortColumnNames': 'false',
          'contentType': 'csv'
        }
      end

      def convert_response_to_hash(response)
        CSV.parse(response.body, headers: :first_row).map(&:to_h)
      end
    end
  end
end
