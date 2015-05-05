class Myshoppinglist < ActiveRecord::Base

def self.addItemToCart(cart,shoplist,item)
  if cart
    Myshoppinglist.accumulateCartNum(cart)
  else
    Myshoppinglist.addNewCartItem(shoplist,item)
  end
end

def self.accumulateCartNum(cart)
  last_count=cart.count
  cart.count = last_count +1
  cart.allsum = cart.price*cart.count
  if Mypromotion.find_by_barcode(cart.barcode)
    cart.freeCount =  (cart.count/3).to_i
  end
  cart.save
end

def self.regressiveCartNum(cart)
  last_count=cart.count
  cart.count = last_count - 1
  cart.allsum = cart.price*cart.count
  if Mypromotion.find_by_barcode(cart.barcode)
    cart.freeCount =  (cart.count/3).to_i
  end
  cart.save

end

def self.addNewCartItem(shoplist,item)
  if Mypromotion.find_by_barcode(item.barcode)
    item.freeCount = 0
  end
  shoplist.classfy = item.classfy
  shoplist.name = item.name
  shoplist.unit = item.unit
  shoplist.price = item.price
  shoplist.count = 1
  shoplist.freeCount = item.freeCount
  shoplist.allsum = item.price
  shoplist.barcode = item.barcode
  shoplist.save
end
end
