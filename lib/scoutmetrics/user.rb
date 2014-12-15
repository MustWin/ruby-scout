module ScoutMetrics

  class User

    attr_accessor :id,  :signup_date, :return_date, :active

    # Create a User record with the id passed in for posting to Scout Metrics
    def self.find(id)
      new(id: id)
    end

    def initialize(params)
      self.id = params[:id]
      self.signup_date = params[:signup_date]
      self.return_date = params[:return_date]
      self.active = params[:active]
    end

    # Override save method to post the information to Scout Metrics
    def save
      params = {}
      params[:signup_date] = signup_date if field_present?(signup_date)
      params[:return_date] = return_date if field_present?(return_date)
      params[:active] = active if field_present?(active)
      post_update(id, params)
    end

    # Posts signup date for this user (if it doesn't exist yet the "AppUser" will be created)
    def signup(signup_date=nil)
      self.signup_date = signup_date || Time.new
      save
    end

    # Tells Scout Metrics the latest login date for this "AppUser"
    def report_login(return_date=nil)
      self.return_date = return_date || Time.new
      save
    end

    # Activate an "AppUser" on Scout Metrics
    # (Should we also reset their signup_date & return_date?)
    def activate
      self.active = true
      save
    end

    # Deactivate an "AppUser" on Scout Metrics
    def deactivate
      self.active = false
      save
    end

    private

    def field_blank?(field)
      field.nil? || field.empty?
    end

    def field_present?(field)
      !field_blank?(field)
    end

    # @return [Json] Returns a msg for the transaction and the status of the request
    # @return msg explanation of outcome
    def post_update(id, params)
      ScoutMetrics::Request.new(:put, "/app_users/#{id}", { app_user: params })
    end

  end

end