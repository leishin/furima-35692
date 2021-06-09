class PurchaseRecordAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  end

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)

    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building,
                   phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end
