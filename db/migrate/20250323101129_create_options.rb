class CreateOptions < ActiveRecord::Migration[7.2]
  def change
    create_table :options do |t|
      t.string :option_text
      t.boolean :is_correct
      t.references :quiz_question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
