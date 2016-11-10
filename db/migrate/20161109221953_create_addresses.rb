class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :city
      t.string :state
      t.belongs_to :location

      t.timestamps
    end
  end
end
