# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

started_seeding = Time.now

example_coordinates = { lng: -73.985240, lat: 40.765450 }

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
  availability: josh_availability,
  bio: '<p><b>Josh F.</b> is the Founder and Director of Psychedelic Hypnosis. Josh cut his teeth hypnotizing tourists on the Coney Island Boardwalk and in Washington Square Park. Today he presides over a thriving private hypnosis practice serving clients across five boroughs and three states. Josh is also proud to serve Fairfield County clients as Connecticut Registered Hypnotist #0000635.</p>',
}
josh = Hypnotist.create( josh_params )

jed_params = {
  username: 'jsackin',
  password: '123456',
  first_name: 'Jed',
  last_name: 'Sackin',
  email: 'jsackin@gabelli.com',
  phone: '2035243045',
  sms_consent: false,
}
jed = Client.create( jed_params )
ReleaseSignature.create( client: jed, e_signature: jed.full_name, date: Date.today )
Credit.create( client: jed, hypnotist: josh, value: 10, paid: 1000, date: Date.today - rand( 60 ) )
5.times do
  random_appointment_date = DateTime.now + rand( 60 )
  random_appointment_time = ( 18..20 ).to_a.sample
  Appointment.create( client: jed, hypnotist: josh, start: random_appointment_date.change( { hour: random_appointment_time, min: 0, sec: 0 } ), end: random_appointment_date.change( { hour: random_appointment_time + 1, min: 0, sec: 0 } ) )
end

ryoji_params = {
  username: 'rdohi',
  password: '123456',
  first_name: 'Ryoji',
  last_name: 'Dohi',
  email: 'rdohi@gabelli.com',
}
ryoji = Client.create( ryoji_params )
ReleaseSignature.create( client: ryoji, e_signature: ryoji.full_name, date: Date.today )
Credit.create( client: ryoji, hypnotist: josh, value: 10, paid: 1000, date: Date.today - rand( 60 ) )
5.times do
  random_appointment_date = DateTime.now + rand( 60 )
  random_appointment_time = ( 11..20 ).to_a.sample
  Appointment.create( client: ryoji, hypnotist: josh, start: random_appointment_date.change( { hour: random_appointment_time, min: 0, sec: 0 } ), end: random_appointment_date.change( { hour: random_appointment_time + 1, min: 0, sec: 0 } ) )
end

matt_params = {
  username: 'madelhardt',
  password: '123456',
  first_name: 'Matthew',
  last_name: 'Adelhardt',
  email: 'madelhardt@gabelli.com',
}
matt = Client.create( matt_params )
ReleaseSignature.create( client: matt, e_signature: matt.full_name, date: Date.today )
Credit.create( client: matt, hypnotist: josh, value: 10, paid: 1000, date: Date.today - rand( 60 ) )
5.times do
  random_appointment_date = DateTime.now + rand( 60 )
  random_appointment_time = ( 11..20 ).to_a.sample
  Appointment.create( client: matt, hypnotist: josh, start: random_appointment_date.change( { hour: random_appointment_time, min: 0, sec: 0 } ), end: random_appointment_date.change( { hour: random_appointment_time + 1, min: 0, sec: 0 } ) )
end

marcia_params = {
  username: 'msuresky',
  password: '123456',
  first_name: 'Marcia',
  last_name: 'Suresky',
  phone: '516 476 5985',
  sms_consent: true,
}
marcia = Client.create( marcia_params )
ReleaseSignature.create( client: marcia, e_signature: marcia.full_name, date: Date.today )
Credit.create( client: marcia, hypnotist: josh, value: 10, paid: 1000, date: Date.today - rand( 60 ) )
5.times do
  random_appointment_date = DateTime.now + rand( 14 )
  random_appointment_time = ( 11..20 ).to_a.sample
  Appointment.create( client: marcia, hypnotist: josh, start: random_appointment_date.change( { hour: random_appointment_time, min: 0, sec: 0 } ), end: random_appointment_date.change( { hour: random_appointment_time + 1, min: 0, sec: 0 } ) )
end

david = Client.create( username: 'dfrank', password: '123456', first_name: 'David', last_name: 'Frank', phone: '2014216995' )
Credit.create( hypnotist: josh, client: david, value: 2, paid: 100, date: Date.today )

done_seeding = Time.now

puts "Seeded in #{ done_seeding - started_seeding } seconds"
