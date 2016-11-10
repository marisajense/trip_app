class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :description
      t.string :comments
      t.boolean :reccomend
      t.belongs_to :trip

      t.timestamps
    end
  end
end
