require 'http'

module ScoutMetrics

  class Request

    def initialize(method, route, params)
      params[:token] = ScoutMetrics.access_token

      return if params[:token].nil? || params[:token].empty?

      route = "#{domain(ScoutMetrics.environment)}#{route}"
      puts "METHOD: #{method}"
      puts "ROUTE: #{route}"
      puts 'PARAMS'
      puts params
      HTTP.send(method, route, json: params)
    end

    def domain(environment=nil)
      if environment.to_s == 'staging'
        'http://54.184.188.168/api/v1'
      else
        'http://scoutmetrics.com/api/v1'
      end
    end

  end

end