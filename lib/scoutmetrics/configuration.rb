module ScoutMetrics

  module Configuration

    VALID_OPTIONS_KEYS = [
      :access_token,
      :environment
    ].freeze

    attr_accessor *VALID_OPTIONS_KEYS

    # Create a hash of options and their values
    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    def configure
      yield self
    end

  end

end