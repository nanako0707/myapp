class SurgicalOperation < ApplicationRecord
  belongs_to :user
  has_many :stocks, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
  mount_uploader :image, ImageUploader
end
