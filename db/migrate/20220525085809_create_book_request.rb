class CreateBookRequest < ActiveRecord::Migration[7.0]
  def change
    create_table :book_requests do |t|
      t.datetime :request_date

      t.timestamps
    end
  end
end
