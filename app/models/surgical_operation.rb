class SurgicalOperation < ApplicationRecord
  belongs_to :user
  has_many :stocks, dependent: :destroy
  validates :title, :content, :status, :medical_department, presence: true
  mount_uploader :image, ImageUploader
end
