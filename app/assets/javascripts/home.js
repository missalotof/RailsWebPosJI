/**
 * Created by candy on 15-4-24.
 */
function loadShoppingCart(id)
{
    $.get('addShoppingItem?id='+id,function(data){
        $('.shopping_test_name').text(data[0])
    })
}
function reduce_goods(id)
{
    $.get('get_goods_min?id='+id,function(data){
        if(data[0] == 0){
            var list_id = '#' + id + 'tr_id';
            $(list_id).remove();
        }
        if(data[3] == 0){
            window.location = '/home/product_list'
        }
        else {
            var new_id = '#' + id + 'count_id';
            $(new_id)[0].value = data[0];
            $('#' + id + 'totle_id').text(data[2]);
            $('#' + id + 'pro_totle_id').text(data[1] + '元(原价：' + data[2] + '元)');
            $('.shopping_test_name').text(data[3]);
            $('#shop_list_sum').text('总计：' + data[4] + '元')
        }
    })
}
function add_goods(id)
{
    $.get('get_goods_add?id='+id,function(data){
            $('.shopping_test_name').text(data[3]);
            $('#' + id + 'count_id')[0].value = data[0];
            $('#'+id+'totle_id').text(data[2]);
            $('#'+id+'pro_totle_id').text(data[1]+'元(原价：'+data[2]+ '元)');
            $('#shop_list_sum').text('总计：'+data[4]+'元')
    })

}
//function pay_button(id)
//{
//    $.get('click_to_pay?id='+id,function(data){
//        if(data = false){
//            window.location = 'home/pay_list'
//        }
//    })
//
//}


