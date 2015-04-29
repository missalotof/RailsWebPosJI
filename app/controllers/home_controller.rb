class HomeController < ApplicationController
  def index
  end

  def product_list
    @list = Myallitem.all
  end

  def shopping_cart
    @showShopList = Myshoppinglist.all
    get_shop_list_num
  end

  def pay_list
    @showPayShopList = Myshoppinglist.all
    get_shop_list_num
    showFreeList
  end

  def clickBtnToAdd
    shopping = Myallitem.find_by_id(params[:id])
    cart = Myshoppinglist.find_by_name(shopping.name)
    shoplist = Myshoppinglist.new
    if cart
      last_count=cart.count
      cart.count = last_count +1
      cart.allsum = cart.price*cart.count
      if Mypromotion.find_by_barcode(cart.barcode)
        cart.freeCount =  (cart.count/3).to_i
      end
      cart.save
    else
      if Mypromotion.find_by_barcode(shopping.barcode)
        shoplist.classfy = shopping.classfy
        shoplist.name = shopping.name
        shoplist.unit = shopping.unit
        shoplist.price = shopping.price
        shoplist.count = 1
        shopping.freeCount = 0
        shoplist.allsum = shopping.price
        shoplist.barcode = shopping.barcode
        shoplist.save
      end
      shoplist.classfy = shopping.classfy
      shoplist.name = shopping.name
      shoplist.unit = shopping.unit
      shoplist.price = shopping.price
      shoplist.count = 1
      shoplist.freeCount = shopping.freeCount
      shoplist.allsum = shopping.price
      shoplist.barcode = shopping.barcode
      shoplist.save
    end
    redirect_to :product_list
  end

  def addBtn
    addItem = Myshoppinglist.find_by_id(params[:id])
    last_count = addItem.count
    addItem.count = last_count +1
    addItem.allsum = addItem.count*addItem.price
    if Mypromotion.find_by_barcode(addItem.barcode)
      addItem.freeCount =  (addItem.count/3).to_i
    end
    addItem.save
    redirect_to :shopping_cart
  end

  def minusBtn
    if Myshoppinglist.find_by_id(params[:id])

      minBtn = Myshoppinglist.find_by_id(params[:id])

      if minBtn.count <= 1
        minBtn.delete
      else
        minBtn.count=minBtn.count-1
        minBtn.save
      end
      minBtn.allsum = minBtn.count*minBtn.price
      minBtn.save
      if Mypromotion.find_by_barcode(minBtn.barcode)
        minBtn.freeCount =  (minBtn.count/3).to_i
      end
      redirect_to :shopping_cart
    else
      goods = Myshoppinglist.all
      if goods.length == 0
      redirect_to :product_list
      else
        redirect_to :shopping_cart
      end
    end
  end

  def payBtn
    redirect_to :pay_list
  end

  def truePayBtn
    Myshoppinglist.all.delete_all
    Myfreelist.all.delete_all
    redirect_to :product_list

  end

  def get_shop_list_num
    p '11111111111111'

    @buyList = Myshoppinglist.all
    @all_sum = 0
    @free_sum = 0
    @num_sum = 0
    @buyList.each do |bl|
      @num_sum += bl.count
      @all_sum +=  bl.price * bl.count.to_i
      if bl.freeCount >= 0
        @free_sum += bl.price * (bl.count/3).to_i
      end
    end
    respond_to do |format|
      format.html {}
      format.json { render :json => @num_sum.to_json }
    end
    end


  def showFreeList
    if
    promotionBar = Promotionlist.all
      promotionBar.each do |item|
        if Myshoppinglist.find_by_barcode(item.barcode)
        promotionItem = Myshoppinglist.find_by_barcode(item.barcode)
        cart = Myfreelist.find_by_name(promotionItem.name)
        if cart
          cart.freeCount = (promotionItem.count/3).to_i
          cart.save
        else
          showPromotionItem = Myfreelist.new
          showPromotionItem.classfy = promotionItem.classfy
          showPromotionItem.name = promotionItem.name
          showPromotionItem.freeCount = (promotionItem.count/3).to_i
          showPromotionItem.save
        end

      end
    end
    end
    @freeList = Myfreelist.all
    end

end



