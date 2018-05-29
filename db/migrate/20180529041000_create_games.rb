class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.string :description
      t.string :genre
      t.float :price
      t.belongs_to :developer, index:true
      t.integer :fan_id

      t.timestamps
    end
  end
end
