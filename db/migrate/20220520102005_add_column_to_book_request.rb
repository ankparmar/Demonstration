class AddColumnToBookRequest < ActiveRecord::Migration[7.0]
  def change
    add_column :book_requests, :request_date, :datetime
    add_reference :book_requests, :user, null: false, foreign_key: true
    add_reference :book_requests, :book, null: false, foreign_key: true
  end
end
