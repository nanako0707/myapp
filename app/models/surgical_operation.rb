class SurgicalOperation < ApplicationRecord
  belongs_to :user
  has_many :notifications, dependent: :destroy
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

  def create_notification_by(current_user)
    notification = current_user.active_notifications.new(
      surgical_operation_id: id,
      visited_id: user_id,
      action: "stock"
    )
    notification.save if notification.valid?
  end

  def create_notification_comment!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(surgical_operation_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      surgical_operation_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
