class AdminPost < ApplicationRecord
  self.table_name = "admin_posts"  # 念のため明示

  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
end