<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="../css/public.css" media="all">

</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main" style="padding-top: 20px">
        <form class="layui-form layui-form-pane" action="">
            <div class="layui-form-item">
                <div class="layui-form-item">
                    <div class="layui-input-inline">
                        <input type="text" id="keyword" name="keyword" placeholder="请输入关键字" class="layui-input">
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
            </div>
        </form>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> 添加</button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
        </script>

    </div>
</div>
<script src="../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="../lib/jquery-3.4.1/jquery-3.4.1.min.js"></script>
<script>
    layui.use(['form', 'table', 'laydate'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table,
            laydate = layui.laydate;

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
            id: 'productList',
            elem: '#currentTableId',
            url: '${pageContext.request.contextPath}/message/msg',
            // toolbar: '#toolbarDemo',
            // defaultToolbar: ['filter', 'exports', 'print', {
            //     title: '提示',
            //     layEvent: 'LAYTABLE_TIPS',
            //     icon: 'layui-icon-tips'
            // }],
            cols: [[
                {field: 'id', width: 80, title: '序号', sort: true, align: 'center'},
                {field: 'time', width: "", title: '时间', align: 'center'},
                {field: 'name', width: "", title: '称号', sort: true, align: 'center'},
                {field: 'phone', width: "", title: '手机号', align: 'center'},
                {field: 'content', width: "", title: '内容', minWidth: 150, align: 'center'},
                {title: '操作', minWidth: "", toolbar: '#currentTableBar', align: "center"}
            ]],
            limit: 10,
            page: {
                layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']//自定义分页布局
                , limits: [5, 10, 20]
                , first: true //不显示首页
                , last: true //不显示尾页
            },
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            var result = JSON.stringify(data.field);

            // layer.alert(result, {
            //     title: '最终的搜索信息'
            // });
            //执行搜索重载
            table.reload('productList', {
                limit: 10,
                page: {
                    layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']//自定义分页布局
                    , limits: [5, 10, 20]
                    , first: true //不显示首页
                    , last: true //不显示尾页
                },
                url: "${pageContext.request.contextPath}/message/selectMsg",
                where: {
                    keyword:data.field.keyword,
                    start_time:start_time,
                    end_time:end_time
                }
            });

            return false;
        });

        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;
            if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/message/delMsg/" + data.id,
                        type: "get",
                        success: function (d) {
                            table.reload('productList', {})
                            obj.del();
                        }
                    })
                    layer.close(index);
                });
            }
        });

    });
</script>

</body>
</html>