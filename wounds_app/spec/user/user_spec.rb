require "spec_helper"

describe User do
  it "should have a first name and second name" do
    user = User.create!(first_name: "Andy", last_name: "Lindeman")

    expect(User.first_name).to eq("Andy")
    expect(User.first_name).to eq("Lindeman")
  end
end