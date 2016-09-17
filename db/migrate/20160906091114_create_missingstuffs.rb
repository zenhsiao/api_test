class CreateMissingstuffs < ActiveRecord::Migration[5.0]
  def change
    create_table :missingstuffs do |t|
    	t.date :date
    	t.string :place
    	t.text :content	 	
      t.timestamps
    end
  end
end
