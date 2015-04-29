class CreateMypromotions < ActiveRecord::Migration
  def change
    create_table :mypromotions do |t|
      t.string :barcode

      t.timestamps null: false
    end
  end
end
