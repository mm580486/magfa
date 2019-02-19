module Magfa
    class EnqueueSend < Magfa::CoreRequest
        include Validatable
        attr_accessor :to, :message,:from,:mclass,:chkMessageId,:encoding,:UDH
        attr_reader   :response,:config
        validates_presence_of :message
        validates_presence_of :to
        validates_presence_of :from

        validates_length_of :message, :within => 1..140
        validates_format_of :from, :with => /^\d*$/, :if => Proc.new { !from.nil? }
        validates_format_of :to, :with => /^\d*$/, :if => Proc.new { !to.nil? }

        
        def initialize(args = {})
          super
          @to    = args.fetch(:to)
          
          if @to.kind_of?(Array)
            @valid_receptor= false if @to.length > 200
            @to      = @to.join(',') 
          end

          @to          = @to.ctsd
          @mclass          = args.fetch(:mclass,nil)
          @message         = args.fetch(:message)
          @message         = @message.ctsd if args.fetch(:standard_digit,false)
          @chkMessageId    = args.fetch(:chkMessageId,nil) 
          @encoding        = args.fetch(:encoding,nil)
          @UDH             = args.fetch(:UDH,nil)

          @from        = args.fetch(:from)

          @response    = EnqueueResponse.new
          @message_size=@message.multibyte? ? 268:612
          @valid_message= (@message.length > @message_size ) ? false:true
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
                   domain: @DOMAIN,
                   username: @USERNAME,
                   password: @PASSWORD,
                   to: @to ,
                   service: 'Enqueue',
                   message: URI::encode(@message),
                   mclass: @mclass,
                   chkMessageId: @chkMessageId,
                   encoding: @encoding,
                   UDH: @UDH,
                   from: @from
                   )
              @response.validate(response.body)
        end
        
      
    end
end

# VNjdKnRmADIQmxke
