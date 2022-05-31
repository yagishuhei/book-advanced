class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  
  #引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうか
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
