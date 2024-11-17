require "#{ Rails.root }/config/initializers/twilio"

namespace :twilio do

  desc 'Lists Twilio/SMS message history'
  task :history do
    include TwilioModule
    TwilioModule.client.api.v2010.messages.list( limit: 20 ).each do | message |
      puts message
    end
  end

  # desc 'Sends a practice reminder to all consenting clients with upcoming appointments via Twilio/SMS'
  # task :send_practice_reminders do
  #   include TwilioModule
  #   Client.all.select( &:send_reminder? ).each do | client |
  #     practice_reminder = ''
  #     TwilioModule.send( client.phone, practice_reminder )
  #   end
  # end

  # desc 'Prints "something" five times'
  # task :something do
  #   5.times { puts "something" }
  # end

end