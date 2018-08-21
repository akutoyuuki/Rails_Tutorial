class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    # @post.comment
    validates :title, :presence => {:message => '必須項目です'}, length: {minimum: 3, message: 'タイトルが短すぎます'}
    validates :body, :presence => {:message => '必須項目です'}
end