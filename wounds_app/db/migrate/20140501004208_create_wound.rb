class CreateWound < ActiveRecord::Migration
  def change
    create_table :wounds do |t|
    	t.string	:location
    	t.belongs_to	:patient

    	t.timestamps
    end
  end
end
