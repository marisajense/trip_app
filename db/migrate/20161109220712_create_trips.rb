class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :title, null: false
      t.string :month
      t.integer :year

      t.timestamps
    end
  end
end
