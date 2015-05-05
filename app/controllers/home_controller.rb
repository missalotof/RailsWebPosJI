class HomeController < ApplicationController
  def index
    @data = Myshoppinglist.returnItemAllSum
  end

  def product_list
    @list = Myallitem.all
    @data = Myshoppinglist.returnItemAllSum
  end

  def shopping_cart
    @showShopList = Myshoppinglist.all
    @data = Myshoppinglist.returnItemAllSum
  end

  def pay_list
    @showPayShopList = Myshoppinglist.all
    @data = Myshoppinglist.returnItemAllSum
    @freeList = Mypromotion.showFreeList
  end

  def clickBtnToAdd
    shopping = Myallitem.find_by_id(params[:id])
    shoplist = Myshoppinglist.new
    cart = Myshoppinglist.find_by_name(shopping.name)
    Myshoppinglist.addItemToCart(cart,shoplist,shopping)
  end

  def addBtn
    addItem = Myshoppinglist.find_by_id(params[:id])
    Myshoppinglist.accumulateCartNum(addItem)
    @data = Myshoppinglist.returnItemProperty(addItem)
    respond_to do |format|
      format.json { render json: @data  }
      end
  end

  def get_shop_lists_num
    clickBtnToAdd
    @buyList = Myshoppinglist.all
    @num_sum = 0
    @count = 0
    @buyList.each do |bl|
      @num_sum += bl.count
      @count = bl.count
    end
    @data = [@num_sum,@count]
    respond_to do |format|
      format.json { render json: @data  }
      format.js
    end
  end

  def minusBtn
    if Myshoppinglist.find_by_id(params[:id])
      minBtn = Myshoppinglist.find_by_id(params[:id])
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
          item = Myshoppinglist.find_by_id(params[:id])
          @data = Myshoppinglist.returnItemProperty(item)
        end
      end
      respond_to do |format|
        format.json { render json: @data  }
    end
    end
  end

  def truePayBtn
    Myshoppinglist.all.delete_all
    Myfreelist.all.delete_all
    redirect_to :product_list
  end

end



