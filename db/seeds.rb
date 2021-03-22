# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
10.times { Category.create(name: FFaker::HealthcareRU.doctor_specialization) }

10.times do
  Doctor.create(name: FFaker::Name.name,
                email: FFaker::Internet.email,
                password: 'password',
                category: Category.order(Arel.sql('RANDOM()')).first)
end
10.times do
  Patient.create(name: FFaker::Name.name,
              email: FFaker::Internet.email,
              password: 'password')
end