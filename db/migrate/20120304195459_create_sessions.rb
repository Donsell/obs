class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.date :begin_date
      t.time :begin_time
      t.string :location
      t.integer :seeing
      t.integer :transparancy

      t.timestamps
    end
  end
end
