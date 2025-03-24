# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
QuizQuestion.create(
  question: '従業員が重機を使用して作業をしています。従業員に自分の位置を伝える効果的な方法は？',
  option1: '大声を出す',
  option2: '近づく',
  option3: '作業方向に石を投げる',
  option4: '電話をかける',
  correct: 3
)

QuizQuestion.create(
  question: '解体現場にて作業をしています。次の内正しくない対応はどれですか？',
  option1: '足場に乗った時に安定性、強度を確認する',
  option2: '安全帯を使用して作業に取り組む',
  option3: '作業に取り組む前に5S運動に取り組む',
  option4: '前日に深酒をする',
  correct: 4
)
