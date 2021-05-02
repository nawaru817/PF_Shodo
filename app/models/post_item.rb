class PostItem < ApplicationRecord

  belongs_to :customer
  has_many :post_comments, dependent: :destroy

  attachment :image
end
