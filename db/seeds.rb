AdminUser.create!(phone_number: '+380686363616', password: 'password', password_confirmation: 'password')

10.times { Category.create(name: FFaker::HealthcareRU.doctor_specialization) }

10.times do
  Doctor.create(name: FFaker::Name.name,
                phone_number: FFaker::PhoneNumberUA.international_mobile_phone_number,
                password: 'password',
                category: Category.order(Arel.sql('RANDOM()')).first)
end
10.times do
  Patient.create(name: FFaker::Name.name,
                phone_number: FFaker::PhoneNumberUA.international_mobile_phone_number,
                password: 'password')
end