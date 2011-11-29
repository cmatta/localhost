class ChangeRoleInUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.change :roles, :string, :default => "user"
    end
  end

  def down
    change_table :users do |t|
      t.change :roles, :string
    end
  end
end
