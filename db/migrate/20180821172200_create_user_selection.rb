class CreateUserSelection < ActiveRecord::Migration[5.0]
  def change
    create_table :user_selections do |t|
      t.integer :user_id
      t.integer :activity_id
      t.string :name
    end 
  end
end
