class RemoveTennisCourtFromCourts < ActiveRecord::Migration
  def change
  	remove_column :courts, :tennis_courts
  	remove_column :courts, :padel_courts
  end
end
