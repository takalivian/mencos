class AddReferencesToPosts < ActiveRecord::Migration[5.2]
  def change

    add_reference :posts, :category, foreign_key: true
    add_reference :posts, :user, foreign_key: true

  end
end
