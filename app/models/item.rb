class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  validates :name, presence: true
  validates :text, presence: true
  validates :category_id , presence: true
  validates :status_id , presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_days_id, presence: true
  validates :price , presence: true

end
