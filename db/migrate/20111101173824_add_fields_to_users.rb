class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address_field1, :string
    add_column :users, :address_field2, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
  end
end
