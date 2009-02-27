class CreateSizes < ActiveRecord::Migration
  def self.up
    create_table :sizes do |t|
      t.string :size_code
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :sizes
  end
end