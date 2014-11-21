module ScoutMetrics

  class User

    # Adds an "AppUser" to Scout Metrics
    #
    # @param id [Integer] Uniquely identifies user
    # @param signup_date [DateTime] Date the user signed up, defaults to now
    #
    # @return [Json] Returns a msg for the transaction and the status of the request
    # @return msg explanation of outcome
    def self.create(id, signup_date=nil)
      signup_date ||= Time.new
      post_update(id, { signup_date: signup_date })
    end

    # Update an "AppUser" on Scout Metrics
    #
    # @param id [Integer] Uniquely identifies user
    # @param return_date [DateTime] Latest time returning to your site, defaults to now
    #
    # @return [Json] Returns a msg for the transaction and the status of the request
    # @return msg explanation of outcome
    def self.update(id, return_date=nil)
      return_date ||= Time.new
      post_update(id, { return_date: return_date })
    end

    # Activate an "AppUser" on Scout Metrics
    # (Should we also reset their signup_date & return_date?)
    #
    # @param id [Integer] Uniquely identifies user
    #
    # @return [Json] Returns a msg for the transaction and the status of the request
    # @return msg explanation of outcome
    def self.activate(id)
      post_update(id, { active: true })
    end

    # Deactivate an "AppUser" on Scout Metrics
    #
    # @param id [Integer] Uniquely identifies user
    #
    # @return [Json] Returns a msg for the transaction and the status of the request
    # @return msg explanation of outcome
    def self.deactivate(id)
      post_update(id, { active: false })
    end

    private

    def self.post_update(id, params)
      ScoutMetrics::Request.new(:put, "/app_users/#{id}", { app_user: params })
    end

  end

end