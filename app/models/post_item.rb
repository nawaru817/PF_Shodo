class PostItem < ApplicationRecord

  belongs_to :customer
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  is_impressionable counter_cache: true

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
end
