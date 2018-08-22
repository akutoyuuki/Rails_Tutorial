class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    # @post.comment
    validates :title, presence: true, length: {minimum: 3 }
    validates :body, presence: true
end