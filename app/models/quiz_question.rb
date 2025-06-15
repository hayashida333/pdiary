class QuizQuestion < ApplicationRecord
  has_many :quiz_results
  # 他の関連付けや設定
end