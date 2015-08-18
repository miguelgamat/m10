class AddBelongsToCourts < ActiveRecord::Migration
  def change
  	add_column :courts, :booking_id, :integer
  	add_index :courts, :booking_id
  end
end

# Adding a new column with index, the index makes the searchs faster.