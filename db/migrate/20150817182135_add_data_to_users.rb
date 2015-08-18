class AddDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :number_of_street, :string
    add_column :users, :flat, :string
    add_column :users, :letter_flat, :string
    add_column :users, :zip_code, :string
    add_column :users, :mobile_number, :string
  end
end
