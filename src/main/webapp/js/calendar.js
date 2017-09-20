/**
 * Created by webrx on 2017-09-20.
 */
$(function() {
    queryUserAccount();
    //$('#calendar').eCalendar();
    $.ajax({
        dataType: "json",
        type: "get",
        url: "/signClickController/querySign?t=" + new Date().getTime(),
        success: function(data) {
            if (data == -100000) {
                $("#signState").attr("class", "qdBtn canNot");
                $("#signState").removeAttr("href");
                $('#calendar').eCalendar({
                    weekDays: ['日', '一', '二', '三', '四', '五', '六'],
                    months: ['01月', '02月', '03月', '04月', '05月', '06月', '07月', '08月', '09月', '10月', '11月', '12月'],
                    events: []
                });
            } else {
                $.ajax({
                    dataType: "json",
                    type: "get",
                    url: "/signClickController/selectNewSign?t=" + new Date().getTime(),
                    success: function(results) {
                        if (results.result == 3) {
                            $("#signState").removeAttr("href");
                            $("#signState").attr("class", "qdBtn canNot");
                            var a = null;
                            var year = null;
                            var month = null;
                            var date = null;
                            var events = [];
                            for (var one in data) { //循环放入
                                year = data[one].year;
                                month = data[one].month;
                                date = data[one].date;
                                events.push({
                                    title: 'Event Title',
                                    start: 'Description',
                                    datetime: new Date(year, month - 1, date)
                                });
                            }
                            $('#calendar').eCalendar({
                                weekDays: ['日', '一', '二', '三', '四', '五', '六'],
                                months: ['01月', '02月', '03月', '04月', '05月', '06月', '07月', '08月', '09月', '10月', '11月', '12月'],
                                events: events
                            });
                        } else {
                            $("#signState").attr("class", "qdBtn");
                            var a = null;
                            var year = null;
                            var month = null;
                            var date = null;
                            var events = [];
                            for (var one in data) { //循环放入
                                year = data[one].year;
                                month = data[one].month;
                                date = data[one].date;
                                events.push({
                                    title: 'Event Title',
                                    start: 'Description',
                                    datetime: new Date(year, month - 1, date)
                                });
                            }
                            $('#calendar').eCalendar({
                                weekDays: ['日', '一', '二', '三', '四', '五', '六'],
                                months: ['01月', '02月', '03月', '04月', '05月', '06月', '07月', '08月', '09月', '10月', '11月', '12月'],
                                events: events
                            });
                        }
                    }
                });
            }
        }
    })
});