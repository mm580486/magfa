module Magfa
    class GetRealMessageStatusSend < Magfa::CoreRequest
      include Validatable
        attr_reader   :response,:config
        attr_accessor :messageId
        validates_format_of :messageId, :with => /^\d*$/, :if => Proc.new { !messageId.nil? }
        validates_presence_of :messageId

        def initialize(args = {})
          super
          @response    = GetRealMessageStatusResponse.new
          @messageId   = args.fetch(:messageId)

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
                   service: 'getRealMessageStatus',
                   domain: @DOMAIN,
                   username: @USERNAME,
                   password: @PASSWORD,
                   messageId: @messageId
                   )
              @response.validate(response.body)
        end
        
      
    end
end

# VNjdKnRmADIQmxke
