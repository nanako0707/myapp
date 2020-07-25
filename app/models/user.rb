class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_many :surgical_operations, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :readings, dependent: :destroy
  has_many :reading_surgical_operations, through: :readings, source: :surgical_operation
  has_many :cards, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :name, uniqueness: true, length: { minimum: 4, maximum: 20 }
  before_destroy :do_not_destroy_last_admin

  private
  def do_not_destroy_last_admin
    throw(:abort) if User.where(admin: true).count <= 1 && self.admin?
  end
end
