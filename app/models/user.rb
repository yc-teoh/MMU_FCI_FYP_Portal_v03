class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_id, length: { minimum: 6, maximum: 10 }, presence: true, uniqueness: true
  validates :user_name, length: { minimum: 3, maximum: 50 }, presence: true
  validates :user_gov_id, length: { minimum: 2, maximum: 20 }, presence: true, uniqueness: true
  validates :user_contact_no, length: { minimum: 9, maximum: 20 }, numericality: { only_integer: true }, presence: true
  validates :email, length: { minimum: 5, maximum: 128}, presence: true, uniqueness: true

  has_many :announcements
end
