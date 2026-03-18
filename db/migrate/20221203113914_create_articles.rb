class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false, limit: 140
      t.text :body, null: false

      t.timestamps
    end
  end
end
