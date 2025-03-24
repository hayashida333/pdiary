class QuizQuestion < ApplicationRecord
    belongs_to :quiz  # クイズと関連付け
    has_many :options
    # バリデーションを追加することもできます（必要に応じて）
    validates :question, :answer, presence: true
end