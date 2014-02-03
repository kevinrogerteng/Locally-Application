class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.string :destination
      t.string :description

      t.timestamps
    end
  end
end
