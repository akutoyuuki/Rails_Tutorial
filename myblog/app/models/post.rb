class Post < ApplicationRecord
    has_many :comments, class_name: :Comment, foreign_key: :post_id, dependent: :destroy
    # @post.comment
    validates :title, presence: true, length: {minimum: 3 }
    validates :body, presence: true
end