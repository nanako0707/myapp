class Stock < ApplicationRecord
  belongs_to :user
  belongs_to :surgical_operation
  validates :user_id, uniqueness: { scope: :surgical_operation_id }
end
