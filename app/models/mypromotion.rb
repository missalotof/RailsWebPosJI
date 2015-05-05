class Mypromotion < ActiveRecord::Base
  def self.showFreeList
    if
    promotionBar = Mypromotion.all
      promotionBar.each do |item|
        Mypromotion.getFreeList(item)
      end
    end
    @freeList = Myfreelist.all
    return @freeList
  end

  def self.getFreeList(item)
    if Myshoppinglist.find_by_barcode(item.barcode)
      promotionItem = Myshoppinglist.find_by_barcode(item.barcode)
      cart = Myfreelist.find_by_name(promotionItem.name)
      if cart
        Mypromotion.getFreeItemCount(cart,promotionItem)
      else
        Mypromotion.addNewFreeItem(promotionItem)
      end
    end

  end

  def self.getFreeItemCount(cart,promotionItem)
    cart.freeCount = (promotionItem.count/3).to_i
    cart.save
  end

  def self.addNewFreeItem(promotionItem)
    showPromotionItem = Myfreelist.new
    showPromotionItem.classfy = promotionItem.classfy
    showPromotionItem.name = promotionItem.name
    showPromotionItem.freeCount = (promotionItem.count/3).to_i
    showPromotionItem.save
  end
end
