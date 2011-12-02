class ChangeZipcodeToIntegerInUsers < ActiveRecord::Migration
  def up
  	change_table :users do |t|
      t.change :zipcode, :integer
    end
  end

  def down
  	change_table :users do |t|
      t.change :zipcode, :string
    end
  end
end
