class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.string    :name
      t.string    :brand
      t.integer   :praice
      t.string    :shop
      t.text      :remark
      
      t.timestamps
    end
  end
end
