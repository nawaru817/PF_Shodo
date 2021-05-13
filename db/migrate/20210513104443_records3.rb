class Records3 < ActiveRecord::Migration[5.2]
  def change
    drop_table :tag_maps
  end
end
