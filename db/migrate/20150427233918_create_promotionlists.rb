class CreatePromotionlists < ActiveRecord::Migration
  def change
    create_table :promotionlists do |t|
      t.string :barcode
      t.string :name

      t.timestamps null: false
    end
  end
end
