<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>首页</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="../lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
    <link rel="stylesheet" href="../css/public.css" media="all">
    <script src="../lib/jquery-3.4.1/jquery-3.4.1.min.js"></script>
    <script>
        var arr1 = [], arr_today1 = [],arr_oneMonth1=[],arr_threeMonth1=[],arr_sixMonth1=[],arr_year1=[];
        var arr2 = [], arr_today2 = [];arr_oneMonth2=[];arr_threeMonth2=[];arr_sixMonth2=[];arr_year2=[];
        for (let j = 0; j < 24; j++) {
            arr_today1[j] = 0;
            arr_today2[j] = 0;
            arr_oneMonth1[j]=0;
            arr_oneMonth2[j]=0;
            arr_threeMonth1[j]=0;
            arr_threeMonth2[j]=0;
            arr_sixMonth1[j]=0;
            arr_sixMonth2[j]=0;
            arr_year1[j]=0;
            arr_year2[j]=0;
        }
        for (let j = 0; j < 7; j++) {
            arr1[j] = 0;
            arr2[j] = 0;
        }
        $(function () {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/message/messageCount",
                success: function (data) {
                    let sum1 = 0, sum2 = 0;
                    let num1, num2;
                    for (let i = 0; i < data.data.s1.length; i++) {
                        let day1 = Number.parseInt(data.data.s1[i].days);
                        num1 = Number.parseInt(data.data.s1[i].count);
                        arr1[day1 - 1] = num1;
                        sum1 += num1;

                    }
                    for (let i = 0; i < data.data.s2.length; i++) {
                        let day2 = Number.parseInt(data.data.s2[i].days);
                        num2 = Number.parseInt(data.data.s2[i].count);
                        sum2 += num2;
                        arr2[day2 - 1] = num2;
                    }
                    $("#message2").html(sum2);
                    $("#fangwen2").html(sum1);
                }
            });
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/message/todayMessage",
                success: function (data) {
                    let sum1 = 0, sum2 = 0;
                    let num1, num2;
                    for (let i = 0; i < data.data.s1.length; i++) {
                        let day1 = Number.parseInt(data.data.s1[i].days);
                        num1 = Number.parseInt(data.data.s1[i].count);
                        arr_today1[day1 - 1] = num1;
                        sum1 += num1;
                    }
                    for (let i = 0; i < data.data.s2.length; i++) {
                        let day2 = Number.parseInt(data.data.s2[i].days);
                        num2 = Number.parseInt(data.data.s2[i].count);
                        arr_today2[day2 - 1] = num2;
                        sum2 += num2;
                    }
                    $("#message1").html(sum2);
                    $("#fangwen1").html(sum1);
                }
            });
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/message/oneMonthMessage",
                success: function (data) {
                    let sum1 = 0, sum2 = 0;
                    let num1, num2;
                    for (let i = 0; i < data.data.s1.length; i++) {
                        let day1 = Number.parseInt(data.data.s1[i].days);
                        num1 = Number.parseInt(data.data.s1[i].count);
                        arr_oneMonth1[day1 - 1] = num1;
                        sum1 += num1;
                    }
                    for (let i = 0; i < data.data.s2.length; i++) {
                        let day2 = Number.parseInt(data.data.s2[i].days);
                        num2 = Number.parseInt(data.data.s2[i].count);
                        arr_oneMonth2[day2 - 1] = num2;
                        sum2 += num2;
                    }
                    $("#message3").html(sum2);
                    $("#fangwen3").html(sum1);
                }
            });

            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/message/threeMonthMessage",
                success: function (data) {
                    let sum1 = 0, sum2 = 0;
                    let num1, num2;
                    for (let i = 0; i < data.data.s1.length; i++) {
                        let day1 = Number.parseInt(data.data.s1[i].days);
                        num1 = Number.parseInt(data.data.s1[i].count);
                        arr_threeMonth1[day1 - 1] = num1;
                        sum1 += num1;
                    }
                    for (let i = 0; i < data.data.s2.length; i++) {
                        let day2 = Number.parseInt(data.data.s2[i].days);
                        num2 = Number.parseInt(data.data.s2[i].count);
                        arr_threeMonth2[day2 - 1] = num2;
                        sum2 += num2;
                    }
                    $("#message4").html(sum2);
                    $("#fangwen4").html(sum1);
                }
            });
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/message/sixMonthMessage",
                success: function (data) {
                    let sum1 = 0, sum2 = 0;
                    let num1, num2;
                    for (let i = 0; i < data.data.s1.length; i++) {
                        let day1 = Number.parseInt(data.data.s1[i].days);
                        num1 = Number.parseInt(data.data.s1[i].count);
                        arr_sixMonth1[day1 - 1] = num1;
                        sum1 += num1;
                    }
                    for (let i = 0; i < data.data.s2.length; i++) {
                        let day2 = Number.parseInt(data.data.s2[i].days);
                        num2 = Number.parseInt(data.data.s2[i].count);
                        arr_sixMonth2[day2 - 1] = num2;
                        sum2 += num2;
                    }
                    $("#message5").html(sum2);
                    $("#fangwen5").html(sum1);
                }
            });
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/message/yearMessage",
                success: function (data) {
                    let sum1 = 0, sum2 = 0;
                    let num1, num2;
                    for (let i = 0; i < data.data.s1.length; i++) {
                        let day1 = Number.parseInt(data.data.s1[i].days);
                        num1 = Number.parseInt(data.data.s1[i].count);
                        arr_year1[day1 - 1] = num1;
                        sum1 += num1;
                    }
                    for (let i = 0; i < data.data.s2.length; i++) {
                        let day2 = Number.parseInt(data.data.s2[i].days);
                        num2 = Number.parseInt(data.data.s2[i].count);
                        arr_year2[day2 - 1] = num2;
                        sum2 += num2;
                    }
                    $("#message6").html(sum2);
                    $("#fangwen6").html(sum1);
                }
            });
        });
    </script>
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <div class="layui-tab layui-tab-brief">
            <ul class="layui-tab-title">
                <li class="layui-this layui-btn-primary web-tab">今日</li>
                <li class="layui-btn-primary web-tab">近七天</li>
                <li class="layui-btn-primary web-tab">近1个月</li>
                <li class="layui-btn-primary web-tab">近3个月</li>
                <li class="layui-btn-primary web-tab">近6个月</li>
                <li class="layui-btn-primary web-tab">近1年</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <div class="layui-row">
                        <div class="layui-col-md6">
                            <div class="layui-card-header" style="font-size: 25px"><i class="fa fa-eye icon"></i>访问量
                            </div>
                            <div class="layui-card-body">
                                <h1 id="fangwen1"></h1>
                            </div>
                        </div>
                        <div class="layui-col-md6">
                            <div class="layui-card-header" style="font-size: 25px"><i class="fa fa-comment-o icon"></i>留言量
                            </div>
                            <div class="layui-card-body">
                                <h1 id="message1"></h1>
                            </div>
                        </div>
                    </div>
                    <div class="layui-row">
                        <div class="layui-col-md12">
                            <div class="layui-card">
                                <div class="layui-card-header"><i class="fa fa-line-chart icon"></i>报表统计</div>
                                <div class="layui-card-body">
                                    <div id="echarts-records1" style="width: 100%;min-height:500px"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div class="layui-row">
                        <div class="layui-col-md6">
                            <div class="layui-card-header" style="font-size: 25px"><i class="fa fa-eye icon"></i>访问量
                            </div>
                            <div class="layui-card-body">
                                <h1 id="fangwen2"></h1>
                            </div>
                        </div>
                        <div class="layui-col-md6">
                            <div class="layui-card-header" style="font-size: 25px"><i class="fa fa-comment-o icon"></i>留言量
                            </div>
                            <div class="layui-card-body">
                                <h1 id="message2"></h1>
                            </div>
                        </div>
                    </div>
                    <div class="layui-row">
                        <div class="layui-col-md12">
                            <div class="layui-card">
                                <div class="layui-card-header"><i class="fa fa-line-chart icon"></i>报表统计</div>
                                <div class="layui-card-body">
                                    <div id="echarts-records2" style="width: 100%;min-height:500px"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div class="layui-row">
                        <div class="layui-col-md6">
                            <div class="layui-card-header" style="font-size: 25px"><i class="fa fa-eye icon"></i>访问量
                            </div>
                            <div class="layui-card-body">
                                <h1 id="fangwen3"></h1>
                            </div>
                        </div>
                        <div class="layui-col-md6">
                            <div class="layui-card-header" style="font-size: 25px"><i class="fa fa-comment-o icon"></i>留言量
                            </div>
                            <div class="layui-card-body">
                                <h1 id="message3"></h1>
                            </div>
                        </div>
                    </div>
                    <div class="layui-row">
                        <div class="layui-col-md12">
                            <div class="layui-card">
                                <div class="layui-card-header"><i class="fa fa-line-chart icon"></i>报表统计</div>
                                <div class="layui-card-body">
                                    <div id="echarts-records3" style="width: 100%;min-height:500px"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div class="layui-row">
                        <div class="layui-col-md6">
                            <div class="layui-card-header" style="font-size: 25px"><i class="fa fa-eye icon"></i>访问量
                            </div>
                            <div class="layui-card-body">
                                <h1 id="fangwen4"></h1>
                            </div>
                        </div>
                        <div class="layui-col-md6">
                            <div class="layui-card-header" style="font-size: 25px"><i class="fa fa-comment-o icon"></i>留言量
                            </div>
                            <div class="layui-card-body">
                                <h1 id="message4"></h1>
                            </div>
                        </div>
                    </div>
                    <div class="layui-row">
                        <div class="layui-col-md12">
                            <div class="layui-card">
                                <div class="layui-card-header"><i class="fa fa-line-chart icon"></i>报表统计</div>
                                <div class="layui-card-body">
                                    <div id="echarts-records4" style="width: 100%;min-height:500px"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div class="layui-row">
                        <div class="layui-col-md6">
                            <div class="layui-card-header" style="font-size: 25px"><i class="fa fa-eye icon"></i>访问量
                            </div>
                            <div class="layui-card-body">
                                <h1 id="fangwen5"></h1>
                            </div>
                        </div>
                        <div class="layui-col-md6">
                            <div class="layui-card-header" style="font-size: 25px"><i class="fa fa-comment-o icon"></i>留言量
                            </div>
                            <div class="layui-card-body">
                                <h1 id="message5"></h1>
                            </div>
                        </div>
                    </div>
                    <div class="layui-row">
                        <div class="layui-col-md12">
                            <div class="layui-card">
                                <div class="layui-card-header"><i class="fa fa-line-chart icon"></i>报表统计</div>
                                <div class="layui-card-body">
                                    <div id="echarts-records5" style="width: 100%;min-height:500px"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div class="layui-row">
                        <div class="layui-col-md6">
                            <div class="layui-card-header" style="font-size: 25px"><i class="fa fa-eye icon"></i>访问量
                            </div>
                            <div class="layui-card-body">
                                <h1 id="fangwen6"></h1>
                            </div>
                        </div>
                        <div class="layui-col-md6">
                            <div class="layui-card-header" style="font-size: 25px"><i class="fa fa-comment-o icon"></i>留言量
                            </div>
                            <div class="layui-card-body">
                                <h1 id="message6"></h1>
                            </div>
                        </div>
                    </div>
                    <div class="layui-row">
                        <div class="layui-col-md12">
                            <div class="layui-card">
                                <div class="layui-card-header"><i class="fa fa-line-chart icon"></i>报表统计</div>
                                <div class="layui-card-body">
                                    <div id="echarts-records6" style="width: 100%;min-height:500px"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="../js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use(['layer', 'miniTab', 'echarts'], function () {
        var $ = layui.jquery,
            layer = layui.layer,
            miniTab = layui.miniTab,
            echarts = layui.echarts;
        miniTab.listen();
        /**
         * 报表功能1 今天
         */
        var echartsRecords1 = echarts.init(document.getElementById('echarts-records1'), 'walden');
        var optionRecords1 = {
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['访问量', '留言量']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name: '访问量',
                    type: 'line',
                    data: [arr_today1[0], arr_today1[1], arr_today1[2], arr_today1[3], arr_today1[4], arr_today1[5],
                        arr_today1[6], arr_today1[7], arr_today1[8], arr_today1[9], arr_today1[10], arr_today1[11],
                        arr_today1[12], arr_today1[13], arr_today1[14], arr_today1[15], arr_today1[16], arr_today1[17],
                        arr_today1[18], arr_today1[19], arr_today1[20], arr_today1[21], arr_today1[22], arr_today1[23]
                    ]
                },
                {
                    name: '留言量',
                    type: 'line',
                    data: [arr_today2[0], arr_today2[1], arr_today2[2], arr_today2[3], arr_today2[4], arr_today2[5],
                        arr_today2[6], arr_today2[7], arr_today2[8], arr_today2[9], arr_today2[10], arr_today2[11],
                        arr_today2[12], arr_today2[13], arr_today2[14], arr_today2[15], arr_today2[16], arr_today2[17],
                        arr_today2[18], arr_today2[19], arr_today2[20], arr_today2[21], arr_today2[22], arr_today2[23]
                    ]
                }
            ]
        };
        echartsRecords1.setOption(optionRecords1);
        // echarts 窗口缩放自适应
        window.onresize = function () {
            echartsRecords1.resize();
        };
        /**
         * 报表功能2 近7天
         */
        var echartsRecords2 = echarts.init(document.getElementById('echarts-records2'), 'walden');
        var optionRecords2 = {
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['访问量', '留言量']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ['第一天', '第二天', '第三天', '第四天', '第五天', '第六天', '今日']
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name: '访问量',
                    type: 'line',
                    data: [arr1[0], arr1[1], arr1[2], arr1[3], arr1[4], arr1[5], arr1[6]]
                },
                {
                    name: '留言量',
                    type: 'line',
                    data: [arr2[0], arr2[1], arr2[2], arr2[3], arr2[4], arr2[5], arr2[6]]
                }
            ]
        };
        echartsRecords2.setOption(optionRecords2);
        // echarts 窗口缩放自适应
        window.onresize = function () {
            echartsRecords2.resize();
        };
        /**
         * 报表功能3 近1个月
         */
        var echartsRecords3 = echarts.init(document.getElementById('echarts-records3'), 'walden');
        var optionRecords3 = {
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['访问量', '留言量']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ['第一周','第二周','第三周','本周']
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name: '访问量',
                    type: 'line',
                    data: [arr_oneMonth1[0], arr_oneMonth1[1], arr_oneMonth1[2], arr_oneMonth1[3]]
                },
                {
                    name: '留言量',
                    type: 'line',
                    data: [arr_oneMonth2[0], arr_oneMonth2[1], arr_oneMonth2[2], arr_oneMonth2[3]]
                }
            ]
        };
        echartsRecords3.setOption(optionRecords3);
        // echarts 窗口缩放自适应
        window.onresize = function () {
            echartsRecords3.resize();
        };
        /**
         * 报表功能4 近3个月
         */
        var echartsRecords4 = echarts.init(document.getElementById('echarts-records4'), 'walden');
        var optionRecords4 = {
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['访问量', '留言量']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ['第一周','第二周','第三周','第四周','第五周','第六周','第七周','第八周','第九周','第十周','第十一周','本周']
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name: '访问量',
                    type: 'line',
                    data: [arr_threeMonth1[0], arr_threeMonth1[1], arr_threeMonth1[2], arr_threeMonth1[3],
                        arr_threeMonth1[4], arr_threeMonth1[5], arr_threeMonth1[6], arr_threeMonth1[7],
                        arr_threeMonth1[8], arr_threeMonth1[9], arr_threeMonth1[10], arr_threeMonth1[11]

                    ]
                },
                {
                    name: '留言量',
                    type: 'line',
                    data: [arr_threeMonth2[0], arr_threeMonth2[1], arr_threeMonth2[2], arr_threeMonth2[3],
                        arr_threeMonth2[4], arr_threeMonth2[5], arr_threeMonth2[6], arr_threeMonth2[7],
                        arr_threeMonth2[8], arr_threeMonth2[9], arr_threeMonth2[10], arr_threeMonth2[11]]
                }
            ]
        };
        echartsRecords4.setOption(optionRecords4);
        // echarts 窗口缩放自适应
        window.onresize = function () {
            echartsRecords4.resize();
        };
        /**
         * 报表功能5 近6个月
         */
        var echartsRecords5 = echarts.init(document.getElementById('echarts-records5'), 'walden');
        var optionRecords5 = {
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['访问量', '留言量']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ['第一月','第二月','第三月','第四月','第五月','本月']
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name: '访问量',
                    type: 'line',
                    data: [arr_sixMonth1[0], arr_sixMonth1[1], arr_sixMonth1[2], arr_sixMonth1[3],
                        arr_sixMonth1[4], arr_sixMonth1[5]
                    ]
                },
                {
                    name: '留言量',
                    type: 'line',
                    data: [arr_sixMonth2[0], arr_sixMonth2[1], arr_sixMonth2[2], arr_sixMonth2[3],
                        arr_sixMonth2[4], arr_sixMonth2[5]
                        ]
                }
            ]
        };
        echartsRecords5.setOption(optionRecords5);
        // echarts 窗口缩放自适应
        window.onresize = function () {
            echartsRecords5.resize();
        };
        /**
         * 报表功能6 近1年
         */
        var echartsRecords6 = echarts.init(document.getElementById('echarts-records6'), 'walden');
        var optionRecords6 = {
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['访问量', '留言量']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ['一','二','三','四','五','六','七','八','九','十','十一','十二']
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name: '访问量',
                    type: 'line',
                    data: [arr_year1[0], arr_year1[1], arr_year1[2], arr_year1[3],
                        arr_year1[4], arr_year1[5], arr_year1[6], arr_year1[7],
                        arr_year1[8], arr_year1[9], arr_year1[10], arr_year1[11]
                    ]
                },
                {
                    name: '留言量',
                    type: 'line',
                    data: [arr_year2[0], arr_year2[1], arr_year2[2], arr_year2[3],
                        arr_year2[4], arr_year2[5], arr_year2[6], arr_year2[7],
                        arr_year2[8], arr_year2[9], arr_year2[10], arr_year2[11]
                    ]
                }
            ]
        };
        echartsRecords6.setOption(optionRecords6);
        // echarts 窗口缩放自适应
        window.onresize = function () {
            echartsRecords6.resize();
        }
        
        $(".web-tab").click(function () {
            setTimeout(function () {//延迟0.3s
               echartsRecords1.resize();//重新加载宽高
               echartsRecords2.resize();//重新加载宽高
               echartsRecords3.resize();//重新加载宽高
               echartsRecords4.resize();//重新加载宽高
               echartsRecords5.resize();//重新加载宽高
               echartsRecords6.resize();//重新加载宽高
            }, 300);
        });
    });
</script>
</body>
</html>
