class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:trackable,:confirmable

  has_many :book_requests  , dependent: :destroy
  # has_many :books, through: :book_requests

  def admin?
    user_type == 'admin'
  end

  def role
    admin? ? "Admin" : "Student"
  end
end
