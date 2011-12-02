class AddFacebookinfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_url, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :gender, :string
  end
end
