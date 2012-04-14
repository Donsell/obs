class CreateBodies < ActiveRecord::Migration
  def self.up
    create_table :bodies do |t|
      t.text :body_id
      t.text :alt_id
      t.integer :body_type_id
      t.integer :constellation_id
      t.time :right_ascension
      t.float :declination
      t.float :magnitude
      t.float :surface_brightness
      t.integer :uranometria
      t.integer :sky_atlas_2000
      t.integer :pocket_sky_atlas
      t.float :size_max
      t.float :size_min
      t.integer :position_angle
      t.text :class_id
      t.integer :number_of_stars
      t.float :brightest_star_mag
      t.string :ngc_description

      t.timestamps
    end
    execute 'ALTER TABLE bodies AUTO_INCREMENT = 1'
  end

  def self.down
    drop_table :bodies
  end
end
