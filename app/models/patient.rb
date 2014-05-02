class Patient < ActiveRecord::Base
  has_many :wounds
  belongs_to :user

  def name
    "#{first_name} #{last_name}"
  end

  
end
