class CreatePostItems < ActiveRecord::Migration[5.2]
  def change
    create_table :post_items do |t|
      t.integer :customer_id
      t.string :title
      t.string :image_id
      t.text :caption
      t.integer :price
      t.text :url

      t.timestamps
    end
  end
end
