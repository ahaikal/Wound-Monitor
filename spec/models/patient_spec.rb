require "spec_helper"

describe Patient do
  it "should have a first name and second name" do
    user = Patient.create!(first_name: "Andy", last_name: "Lindeman")

    expect(user.first_name).to eq("Andy")
    expect(user.last_name).to eq("Lindeman")
    expect(user.name).to eq("Andy Lindeman")
  end

  it "should be of type Patient" do
    user = Patient.create!(first_name: "Andy", last_name: "Lindeman")
    expect(user).to be_an_instance_of(Patient)
  end

  it {should belong_to(:user) }
  it {should have_many(:wounds) }
  it {should have_db_column(:first_name) }
  it {should have_db_column(:last_name) }
  it {should have_db_column(:sex) }
  it {should have_db_column(:room_number) }
  it {should have_db_column(:user_id) }
  it {should have_db_column(:age)}

end
