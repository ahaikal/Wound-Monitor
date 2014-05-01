class CreateStatus < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
    	t.belongs_to :wound
    	t.string :stage
    	t.string :stage_description
    	t.integer :length
    	t.integer :width
    	t.integer :depth
    	t.string	:drainage
    	t.string	:odor
    	t.string	:color
    	t.integer :tunnel
    	t.string :appearance
    	t.string :treatment_response
    	t.string :treatment
    	t.boolean :pain
    	t.text :note

    	t.timestamps
    end
  end
end
