class DropHostReviews < ActiveRecord::Migration
  def change
    drop_table :host_reviews
  end
end
