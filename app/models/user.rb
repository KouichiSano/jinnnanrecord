class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :cart

  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

   def cart_item_exists?(item)
    cart.cart_items.find_by(item_id: item.id).presence
   end
end
