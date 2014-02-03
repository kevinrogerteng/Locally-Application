class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :biz_url
      t.string :thumbnail_photo
      t.string :rating

      t.timestamps
    end
  end
end
