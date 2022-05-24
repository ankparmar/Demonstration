class BookRequest < ApplicationRecord
    # load_and_authorize_resource
    # authorize_resource class: false
    belongs_to :user
    belongs_to :book
    # enum :status, { :pending, :approved, :deny}
    enum :status, [ :pending, :approved, :deny ]
    validates :request_date, presence: true
    validates :status, presence: true

end
