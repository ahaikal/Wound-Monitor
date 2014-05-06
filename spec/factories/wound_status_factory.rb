FactoryGirl.define do
  factory :wound do
    id 1
    location "Head"
    patient_id 1
  end

  factory :status do
    id 1
  	wound_id 1
    stage "II"
    stage_description "draining has started"
    appearance "ghastly"
    drainage "none"
    odor "really bad"
    color "bluish-gold"
    treatment_response "none"
    treatment "heat"
    length 6
    width 5
    tunnel "big"
    pain "yes"
    note "These are notes"
    active true
  end

end