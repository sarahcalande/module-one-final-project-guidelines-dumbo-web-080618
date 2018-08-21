class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :place
      t.string :type
      t.integer :price
      t.integer :time
    end
  end
end
