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

  def clickBtnToAddItem
    Myshoppinglist.addItemToCart(params[:id])
    @data = Myshoppinglist.returnItemAllSum
    respond_to do |format|
      format.json { render json: @data  }
      format.js
      end
  end
  def addItemBtn
    Myshoppinglist.accumulateCartNum(params[:id])
    @data = Myshoppinglist.returnItemProperty(params[:id])
    respond_to do |format|
      format.json { render json: @data  }
      end
  end

  def minusItemBtn
    if Myshoppinglist.find_by_id(params[:id])
    @data = Myshoppinglist.return_data(params[:id])
      respond_to do |format|
        format.json { render json: @data  }
    end
    end
  end

  def payListsPayBtn
    Myshoppinglist.all.delete_all
    Myfreelist.all.delete_all
    redirect_to :product_list
  end

end



