class CreateChangeTypeColumnActivity < ActiveRecord::Migration[5.0]
  def change
    rename_column :activities, :type, :genre
  end
end
