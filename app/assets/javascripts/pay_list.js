function print_time(){
    var date = new Date();
    var month = date.getMonth()+1;
    var day = date.getDate();
    var hour = date.getHours();
    var minute = date.getMinutes();
    var second = date.getSeconds();
    var html = '';
    html += date.getFullYear() + '年' + (month < 10 ? 0 : '') + month + '月' + (day < 10 ? 0 : '') + day + '日 ' + (hour < 10 ? 0 : '') + hour + ':' + (minute < 10 ? 0 : '') + minute + ':' + (second < 10 ? 0 : '') + second;
    $('#show_time').text(html);
}
