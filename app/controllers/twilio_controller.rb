class TwilioController < ApplicationController

  include Twilio

	skip_before_action :verify_authenticity_token
  skip_before_action :authorize, only: [ :respond ]

  def respond
    # response = Twilio::TwiML::MessagingResponse.new
    # response.message do | message |
    #   message.body( "Hello and thanks for contacting Psychedelic Hypnosis! A hypnotist will respond to you shortly. Reply STOP or HELP at any time. Remember: #{ @@affirmations.sample.downcase }" )
    # end

    # logger = Logger.new( "#{ Rails.root }/log/twilio.log" )
    # logger.debug( params )

    Twilio.send( params[ "From" ], "Hello! Thanks for contacting Psychedelic Hypnosis!\n\n\nA hypnotist will respond to you shortly. Reply STOP or HELP at any time.\n\n\nRemember: #{ @@affirmations.sample.downcase }" )
    Twilio.send( '+12014216993', "From: #{ params[ "From" ] }\nContent: #{ params[ "Body" ] }" )
    render json: { from: params[ "From" ], body: params[ "Body" ] }
  end

end
