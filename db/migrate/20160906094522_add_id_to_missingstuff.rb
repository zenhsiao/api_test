class AddIdToMissingstuff < ActiveRecord::Migration[5.0]
  def change
  	add_column :missingstuffs, :item_no, :string
  end
end
