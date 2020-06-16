class Comment < ApplicationRecord
  belongs_to :surgical_operation
  belongs_to :user
end
