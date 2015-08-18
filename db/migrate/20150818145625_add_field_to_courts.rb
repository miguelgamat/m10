class AddFieldToCourts < ActiveRecord::Migration
  def change
    add_column :courts, :type_of_courts, :string
  end
end
