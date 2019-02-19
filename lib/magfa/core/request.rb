module Magfa
    require 'uri'
    class CoreRequest
        def initialize(args = {})
            config = Magfa.configuration
            raise(ArgumentError, 'not a valid configuration class') if config.nil? || config.domain.nil? || config.password.nil? || config.username.nil?
            @API_URL = "http://sms.magfa.com/"
            @TYPE='magfaHttpService'
            @DOMAIN=config.domain
            @USERNAME=config.username
            @PASSWORD=config.password

            @FORMAT= config.format rescue 'json'
        end
    end
end