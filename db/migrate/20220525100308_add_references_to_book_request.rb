class AddReferencesToBookRequest < ActiveRecord::Migration[7.0]
  def change
    add_reference :book_requests, :user, null: false, foreign_key: true
    add_reference :book_requests, :book, null: false, foreign_key: true
  end
end

# add_index :book_requests, [:user_id, :book_id], unique: true
# rails g migration CREATE UNIQUE INDEX  index_book_requests_on_user_id_and_book_id ON book_requests(user_id, book_id)