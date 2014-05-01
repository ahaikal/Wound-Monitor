require "spec_helper"

describe User do
  it { should have_secure_password }
  it "should have a first name and second name" do
    user = User.create!(first_name: "Andy", last_name: "Lindeman", email: "andy@lindeman.com", password: "12345A")

    expect(user.first_name).to eq("Andy")
    expect(user.last_name).to eq("Lindeman")
    expect(user.name).to eq("Andy Lindeman")
  end

  it "should be of type User" do
    user = User.create!(first_name: "Andy", last_name: "Lindeman", email: "andy@lindeman.com", password: "12345A")
    expect(user).to be_an_instance_of(User)
  end

end