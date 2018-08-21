class CreateAddColumnDate < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :date, :string
  end
end
