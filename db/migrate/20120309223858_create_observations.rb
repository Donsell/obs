class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.date :obs_date
      t.time :obs_time
      t.integer :seeing
      t.integer :transparency
      t.text :notes
      t.references :session

      t.timestamps
    end
    add_index :observations, :session_id
  end
end
