# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

started_seeding = Time.now

josh_availability = <<~EOS
BEGIN:VCALENDAR
VERSION:2.0
BEGIN:VEVENT
CLASS:PUBLIC
DESCRIPTION:Description
DTSTART:20000101T180000-0500
DTEND:20000101T210000-0500
RRULE:FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR;INTERVAL=1
LOCATION:Location
SUMMARY;LANGUAGE=en-us:Summary
END:VEVENT
BEGIN:VEVENT
CLASS:PUBLIC
DESCRIPTION:Description
DTSTART:20000101T110000-0500
DTEND:20000101T170000-0500
RRULE:FREQ=WEEKLY;BYDAY=SA,SU;INTERVAL=1
LOCATION:Location
SUMMARY;LANGUAGE=en-us:Summary
END:VEVENT
END:VCALENDAR
EOS
josh_params = {
  username: 'jfrank',
  password: '123456',
  first_name: 'Josh',
  last_name: 'Frank',
  phone: '2014216993',
  email: 'jfrank@gabelli.com',
  availability: josh_availability
}
josh = Hypnotist.create( josh_params )

jed_params = {
  username: 'jsackin',
  password: '123456',
  first_name: 'Jed',
  last_name: 'Sackin',
  email: 'jsackin@gabelli.com',
}
jed = Client.create( jed_params )
ReleaseSignature.create( client: jed, e_signature: jed.full_name, date: Date.today )
Credit.create( client: jed, hypnotist: josh, value: 10, paid: 1000, date: Date.today - rand( 30 ) )
2.times do
  random_appointment_date = DateTime.now + rand( 30 )
  Appointment.create( client: jed, hypnotist: josh, start: random_appointment_date.change( { hour: 18, min: 0, sec: 0 } ), end: random_appointment_date.change( { hour: 19, min: 0, sec: 0 } ) )
end

ryoji_params = {
  username: 'rdohi',
  password: '123456',
  first_name: 'Ryoji',
  last_name: 'Dohi',
  email: 'rdohi@gabelli.com',
}
ryoji = Client.create( ryoji_params )

done_seeding = Time.now

puts "Seeded in #{done_seeding - started_seeding} seconds"
