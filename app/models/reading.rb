class Reading < ApplicationRecord
  belongs_to :user
  belongs_to :surgical_operation
  has_many :notifications, dependent: :destroy
  validates :user_id, uniqueness: { scope: :surgical_operation_id }
end
