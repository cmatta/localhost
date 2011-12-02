class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.integer :reviewer_id
      t.integer :reviewee_id
      t.string :title
      t.text :body
      t.integer :rating
      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
