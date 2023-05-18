class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :validatable

  scope :list_student, ->{ where(user_role: "Student") }
  scope :list_coordinator, -> { where(user_role: "Coordinator") }
  scope :list_manager, -> { where(user_role: "Manager") }
  scope :list_supervisor, -> { where(user_role: "Supervisor") }
  scope :list_moderator, -> { where(user_role: "Moderator") }

  validates :user_id, length: { minimum: 6, maximum: 10 }, presence: true, uniqueness: true
  validates :user_name, length: { minimum: 2, maximum: 50 }, presence: true
  validates :user_gov_id, length: { minimum: 2, maximum: 20 }, presence: true, uniqueness: true
  validates :user_contact_no, length: { minimum: 9, maximum: 20 }, numericality: { only_integer: true }, presence: true
  validates :email, length: { minimum: 5, maximum: 128}, presence: true, uniqueness: true
  validates :is_supervisor, length: { is: 1 }

  has_many :announcements
  has_many :projects, class_name: "Project", foreign_key: :supervisor_id
end
