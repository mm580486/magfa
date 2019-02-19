module Magfa
    class GetMessageIdSend < Magfa::CoreRequest
      include Validatable
        attr_reader   :response,:config
        attr_accessor :chkMessageId
        validates_format_of :chkMessageId, :with => /^\d*$/, :if => Proc.new { !chkMessageId.nil? }
        validates_presence_of :chkMessageId

        def initialize(args = {})
          super
          @response    = GetMessageIdResponse.new
          @chkMessageId   = args.fetch(:chkMessageId)

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
                   service: 'getMessageId',
                   domain: @DOMAIN,
                   username: @USERNAME,
                   password: @PASSWORD,
                   chkMessageId: @chkMessageId
                   )
              @response.validate(response.body)
        end
        
      
    end
end

# VNjdKnRmADIQmxke
