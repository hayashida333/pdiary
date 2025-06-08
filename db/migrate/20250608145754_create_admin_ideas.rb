class CreateAdminIdeas < ActiveRecord::Migration[7.2]
  def change
    create_table :admin_ideas do |t|
      t.string :title
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
