class AddStatusToBookRequest < ActiveRecord::Migration[7.0]
  def change
    add_column :book_requests, :status, :integer, :default => 0
  end
end
