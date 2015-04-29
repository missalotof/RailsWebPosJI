/**
 * Created by candy on 15-4-24.
 */
//function addShoppingData(){
//    $.post('/home/product_list')
//}
function LoadProductNum()
{
    var obj = {
        type: "GET",
        url: "/getListNumSum",
        dataType: "json",
        success: function(data){
            $('#shoppingCartNumShow').text("购物车"+"("+data+")")
        },
        timeout: 5000
    };
    $.ajax(obj);
}
function loadShoppingCart()
{
    $.ajax({
        type:"post",
        url:"addShoppingItem",
        dataType:"json",
        success: function(){

        },
        data:{

        },
        timeout: 5000
    })
}
