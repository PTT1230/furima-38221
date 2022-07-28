class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :nickname,          presence: true
  validates :birthday,          presence: true
  validates :last_name_kana,    presence: true#, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana,   presence: true#, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kanji,   presence: true#, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kanji,  presence: true#, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  #validates :encrypted_password,presence: true
end
