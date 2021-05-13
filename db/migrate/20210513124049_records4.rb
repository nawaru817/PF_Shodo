class Records4 < ActiveRecord::Migration[5.2]
  def change
    drop_table :tags
    drop_table :tag_maps
  end
end
