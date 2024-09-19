# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jed = {
  username: 'jsackin',
  password: '123456',
  first_name: 'Jed',
  last_name: 'Sackin',
  email: 'jsackin@gabelli.com',
}
Client.create( jed )

josh_availability = <<~EOS
BEGIN:VCALENDAR
VERSION:2.0
BEGIN:VEVENT
CLASS:PUBLIC
DESCRIPTION:Description
DTSTART:20000101T110000-0500
DTEND:20000101T170000-0500
RRULE:FREQ=WEEKLY;BYDAY=SA,SU;INTERVAL=1
LOCATION:Location
SUMMARY;LANGUAGE=en-us:Summary
END:VEVENT
BEGIN:VEVENT
CLASS:PUBLIC
DESCRIPTION:Description
DTSTART:20000101T180000-0500
DTEND:20000101T210000-0500
RRULE:FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR;INTERVAL=1
LOCATION:Location
SUMMARY;LANGUAGE=en-us:Summary
END:VEVENT
END:VCALENDAR
EOS

josh = {
  username: 'jfrank',
  password: '123456',
  first_name: 'Josh',
  last_name: 'Frank',
  phone: '2014216993',
  email: 'jfrank@gabelli.com',
  availability: josh_availability
}
Hypnotist.create( josh )
