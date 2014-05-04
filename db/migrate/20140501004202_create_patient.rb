class CreatePatient < ActiveRecord::Migration
  def change
    create_table :patients do |t|
    	t.string	:first_name
    	t.string	:last_name
      t.string  :sex
      t.integer :room_number
      t.belongs_to :user

    	t.timestamps
    end
  end
end
