require 'spec_helper'

describe Wound do
  #pending "add some examples to (or delete) #{__FILE__}"

  it { should have_many(:statuses) }
  it { should belong_to(:patient) }
  it { should have_db_column(:location) }
end
