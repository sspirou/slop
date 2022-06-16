class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :workout, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
