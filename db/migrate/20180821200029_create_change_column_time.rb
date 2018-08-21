class CreateChangeColumnTime < ActiveRecord::Migration[5.0]
  def change
    rename_column :activities, :time, :best_time
  end
end
