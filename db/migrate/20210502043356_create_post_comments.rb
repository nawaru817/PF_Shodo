class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.integer :customer_id
      t.integer :post_item_id
      t.text :comment

      t.timestamps
    end
  end
end
