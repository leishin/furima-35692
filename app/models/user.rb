class User < ApplicationRecord
  has_many :items
  has_many :purchase_records

  with_options presence: true do
    validates :nickname
    validates :password, :password_confirmation, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}+\z/ }

    with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :last_name_reading
      validates :first_name_reading
    end

    validates :birthday
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
