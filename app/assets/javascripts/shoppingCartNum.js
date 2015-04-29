function test(){
    var cart_list = JSON.parse(localStorage.getItem('cart_list'));
    var cartNum = 0;
    for(var i in cart_list){
        cartNum += cart_list[i].count;
    }
    $('#shoppingCartNumShow').text("购物车"+"("+cartNum+")")
}