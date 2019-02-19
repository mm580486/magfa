
%w(faraday faraday_middleware validatable i18n magfa/version).each do |dependency|
  require dependency
end
require 'magfa/meaning'
begin
  require "pry"
rescue LoadError
 
end
module Magfa
  I18n.config.available_locales = :en



  class Error < StandardError; end
     
  class << self
    attr_accessor :configuration
  end
  
  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end

  class Configuration
    attr_accessor :username,:password,:domain,:api,:debugmode
   
    def initialize
  
    end
    
  end

end


%w(version core/request helper enqueue/enqueue credit/credit messageStatus/messageStatus).each do |identify|
  require_relative "magfa/#{identify}"
end