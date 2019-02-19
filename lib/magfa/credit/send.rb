module Magfa
    class CreditSend < Magfa::CoreRequest
        attr_reader   :response,:config
        
        def initialize(args = {})
          super
          @response    = CreditResponse.new
        end
        
        def valid_message?
          @valid_message
        end
        
        def valid_receptor?
          @valid_receptor
        end
        
        def call
            connection = Faraday.new(url: "#{@API_URL}") do |faraday|
              faraday.adapter Faraday.default_adapter
              faraday.response @FORMAT.to_sym
            end
            
              response = connection.get(@TYPE,
                   service: 'getCredit',
                   domain: @DOMAIN,
                   username: @USERNAME,
                   password: @PASSWORD,
                   )
              @response.validate(response.body)
        end
        
      
    end
end

# VNjdKnRmADIQmxke
