# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'faker'



User.create(title: "Wound Nurse", first_name: "Steve", last_name: "Jobs", email: "steveyj@pear.com", password: 'password', password_confirmation: 'password')
User.create(title: "Wound Nurse", first_name: "Bill", last_name: "Gates", email: "biggitybill@msoft.com", password: 'password', password_confirmation: 'password')
User.create(title: "Wound Nurse", first_name: "Larry", last_name: "Page", email: "ilovedata@doodle.com", password: 'password', password_confirmation: 'password')
User.create(title: "Doctor", first_name: "Sheryl", last_name: "Sandberg", email: "leanin@facewall.com", password: 'password', password_confirmation: 'password')
User.create(title: "Doctor", first_name: "Meg", last_name: "Whitman", email: "ceilingbreaker@hpandme.com", password: 'password', password_confirmation: 'password')

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

Patient.create(first_name: "John", last_name: "Doe" , user_id: 1, sex: "Other", room_number: 1, birthdate: 25.years.ago )
Patient.create(first_name: "Samantha", last_name: "Toes", user_id: 2, sex: "Female", room_number: 2, birthdate: 35.years.ago )
Patient.create(first_name: "George", last_name: "Washington", user_id: 3, sex: "Male", room_number: 3, birthdate: 85.years.ago)
Patient.create(first_name: "Danielle", last_name: "Dangerous", user_id: 2, sex: "Female", room_number: 4, birthdate: 62.years.ago)
Patient.create(first_name: "Jarrod", last_name: "Scott", user_id: 1, sex: "Male", room_number: 5, birthdate: 57.years.ago)

user_ids = User.all.map(&:id)
sex_noun = ["Male", "Female", "Other"]

def age(birthdate)
  (DateTime.now.year - birthdate.year)
end

20.times do
  Patient.create( 
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      user_id: user_ids.sample, 
      sex: sex_noun.sample,
      room_number: rand(100) + 1,
      birthdate: (10..50).to_a.sample.years.ago,
      age: nil
      )
end

patties = Patient.all

patties.each do |p|
  p.age = age(p.birthdate)
  p.save
end

patient_ids = Patient.all.map(&:id)

Wound.create(patient_id: 1, location: "Knee" )
Wound.create(patient_id: 2, location: "Shoulder")
Wound.create(patient_id: 2, location: "Upper Thigh")
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


Status.create(
      wound_id: 2,
      stage: 1,
      stage_description: "Non-blanchable erythema",
      length: 5,
      width: 3,
      depth:2,
      drainage: "none",
      odor: "yes",
      color: "Yellow",
      tunnel: 0,
      appearance: "Blanchable erythema or blue/purple and black discoloration",
      treatment_response: "Making Progress",
      treatment: "Turning every 2 hours. User pressure relieving/reducing mattresses according to Patient Risk Assessment Protocol.",
      pain: false,
      note: "The wound is getting better overall. It has lost the previous odor.",
      observation_date: 5.days.ago
      )

Status.create(
      wound_id: 2,
      stage: 2,
      stage_description: "Partial thickness",
      length: 8,
      width: 6,
      depth: 4,
      drainage: "Pus present",
      odor: "yes",
      color: "Yellow and tones of brown",
      tunnel: 2,
      appearance: "Blanchable erythema or blue/purple and black discoloration",
      treatment_response: "not progressing or regressing",
      treatment: "Do not drag patient. Use correct manual handling techniques and appropriate equipment.",
      pain: true,
      note: "The wound is not showing signs of improving. It has started emitting an odor.",
      observation_date: 4.days.ago
      )

Status.create(
      wound_id: 2,
      stage: 3,
      stage_description: "Full thickness skin loss",
      length: 10,
      width: 8,
      depth: 5,
      drainage: "Copius amounts of pus and other fluids.",
      odor: "yes",
      color: "brown and hints of necrosus.",
      tunnel: 5,
      appearance: "Blanchable erythema or blue/purple and black discoloration",
      treatment_response: "Going down in a hurry.",
      treatment: "Turning every 2 hours. User pressure relieving/reducing mattresses according to Patient Risk Assessment Protocol. Also using hydrocolloid, foam and film.",
      pain: true,
      note: "The wound is regressing. It has developed a significant odor. It smells a lot like almonds.",
      observation_date: 3.days.ago
      )

Status.create(
      wound_id: 2,
      stage: 4,
      stage_description: "Full thickness tissue loss",
      length: 5,
      width: 3,
      depth:2,
      drainage: "Pus and several other fluids coming out in ",
      odor: "yes",
      color: "Black and solid signs of necrotic sections.",
      tunnel: 0,
      appearance: "Blanchable erythema or blue/purple and black discoloration",
      treatment_response: "Making Progress",
      treatment: "Turning every 2 hours. User pressure relieving/reducing mattresses according to Patient Risk Assessment Protocol.",
      pain: true,
      note: "The wound is getting better overall. It has lost the previous odor.",
      observation_date: 2.days.ago
      )

Status.create(
      wound_id: 2,
      stage: 3,
      stage_description: "Full thickness skin loss",
      length: 2,
      width: 1,
      depth:1,
      drainage: "none",
      odor: "no",
      color: "Yellow",
      tunnel: 0,
      appearance: "Blanchable erythema or blue/purple and black discoloration",
      treatment_response: "Making Progress",
      treatment: "Turning every 2 hours. User pressure relieving/reducing mattresses according to Patient Risk Assessment Protocol.",
      pain: false,
      note: "The wound is getting better overall. It has lost the previous odor.",
      observation_date: 1.days.ago
      )

# 20.times do
#   Status.create(
#       wound_id: 2,
#       stage: rand_num,
#       stage_description: Faker::Lorem.sentence,
#       length: cm_rand,
#       width: cm_rand,
#       depth:cm_rand,
#       drainage: Faker::Lorem.word,
#       odor: Faker::Lorem.word,
#       color: Faker::Commerce.color,
#       tunnel: cm_rand,
#       appearance: Faker::Lorem.sentence,
#       treatment_response: Faker::Lorem.sentence,
#       treatment: Faker::Lorem.sentence,
#       pain: Faker::Lorem.sentence,
#       note: Faker::Lorem.paragraph,
#       observation_date: (1..50).to_a.sample.days.ago
#       )
# end

100.times do
  Status.create(
    wound_id: (3..31).to_a.sample,
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
    note: Faker::Lorem.paragraph,
    observation_date: (1..50).to_a.sample.days.ago
    )
end




