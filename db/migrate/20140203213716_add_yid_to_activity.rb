class AddYidToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :yid, :string
  end
end
