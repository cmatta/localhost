class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_field1
      t.string :address_field2
      t.string :city
      t.string :state
      t.integer :zipcode

      t.timestamps
    end
  end
end
