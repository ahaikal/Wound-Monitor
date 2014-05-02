# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'faker'



User.create(title: "Wound Nurse", first_name: "Steve", last_name: "Jobs")
User.create(title: "Wound Nurse", first_name: "Bill", last_name: "Gates")
User.create(title: "Wound Nurse", first_name: "Larry", last_name: "Page")
User.create(title: "Doctor", first_name: "Sheryl", last_name: "Sandberg")
User.create(title: "Doctor", first_name: "Meg", last_name: "Whitman")

5.times do 
  User.create(
    title: 'nurse',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,  
    password: 'password',
    password_confirmation: 'password' 
    )
end

Patient.create(first_name: "John", last_name: "Doe" , user_id: 1 )
Patient.create(first_name: "Samantha", last_name: "Toes", user_id: 2 )
Patient.create(first_name: "George", last_name: "Washington", user_id: 3)
Patient.create(first_name: "Danielle", last_name: "Dangerous", user_id: 2)
Patient.create(first_name: "Jarrod", last_name: "Scott", user_id: 1)

user_ids = User.all.map(&:id)

20.times do
  Patient.create( 
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      user_id: user_ids.sample 
      )
end

patient_ids = Patient.all.map(&:id)

Wound.create(patient_id: 1, location: "Knee" )
Wound.create(patient_id: 2, location: "Shoulder")
Wound.create(patient_id: 3, location: "Upper Thigh")
Wound.create(patient_id: 4, location: "Calf")
Wound.create(patient_id: 5, location: "Right side of stomach area")
Wound.create(patient_id: 1, location: "Lower back, near glutius Maximus")

30.times do 
  Wound.create(
    patient_id: patient_ids.sample,
    location: Faker::Lorem.word
    )
end

wound_ids = Wound.all.map(&:id)


rand_num = rand(6) + 1
cm_rand = rand(31) + 1

100.times do
  Status.create(
    wound_id: wound_ids.sample,
    stage: rand_num,
    stage_description: Faker::Lorem.sentence,
    length: cm_rand,
    width: cm_rand,
    depth:cm_rand,
    drainage: Faker::Lorem.word,
    odor: Faker::Lorem.word,
    color: Faker::Commerce.color,
    tunnel: cm_rand,
    appearance: Faker::Lorem.sentence,
    treatment_response: Faker::Lorem.sentence,
    treatment: Faker::Lorem.sentence,
    pain: Faker::Lorem.sentence,
    note: Faker::Lorem.paragraph
    )
end
