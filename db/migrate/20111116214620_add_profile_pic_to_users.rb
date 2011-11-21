class AddProfilePicToUsers < ActiveRecord::Migration
  def up
    add_column :users, :profile_pic_filename, :string
    add_column :users, :profile_pic_contenttype, :string
    add_column :users, :profile_pic_size, :integer
    add_column :users, :profile_pic_updated_at, :datetime
  end
  
  def down
    remove_column :users, :profile_pic_filename
    remove_column :users, :profile_pic_contenttype
    remove_column :users, :profile_pic_size
    remove_column :users, :profile_pic_updated_at
  end
end
