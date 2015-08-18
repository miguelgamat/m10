class AddNameToCourts < ActiveRecord::Migration
  def change
    add_column :courts, :name, :string
  end
end
