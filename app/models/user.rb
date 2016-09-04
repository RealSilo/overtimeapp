class User < ApplicationRecord
  PHONE_REGEX = /\A[0-9]*\Z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :audit_logs

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true, format: { with: PHONE_REGEX }, length: { is: 10 }

  def full_name
    "#{first_name} #{last_name}"
  end
end
