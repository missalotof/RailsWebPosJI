class CreateMyfreelists < ActiveRecord::Migration
  def change
    create_table :myfreelists do |t|
      t.string :classfy
      t.string :name
      t.float :freeCount
      t.float :count
      t.string :barcode
      t.timestamps null: false
    end
  end
end
