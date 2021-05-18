class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
class User < ApplicationRecord
  has_many :items
  has_many :purchase_records
  has_one_attached :image

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_reading, presence: true
  validates :first_name_reading, presence: true
  validates :birthday, presence: true


  #validates :content, presence: true
end

