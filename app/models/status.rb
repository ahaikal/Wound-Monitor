class Status < ActiveRecord::Base
  belongs_to :wound
  belongs_to :patient
  
end
