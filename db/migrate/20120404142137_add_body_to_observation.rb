class AddBodyToObservation < ActiveRecord::Migration
  def change
    add_column :observations, :body_id, :integer

  end
end
