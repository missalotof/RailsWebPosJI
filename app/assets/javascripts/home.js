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
    $.get('get_goods?id='+id,function(data){
        //if(data[0]===0){
        //    var new_id='#'+id+'tr_id';
        // $(new_id).css({
        //     "display":"none"
        // })
        //}

            var new_id = '#' + id + 'count_id';
            console.log(data)
            $(new_id)[0].value = data[0];
            $('#'+id+'totle_id').text(data[1]);
            $('#'+id+'pro_totle_id').text(data[1]+'元(原价：'+data[2]+ '元)');
            $('.shopping_test_name').text(data[3]);
            $('#shop_list_sum').text('总计：'+data[4]+'元')

    })
}
function add_goods(id)
{
    $.get('get_goods_add?id='+id,function(data){
            $('.shopping_test_name').text(data[3]);
            $('#' + id + 'count_id')[0].value = data[0];
            $('#'+id+'totle_id').text(data[1]);
            $('#'+id+'pro_totle_id').text(data[1]+'元(原价：'+data[2]+ '元)');
            $('#shop_list_sum').text('总计：'+data[4]+'元')
    })

}
