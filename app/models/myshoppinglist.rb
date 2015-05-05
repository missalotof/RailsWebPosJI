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

def self.returnItemProperty(item)
  count = item.count
  item_sum = item.price*item.count
  item_pro_sum = item.price*(item.count - (item.count/3).to_i).to_i
  buyList = Myshoppinglist.all
  all_sum = 0
  num_sum = 0
  free_sum = 0
  buyList.each do |bl|
    num_sum += bl.count
    all_sum +=  bl.price * bl.count.to_i
    if bl.freeCount >= 0
      free_sum += bl.price * (bl.count/3).to_i
    end
  end
  @data = [count,item_pro_sum,item_sum,num_sum,all_sum,free_sum]
  return @data
end

def self.returnItemAllSum
  buyList = Myshoppinglist.all
  all_sum = 0
  num_sum = 0
  free_sum = 0
  buyList.each do |bl|
    num_sum += bl.count
    all_sum +=  bl.price * bl.count.to_i
    if bl.freeCount >= 0
      free_sum += bl.price * (bl.count/3).to_i
    end
  end
  @data = [num_sum,all_sum,free_sum]
  return @data
  end
end
