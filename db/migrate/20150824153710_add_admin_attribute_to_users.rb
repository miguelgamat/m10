class AddAdminAttributeToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :admin, :boolean, :default => nil
  end
end
