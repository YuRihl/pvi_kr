class Post < ApplicationRecord
    has_many :comments
    validates :title, presence: true, length: { in: 5..50 }, format: { with: /([A-Z0-9])\w+/}
    paginates_per 10
end
