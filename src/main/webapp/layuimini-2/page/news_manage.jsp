<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="../css/public.css" media="all">
</head>
<body>

<div class="layuimini-container">
    <div class="layui-main">
        <div class="layui-tab layui-tab-brief">
            <ul class="layui-tab-title">
                <li class="layui-this layui-btn-primary">新闻</li>
                <li class="layui-btn-primary">保养</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <form class="layui-form layui-form-pane" action="">
                        <div class="layui-form-item">
                            <div class="layui-input-inline">
                                <input type="text" id="keyword" name="keyword" placeholder="请输入关键字" value=""
                                       class="layui-input">
                            </div>
                            <div class="layui-input-inline">
                                <input type="text" id="start_time" name="start_time" class="layui-input" value="">
                            </div>
                            <div class="layui-input-inline">
                                <input type="text" id="end_time" name="end_time" class="layui-input" value="">
                            </div>
                            <div class="layui-inline">
                                <button type="submit" class="layui-btn layui-btn-primary" lay-submit
                                        lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索
                                </button>
                            </div>
                        </div>
                    </form>

                    <script type="text/html" id="toolbarDemo1">
                        <div class="layui-btn-container">
                            <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn"
                                    lay-event="add"> 添加
                            </button>
                        </div>
                    </script>
                    <table class="layui-hide" id="currentTableId1" lay-filter="currentTableFilter1"></table>

                    <script type="text/html" id="currentTableBar1">
                        <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
                        <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
                    </script>
                </div>
                <div class="layui-tab-item layui-show">

                </div>
            </div>
        </div>
    </div>
</div>


<script src="../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="../lib/jquery-3.4.1/jquery-3.4.1.min.js"></script>

<script>
    layui.use(['form', 'table', 'jquery', 'element','laydate'], function () {
        var $ = layui.$,
            form = layui.form,
            table = layui.table,
            laydate = layui.laydate
            element = layui.element;

        var start_time,end_time;
        laydate.render({
            elem: '#start_time',
            type: 'datetime',
            done:function (value,date,endDate) {
                start_time = value;
            }
        });
        laydate.render({
            elem: '#end_time',
            type: 'datetime',
            done:function (value,date,endDate) {
                end_time = value;
            }
        });

        table.render({
            id: 'newsList',
            elem: '#currentTableId1',
            url: '${pageContext.request.contextPath}/news/findNews',
            toolbar: '#toolbarDemo1',
            loading: true,
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                // {type: "checkbox", width: 50},
                {field: 'id', width: "", title: '序号', width: 80, sort: true, align: 'center'},
                {field: 'image', width: "", title: '图片', templet: function (d) {
                        return "<img src='${pageContext.request.contextPath}/layuimini-2/images/news/"+d.image+ "' onclick='showBigImage(this)'/>"
                    }, align: 'center'},
                {field: 'time', width: "", title: '时间', sort: true, align: 'center'},
                {field: 'title', width: "", title: '标题', sort: true, align: 'center'},
                {field: 'content', width: "", title: '内容', sort: true, align: 'center'},
                {title: '操作', minWidth: "", toolbar: '#currentTableBar1', align: "center"}
            ]],
            limit:10,
            page:{
                layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']//自定义分页布局
                ,limits:[5,10,20]
                ,first: true //不显示首页
                ,last: true //不显示尾页
            },
            done: function (res, curr, count) {
                $('.layui-table-cell').css({'height': 'auto'});
            },
            size: 'lg'
        });
        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
          //  var result = JSON.stringify(data.field);

            //执行搜索重载
            table.reload('newsList', {
                limit:10,
                page:{
                    curr:1,
                    layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']//自定义分页布局
                    ,limits:[5,10,20]
                    ,first: true //不显示首页
                    ,last: true //不显示尾页
                },
                url:"${pageContext.request.contextPath}/news/selectNews",
                where: {
                    keyword:data.field.keyword,
                    start_time:start_time,
                    end_time:end_time
                }
            },);
            return false;
        });

        /**
         * toolbar监听事件
         */
        table.on('toolbar(currentTableFilter1)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                var index = layer.open({
                    title: '添加用户',
                    type: 2,
                    shade: 0.2,
                    offset: ['0px'],
                    maxmin: true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: '../page/table/add_news.jsp',
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
            } else if (obj.event === 'delete') {  // 监听删除操作
                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                layer.alert(JSON.stringify(data));
            }
        });
        table.on('tool(currentTableFilter1)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {

                var index = layer.open({
                    title: '编辑用户',
                    type: 2,
                    shade: 0.2,
                    offset: ['0px'],
                    maxmin: true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: '${pageContext.request.contextPath}/news/findNewsById/' + data.id,
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
                return false;
            } else if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/news/delNews/" + data.id,
                        type: "get",
                        success: function (d) {
                            table.reload('cultureList', {})
                            obj.del();
                        }
                    })
                    layer.close(index);
                });
            }
        });
    });
    function showBigImage(e) {
        layer.open({
            type: 1,
            title: false,
             offset: ['0px', '300px'],
            closeBtn: 0,
            shadeClose: true, //点击阴影关闭
            // area: [$(e).width + 'px', $(e).height + 'px'], //宽高
            content: "<img src=" + $(e).attr('src') + " />"
        });
    }
</script>
</body>
</html>
