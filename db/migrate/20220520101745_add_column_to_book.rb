class AddColumnToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :title, :string
    add_column :books, :author, :string
    add_column :books, :description, :string
    add_reference :books, :user, null: false, foreign_key: true
  end
  
end
