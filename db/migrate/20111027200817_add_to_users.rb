class AddToUsers < ActiveRecord::Migration
  def up
    add_column :users, :first_name, :string, :default => nil
    add_column :users, :last_name, :string, :default => nil
    add_column :users, :zipcode, :string, :default => nil
  end

  def down
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :zipcode, :string
  end
end
