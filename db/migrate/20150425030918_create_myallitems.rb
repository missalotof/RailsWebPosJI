class CreateMyallitems < ActiveRecord::Migration
  def change
    create_table :myallitems do |t|
      t.string :barcode
      t.string :name
      t.string :unit
      t.float :price
      t.float :count
      t.string :classfy
      t.float :freeCount
      t.timestamps null: false
    end
  end
end
