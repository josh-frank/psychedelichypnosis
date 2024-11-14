require 'rubygems'
require 'twilio-ruby'

module TwilioModule

  @twilio_client = Twilio::REST::Client.new( ENV[ 'TWILIO_ACCOUNT_SID' ], ENV[ 'TWILIO_AUTH_TOKEN' ] )
  @twilio_phone_number = "+18337849766"
  @logger = Logger.new( "#{ Rails.root }/log/twilio.log" )

  def self.client
    @twilio_client
  end

  def self.log( message )
    @logger.debug( message )
  end

  def self.send( recipient_phone_number, content )
    begin
      twilio_message = @twilio_client.api.account.messages.create(
        from: @twilio_phone_number,
        to: recipient_phone_number, 
        body: content
      )
    rescue Twilio::REST::TwilioError => error
      @logger.debug( error )
      error.message
    end
  end

end
