class SurgicalOperation < ApplicationRecord
  belongs_to :user
  has_many :stocks, dependent: :destroy
  has_many :stock_users, through: :stocks, source: :user
  has_many :comments, dependent: :destroy
  has_many :comment_users, through: :comments, source: :user
  has_many :readings, dependent: :destroy
  has_many :reading_users, through: :readings, source: :user
  validates :title, :content, :medical_department, presence: true
  mount_uploader :image, ImageUploader
  scope :sort_medical_department, -> { order(medical_department: :desc) }
  scope :sort_updated_at, -> { order(updated_at: :desc) }
  scope :created_at, -> { all.order(created_at: :desc) }
  scope :title_like, -> title { where('title LIKE ?', "%#{title}%") }
  scope :medical_department, -> medical_department { where(medical_department: medical_department) }
  scope :status, -> status { where(status: status) }
end
