class Item < ApplicationRecord
  belongs_to :user
  #   has_one :purchase_record
  has_one_attached :image

  with_options presence: true do
    validates :name, { length: { maximum: 40 } }
    validates :text, { length: { maximum: 1000 } }
    with_options numericality: { other_than: 0 } do
      validates :category_id
      validates :status_id
      validates :delivery_charge_id
      validates :prefecture_id
      validates :delivery_day_id
    end
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      format: { with: /\A[0-9]+\z/ }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day
end
