class CreateCourts < ActiveRecord::Migration
  def change
    create_table :courts do |t|
      t.integer :padel_courts
      t.integer :tennis_courts
      t.belongs_to :club, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
