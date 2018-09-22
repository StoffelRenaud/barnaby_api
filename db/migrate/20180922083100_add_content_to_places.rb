class AddContentToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :content, :text
  end
end
