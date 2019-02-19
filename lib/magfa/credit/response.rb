module Magfa
    class CreditResponse
      attr_reader :response, :status,:statusmessage
     
      def validate(response = nil)
        @response = response
        perform_validation
        return self
      end
  
      def valid?
        @valid
      end
      
      
      def full_message_errors
        # return Magfa::ERRORS[@response.to_s]
      end
  
      private
      
      def perform_validation
        raise ArgumentError, 'not a valid response' if @response.nil?
        @valid = (@response.to_i == 200)
      end
      
    end
    
  end