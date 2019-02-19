module Magfa
    module NumberHelper
     def ctpd
         return self.to_s.tr('0123456789','۰١۲۳۴۵۶۷۸۹')
     end
     
    end
    
    module StringHelper
      
     def ctsd
         return self.to_s.tr('۰١۱۲۳۴۵۶۷۸۹،١٢٣٤٥٦٧٨٩٠','01123456789,1234567890')
     end
     
     def ctpd
         return self.to_s.tr('01123456789,','۰١۱۲۳۴۵۶۷۸۹،')
     end
     
     def strip_emoji
        str = self.force_encoding('utf-8').encode
		arr_regex=[/[\u{1f600}-\u{1f64f}]/,/[\u{2702}-\u{27b0}]/,/[\u{1f680}-\u{1f6ff}]/,/[\u{24C2}-\u{1F251}]/,/[\u{1f300}-\u{1f5ff}]/]
		arr_regex.each do |regex|
			str = str.gsub regex, ''
		end
		return str
     end
     
    end
    
end

class Integer
  include Magfa::NumberHelper
end

class String
  include Magfa::StringHelper
end