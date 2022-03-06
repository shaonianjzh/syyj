<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
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
                <li class="layui-this layui-btn-primary">种类</li>
                <li class="layui-btn-primary">材质</li>
                <li class="layui-btn-primary">空间</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
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
                <div class="layui-tab-item">
                    <script type="text/html" id="toolbarDemo2">
                        <div class="layui-btn-container">
                            <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> 添加
                            </button>
                        </div>
                    </script>

                    <table class="layui-hide" id="currentTableId2" lay-filter="currentTableFilter2"></table>

                    <script type="text/html" id="currentTableBar2">
                        <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
                        <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
                    </script>
                </div>
                <div class="layui-tab-item">
                    <script type="text/html" id="toolbarDemo3">
                        <div class="layui-btn-container">
                            <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> 添加
                            </button>
                        </div>
                    </script>

                    <table class="layui-hide" id="currentTableId3" lay-filter="currentTableFilter3"></table>

                    <script type="text/html" id="currentTableBar3">
                        <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
                        <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
                    </script>
                </div>

            </div>
        </div>
    </div>
</div>

<script src="../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="../lib/jquery-3.4.1/jquery-3.4.1.min.js"></script>
<script>
    layui.use(['form', 'table', 'jquery', 'element'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table,
            element = layui.element;

        table.render({
            id: 'productList1',
            elem: '#currentTableId1',
            url: '${pageContext.request.contextPath}/product/findProductType',
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
                {field: 'name', width: "", title: '名称', sort: true, align: 'center'},
                {field: 'number', width: "", title: '当前产品数量', sort: true, align: 'center'},
                {title: '操作', minWidth: "", toolbar: '#currentTableBar1', align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: false,
            size: 'lg'
        });
        table.render({
            id: 'productList2',
            elem: '#currentTableId2',
            url: '${pageContext.request.contextPath}/product/findProductMaterial',
            toolbar: '#toolbarDemo2',
            loading: true,
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                // {type: "checkbox", width: 50},
                {field: 'id', width: "", title: '序号', width: 80, sort: true, align: 'center'},
                {field: 'name', width: "", title: '名称', sort: true, align: 'center'},
                {field: 'number', width: "", title: '当前产品数量', sort: true, align: 'center'},
                {title: '操作', minWidth: "", toolbar: '#currentTableBar2', align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: false,
            size: 'lg'
        });
        table.render({
            id: 'productList3',
            elem: '#currentTableId3',
            url: '${pageContext.request.contextPath}/product/findProductSpace',
            toolbar: '#toolbarDemo3',
            loading: true,
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {field: 'id', width: "", title: '序号', width: 80, sort: true, align: 'center'},
                {field: 'name', width: "", title: '名称', sort: true, align: 'center'},
                {field: 'number', width: "", title: '当前产品数量', sort: true, align: 'center'},
                {title: '操作', minWidth: "", toolbar: '#currentTableBar3', align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: false,
            size: 'lg'
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
                    maxmin: true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: '../page/table/add_type.jsp',
                });
            }
        });
        table.on('toolbar(currentTableFilter2)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                var index = layer.open({
                    title: '添加用户',
                    type: 2,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: '../page/table/add_material.jsp',
                });
            }
        });
        table.on('toolbar(currentTableFilter3)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                var index = layer.open({
                    title: '添加用户',
                    type: 2,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: '../page/table/add_space.jsp',
                });
            }
        });

        table.on('tool(currentTableFilter1)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {

                var index = layer.open({
                    title: '编辑用户',
                    type: 2,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: '${pageContext.request.contextPath}/product/findType/' + data.name,
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
                return false;
            } else if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/product/delType/" + data.name,
                        type: "get",
                        success: function (d) {
                            table.reload('productList1', {})
                            obj.del();
                        }
                    })
                    layer.close(index);
                });
            }
        });
        table.on('tool(currentTableFilter2)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {

                var index = layer.open({
                    title: '编辑用户',
                    type: 2,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: '${pageContext.request.contextPath}/product/findMaterial/' + data.name,
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
                return false;
            } else if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/product/delMaterial/" + data.name,
                        type: "get",
                        success: function (d) {
                            table.reload('productList2', {})
                            obj.del();
                        }
                    })
                    layer.close(index);
                });
            }
        });
        table.on('tool(currentTableFilter3)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {

                var index = layer.open({
                    title: '编辑用户',
                    type: 2,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: '${pageContext.request.contextPath}/product/findSpace/' + data.name,
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
                return false;
            } else if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/product/delSpace/" + data.name,
                        type: "get",
                        success: function (d) {
                            table.reload('productList3', {})
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