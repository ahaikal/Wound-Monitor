require "spec_helper"

describe Status do
  it { should belong_to(:wound) }
  it { should have_db_column(:width) }
  it { should have_db_column(:stage) }
  it { should have_db_column(:stage_description) }
  it { should have_db_column(:appearance) }
  it { should have_db_column(:drainage) }
  it { should have_db_column(:odor) }
  it { should have_db_column(:color) }
  it { should have_db_column(:treatment_response) }
  it { should have_db_column(:treatment) }
  it { should have_db_column(:length) }
  it { should have_db_column(:depth) }
  it { should have_db_column(:tunnel) }
  it { should have_db_column(:pain) }
  it { should have_db_column(:note) }
  it { should have_db_column(:active) }

end