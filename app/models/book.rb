class Book < ApplicationRecord
    has_many :book_requests
    has_many :users, through: :book_requests
end
