class BookRequest < ApplicationRecord
    load_and_authorize_resource
    belongs_to :user
    belongs_to :book
    enum status: { :pending, :approved, :deny}

end
