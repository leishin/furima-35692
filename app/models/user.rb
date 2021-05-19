class User < ApplicationRecord
  has_many :items
  has_many :purchase_records
  has_one_attached :image

  validates :nickname, presence: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_reading, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_reading, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true

  # validates :content, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
