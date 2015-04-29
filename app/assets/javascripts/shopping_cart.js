//function loadPromotions() {
//    return [
//        {
//            type: 'BUY_TWO_GET_ONE_FREE',
//            barcodes: [
//                'ITEM000000',
//                'ITEM000001',
//                'ITEM000005'
//            ]
//        }
//    ];
//}
//localStorage.setItem('promotionsList', JSON.stringify(loadPromotions()));
//function getShoppingList(){
//    getFreeList();
//    var new_cart_list = JSON.parse(localStorage.getItem('new_cart_lists'));
//    var html = '';
//    var allSum = 0;
//    html = html +'<tr><td id="h1">分类</td><td id="h2">名称</td><td id="h3">单价(元)</td><td id="h4">单位</td><td id="h5">数量</td><td id="h6">小计</td>';
//    for(var i in new_cart_list){
//        var shopping_free_cart_list = JSON.parse(localStorage.getItem('free_cart_lists'));
//        var check1 = i.toString();
//        var check3 = i.toString();
//        var items = new_cart_list[i];
//        html = html +'<tr>';
//        if(items.freecount !== -1){
//            html = html + '<td>'+items.classify+'</td><td>'+items.name+'</td><td>'+items.price+'</td><td>'+items.unit+'</td><td>'+'<div id="format"><input type="button" id='+check1+' value="-" onclick="minus_btn();turn_to_product()"><input type="text" id="check2" style="width:30px; text-align: center " value='+items.count+'><input type="button" id='+check3+' value="+" onclick="add_btn()"></div></td><td>'+(items.count-items.freecount)*items.price+'元(原价：'+items.count*items.price+'元)</td>';
//            html = html + '</tr>';
//        }
//        else if(items.freecount == -1){
//            html = html + '<td>'+items.classify+'</td><td>'+items.name+'</td><td>'+items.price+'</td><td>'+items.unit+'</td><td>'+'<div id="format"><input type="button" id='+check1+' value="-" onclick="minus_btn();turn_to_product()"><input type="text" id="check2" style="width:30px; text-align: center " value='+items.count+'><input type="button" id='+check3+' value="+" onclick="add_btn()"></div></td><td>'+items.count*items.price+'元</td>';
//            html = html + '</tr>';
//            }
//        allSum += items.count*items.price;
//    }
//    $('.sum').text('总计：'+allSum+'元');
//    $('#add_table').html(html);
//}
//function minus_btn(){
//    var cartList = JSON.parse(localStorage.getItem('cart_list'));
//    var check1 = parseInt(event.srcElement.id,0);
//    if(cartList[check1].count >= 1){
//        cartList[check1].count --;
//    }
//    if(cartList[check1].count == 0){
//        cartList.splice(check1,1);
//    }
//    localStorage.setItem('cart_list', JSON.stringify(cartList));
//    location.reload();
//}
//function turn_to_product(){
//    var cartList = JSON.parse(localStorage.getItem('cart_list'));
//    if(cartList.length == 0){
//        window.location.href='../html_file/product_list.html';
//    }
//}
//function add_btn(){
//    var cartList = JSON.parse(localStorage.getItem('cart_list'));
//    var check3 = parseInt(event.srcElement.id,0);
//    cartList[check3].count ++;
//    localStorage.setItem('cart_list', JSON.stringify(cartList));
//    location.reload();
//}
//function getFreeList() {
//    var promotionsList = JSON.parse(localStorage.getItem('promotionsList'));
//    var cart_list = JSON.parse(localStorage.getItem('cart_list'));
//    var free_cart_lists = [];
//    var new_cart_list = [];
//    for (var m in cart_list){
//        for (var n in promotionsList[0].barcodes){
//            if (promotionsList[0].barcodes[n] == cart_list[m].barcode){
//                cart_list[m].freecount = Math.floor(cart_list[m].count / 3);
//                free_cart_lists.push(cart_list[m]);
//            }
//        }
//        for(var i in promotionsList[0].barcodes){
//            if (promotionsList[0].barcodes[i] == cart_list[m].barcode){
//                cart_list[m].freecount = Math.floor(cart_list[m].count / 3);
//            }
//        }
//        new_cart_list.push(cart_list[m]);
//    }
//    localStorage.setItem('free_cart_lists', JSON.stringify(free_cart_lists));
//    localStorage.setItem('new_cart_lists', JSON.stringify(new_cart_list));
//}