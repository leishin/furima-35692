class User < ApplicationRecord
  has_many :items
  has_many :purchase_records
  has_one_attached :image

  with_options presence: true do
    validates :nickname
    validates :encrypted_password,:password,:password_confirmation,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}

    with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/} do
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
