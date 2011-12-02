class CreateFoodRelationships < ActiveRecord::Migration
  def change
    create_table :food_relationships do |t|
      t.integer :user_id
      t.integer :food_id
      t.boolean :inclusion

      t.timestamps
    end
  end
end
