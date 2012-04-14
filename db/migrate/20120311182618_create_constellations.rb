class CreateConstellations < ActiveRecord::Migration
  def self.up
    create_table :constellations do |t|
      t.text :abbr
      t.text :constellation
      t.text :genitive

      t.timestamps
    end
    execute 'ALTER TABLE constellations AUTO_INCREMENT = 1'
  end

  def self.down
    drop_table :constellations
  end
end
