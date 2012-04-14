class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.string :catalog
      t.string :catalog_num
      t.references :body

      t.timestamps
    end
    add_index :catalogs, :body_id
  end
end
