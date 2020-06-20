class SurgicalOperation < ApplicationRecord
  belongs_to :user
  has_many :stocks, dependent: :destroy
  has_many :stock_users, through: :stocks, source: :user
  has_many :comments, dependent: :destroy
  has_many :reads, dependent: :destroy
  validates :title, :content, :medical_department, presence: true
  mount_uploader :image, ImageUploader
end
