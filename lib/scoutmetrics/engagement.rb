module ScoutMetrics

  class Engagement

    # Adds an "Engagement" to Scout Metrics
    # For example "Liked us on Facebook"
    # 
    # @param engagement_params [Hash] Name of the engagement
    # @engagement_params name [String] Describes the engagement
    # @return [Json] Returns a msg for the transaction and the status of the request
    # @return msg explanation of outcome
    def self.create_category(name)
      ScoutMetrics::Request.new(:post, '/engagements', { engagement: { name: name } })
    end

    # Add/Update an "EngagementInstance" on Scout Metrics
    # This tells Scout Metrics that a user performed an "Engagement" on a given date
    # For example: Someone "Liked us on Facebook" on Dec 12th
    # (We do not track who performed the action)
    #
    # @param name [String] Describes the engagement
    # @param date_recorded [Date] Day the engagement happened, defaults to now
    #
    # @return [Json] Returns a msg for the transaction and the status of the request
    # @return msg explanation of outcome
    def self.create(name, date_recorded=nil)
      date_recorded ||= Time.new
      params = { engagement: { name: name },
                 engagement_instance: { date_recorded: date_recorded } }
      ScoutMetrics::Request.new(:post, '/engagements/add_instance', params)
    end

  end

end