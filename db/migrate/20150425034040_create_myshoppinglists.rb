class CreateMyshoppinglists < ActiveRecord::Migration
  def change
    create_table :myshoppinglists do |t|
      t.string :classfy
      t.string :name
      t.string :unit
      t.float :price
      t.float :count
      t.float :freeCount
      t.float :allsum
      t.float :promotionsum
      t.string :barcode

      t.timestamps null: false
    end
  end
end
