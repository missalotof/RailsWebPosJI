class HomeController < ApplicationController
  def index
    num_show
  end

  def product_list
    @list = Myallitem.all
    num_show
  end

  def shopping_cart
    @showShopList = Myshoppinglist.all
    get_shop_list_num
    num_show
  end

  def pay_list
    @showPayShopList = Myshoppinglist.all
    get_shop_list_num
    showFreeList
    num_show
  end

  def num_show
    @buyList = Myshoppinglist.all
    @num_sum = 0
    @count = 0
    @buyList.each do |bl|
      @num_sum += bl.count
      @count = bl.count
    end
    @num_sum = @num_sum.to_i
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
    item = Myshoppinglist.find_by_id(params[:id])
    @count = item.count
    @item_sum = item.price*item.count
    @item_pro_sum = item.price*(item.count - (item.count/3).to_i).to_i
    @buyList = Myshoppinglist.all
    @all_sum = 0
    @num_sum = 0
    @promotion_sum = 0
    @buyList.each do |bl|
      @num_sum += bl.count
      @all_sum +=  bl.price * bl.count.to_i
    end
    @data=[@count,@item_pro_sum,@item_sum,@num_sum,@all_sum]
    p @data
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
        @data = [3,1,2,0,4]
      else
        if minBtn.count <= 0
          minBtn.delete
          @data=[0,1,2,3,4]
        else
          item = Myshoppinglist.find_by_id(params[:id])
          @count = item.count
          @item_sum = item.price*item.count
          @item_pro_sum = item.price*(item.count - (item.count/3).to_i).to_i
          @buyList = Myshoppinglist.all
          @all_sum = 0
          @num_sum = 0
          @promotion_sum = 0
          @buyList.each do |bl|
            @num_sum += bl.count
            @all_sum +=  bl.price * bl.count.to_i
          end
          @data=[@count,@item_pro_sum,@item_sum,@num_sum,@all_sum]
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

  def get_shop_list_num
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
      format.js
    end
  end

  def showFreeList
    if
    promotionBar = Mypromotion.all
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



