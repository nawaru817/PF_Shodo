class AddImpressionsCountToPostItems < ActiveRecord::Migration[5.2]
  def change
    add_column :post_items, :impressions_count, :integer
  end
end
