class AddIndexToBookRequest < ActiveRecord::Migration[7.0]
  def change
    add_index :book_requests, [:user_id, :book_id], unique: true
  end
end
