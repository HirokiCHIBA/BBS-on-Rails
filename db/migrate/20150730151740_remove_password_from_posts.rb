class RemovePasswordFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :password, :string
  end
end
