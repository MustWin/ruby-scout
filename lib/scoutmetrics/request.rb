require 'http'

module ScoutMetrics

  class Request

    DOMAIN = 'https://scoutmetrics.herokuapp.com/api/v1'

    def initialize(method, route, params)
      params[:token] = ScoutMetrics.access_token
      route = "#{DOMAIN}#{route}"
      puts "METHOD: #{method}"
      puts "ROUTE: #{route}"
      puts 'PARAMS'
      puts params
      response = HTTP.send(method, route, json: params)
    end

  end

end