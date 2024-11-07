include Twilio

namespace :sms do

  desc 'Prints "something" five times'
  task :something do
    5.times { puts "something" }
  end

  # desc 'Sends a practice reminder to all consenting clients with upcoming appointments via Twilio/SMS'
  # task :send_practice_reminders do
  #   Client.all.select( &:send_reminder? ).each do | client |
  #     practice_reminder = ''
  #     Twilio.send( client.phone, practice_reminder )
  #   end
  # end

end