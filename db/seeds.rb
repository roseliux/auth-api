# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
timestamp = DateTime.parse(2.weeks.ago.to_s).to_time.strftime("%F %T")

User.create(
  uid:                'rox@mail.com',
  email:              'rox@mail.com',
  nickname:           'roseliux',
  name:               'Rocela Durazo',
  provider:           'email',
  confirmed_at:       timestamp,
  created_at:         timestamp,
  updated_at:         timestamp,
  encrypted_password: User.new.send(:password_digest, 'secret123')
)