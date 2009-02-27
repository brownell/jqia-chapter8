class CreateBoots < ActiveRecord::Migration
  def self.up
    create_table :boots do |t|
      t.string :style
      t.string :name
      t.string :sku
      t.string :height
      t.string :lining
      t.string :price
      t.string :features

      t.timestamps
    end
  end

  def self.down
    drop_table :boots
  end
end
