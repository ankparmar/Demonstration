class AddColumnToBookRequest < ActiveRecord::Migration[7.0]
  def change
    add_column :book_requests, :request_date, :datetime
  end
  add_index :book_requests, [:book_id, :user_id], unique: true
end
