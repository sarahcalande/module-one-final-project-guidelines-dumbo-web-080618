class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :place
      t.string :genre
      t.integer :price
      t.integer :best_time
      t.string :date
    end
  end
end
