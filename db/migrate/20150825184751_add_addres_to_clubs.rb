class AddAddresToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :address, :string
  end
end
