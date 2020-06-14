class SurgicalOperation < ApplicationRecord
  belongs_to :user
  has_many :stocks, dependent: :destroy
  has_many :stock_users, through: :stocks, source: :user
  validates :title, presence: true
  validates :content, presence: true
end
