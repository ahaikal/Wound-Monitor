require "spec_helper"

describe User do
  it { should have_secure_password }
  it "should have a first name and second name" do
    user = User.create!(first_name: "Andy", last_name: "Lindeman", email: "andy@lindeman.com", password: "1234567A")

    expect(user.first_name).to eq("Andy")
    expect(user.last_name).to eq("Lindeman")
    expect(user.name).to eq("Andy Lindeman")
  end

  it "should be of type User" do
    user = User.create!(first_name: "Andy", last_name: "Lindeman", email: "andy@lindeman.com", password: "1234567A")
    expect(user).to be_an_instance_of(User)
  end

  it {should have_many(:patients)}
  it {should have_db_column(:first_name)}
  it {should have_db_column(:last_name)}
  it {should have_db_column(:title)}
  it {should have_db_column(:email)}
  it {should have_db_column(:password_digest)}

end