class CreateBodyTypes < ActiveRecord::Migration
  def self.up
    create_table :body_types do |t|
      t.text :abbr
      t.text :description

      t.timestamps
    end
    execute 'ALTER TABLE body_types AUTO_INCREMENT = 1'
  end

  def self.down
    drop_table :body_types
  end
end
