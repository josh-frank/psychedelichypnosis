require 'net/http'
require "#{ Rails.root }/config/initializers/twilio"
include TwilioModule

scheduler = Rufus::Scheduler.new

every_day_at_9am = '0 9 * * *'
every_hour_between_9am_to_9pm = '0 9-20 * * *'

# scheduler.cron every_day_at_9am do
#   Appointment.where( start: Date.today.all_day ).each do | appointment_today |
#     if appointment_today.client.send_reminder?
#       TwilioModule.send( appointment_today.client.phone, "A reminder: you have a #{ appointment_today.virtual ? 'virtual ' : '' }hypnosis session scheduled today at #{ appointment_today.format_start_time }. Check your profile for more details. (Reply HELP at any time)" )
#     end
#   end
# end

# scheduler.cron every_hour_between_9am_to_9pm do
# end
