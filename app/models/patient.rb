include ApplicationHelper

class Patient < ActiveRecord::Base
  has_many :wounds
  belongs_to :user

  
end
