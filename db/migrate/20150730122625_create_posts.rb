class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :author
      t.text :content
      t.string :mail
      t.string :password
      t.integer :mention_to

      t.timestamps null: false
    end
  end
end
