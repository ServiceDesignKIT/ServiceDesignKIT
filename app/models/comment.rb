class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true

  validates_uniqueness_of :content, scope: [:user, :post]

  default_scope { order(created_at: :desc) }
end
