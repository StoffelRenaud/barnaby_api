class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.string :urlphoto
      t.float :distance

      t.timestamps
    end
  end
end
