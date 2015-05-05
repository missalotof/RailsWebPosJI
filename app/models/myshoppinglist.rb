class Myshoppinglist < ActiveRecord::Base

def self.addItemToCart(id)
  shopping = Myallitem.find_by_id(id)
  cart = Myshoppinglist.find_by_name(shopping.name)
  if cart
    Myshoppinglist.accumulateCartNum(cart)
  else
    Myshoppinglist.addNewCartItem(shopping)
  end
end

def self.accumulateCartNum(id)
  addItem = Myshoppinglist.find_by_id(id)
  last_count=addItem.count
  addItem.count = last_count +1
  addItem.allsum = addItem.price*addItem.count
  if Mypromotion.find_by_barcode(addItem.barcode)
    addItem.freeCount =  (addItem.count/3).to_i
  end
  addItem.save
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

def self.return_data(id)
  minBtn = Myshoppinglist.find_by_id(id)
  Myshoppinglist.regressiveCartNum(minBtn)
  @remove_turn_to = Myshoppinglist.all
  all_item_sum = 0
  @remove_turn_to.each do |item|
    all_item_sum += item.count
  end
  if minBtn.count <= 0
    minBtn.delete
  end
  if all_item_sum == 0
    @data = [3,1,2,0,4,5]
  else
    if minBtn.count <= 0
      minBtn.delete
      @data=[0,1,2,3,4,5]
    else
      @data = Myshoppinglist.returnItemProperty(minBtn)
    end
  end
end

def self.addNewCartItem(item)
  if Mypromotion.find_by_barcode(item.barcode)
    item.freeCount = 0
  end
  Myshoppinglist.create(:classfy=>item.classfy,:name=>item.name,:unit=>item.unit,:price=>item.price,:count=>1,:freeCount=>item.freeCount,:allsum=>item.price,:barcode=>item.barcode)
end

def self.returnItemProperty(id)
  addItem = Myshoppinglist.find_by_id(id)
  count = addItem.count
  item_sum = addItem.price*addItem.count
  item_pro_sum = addItem.price*(addItem.count - (addItem.count/3).to_i).to_i
  return_Sum = Myshoppinglist.returnItemAllSum
  @data = [count,item_pro_sum,item_sum,return_Sum[0],return_Sum[1],return_Sum[2]]
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
   [num_sum,all_sum,free_sum]
  end
end
