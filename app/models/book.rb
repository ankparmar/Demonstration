class Book < ApplicationRecord
  has_many :book_requests  , dependent: :destroy
  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true

  def book_requests_by_user(user)
    self.book_requests.find_by(user: user)
  end

  def book_requested_by_user?(user)
    self.book_requests_by_user(user).present?
  end
end
