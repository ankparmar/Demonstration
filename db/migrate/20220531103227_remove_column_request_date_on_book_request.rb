class RemoveColumnRequestDateOnBookRequest < ActiveRecord::Migration[7.0]
  def change
    remove_column :book_requests, :request_date, :datetime
  end
end
