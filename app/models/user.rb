class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :email,              uniqueness: true
    validates :name              , format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
    validates :employee_number,    length: { maximum: 6 }, format: { with:/\A[0-9]+\z/}, uniqueness: true
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, length: { minimum: 6 }

  has_many :actions
  has_one :performance

end
