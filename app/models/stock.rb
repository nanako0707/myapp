class Stock < ApplicationRecord
  belongs_to :user
  belongs_to :surgical_operation
end
