class RenameColumnFromCourts < ActiveRecord::Migration
  def change
  	rename_column :courts, :type_of_courts, :type_of_court
  end
end
