class CreateStatus < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
        t.integer :wound_id
        t.string :stage
        t.string :stage_description
        t.string :appearance
        t.string :drainage
        t.string :odor
        t.string :color
        t.string :treatment_response
        t.string :treatment
        t.integer :length
        t.integer :width
        t.integer :depth
        t.integer :tunnel
        t.boolean :pain
        t.text :note
        t.boolean :active, default: true
        t.datetime :observation_date

        t.timestamps
    end
  end
end
