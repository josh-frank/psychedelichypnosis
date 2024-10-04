require 'rubygems'
require 'twilio-ruby'

module Twilio
  
  @twilio_client = Twilio::REST::Client.new( ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'] )
  @twilio_phone_number = "+18337849766"
  
  def self.send( recipient_phone_number, content ) 
    begin
      twilio_message = @twilio_client.api.account.messages.create(
        from: @twilio_phone_number,
        to: recipient_phone_number, 
        body: content
      )
      return twilio_message
    rescue Twilio::REST::TwilioError => error
      return error.message
    end
  end

end
