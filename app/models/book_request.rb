class BookRequest < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :status, presence: true
  validates :book_id, uniqueness: { scope: :user_id }

  enum :status, %i[pending approved denied]
end
