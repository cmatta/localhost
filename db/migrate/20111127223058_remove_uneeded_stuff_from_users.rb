class RemoveUneededStuffFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :username
    remove_column :users, :crypted_password
    remove_column :users, :salt
    remove_column :users, :remember_me_token
    remove_column :users, :remember_me_token_expires_at
    remove_column :users, :zipcode
    remove_column :users, :address_field1
    remove_column :users, :address_field2
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :profilepic_file_name
    remove_column :users, :profilepic_content_type
    remove_column :users, :profilepic_file_size
    remove_column :users, :profilepic_updated_at
  end

  def down
    add_column :users, :profilepic_updated_at, :datetime
    add_column :users, :profilepic_file_size, :integer
    add_column :users, :profilepic_content_type, :string
    add_column :users, :profilepic_file_name, :string
    add_column :users, :state, :string
    add_column :users, :city, :string
    add_column :users, :address_field2, :string
    add_column :users, :address_field1, :string
    add_column :users, :zipcode, :integer
    add_column :users, :remember_me_token_expires_at, :datetime
    add_column :users, :remember_me_token, :string
    add_column :users, :salt, :string
    add_column :users, :crypted_password, :string
    add_column :users, :username, :string
  end
end
