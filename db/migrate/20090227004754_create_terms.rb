class CreateTerms < ActiveRecord::Migration
  def self.up
    create_table :terms do |t|
      t.string :term_string
      t.string :explanation
    end
  end

  def self.down
    drop_table :terms
  end
end
