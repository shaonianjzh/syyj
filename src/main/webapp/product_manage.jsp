<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <META HTTP-EQUIV="pragma" CONTENT="no-cache">
    <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
    <META HTTP-EQUIV="expires" CONTENT="0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="./layuimini-2/lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="./layuimini-2/css/public.css" media="all">
    <script src="./layuimini-2/lib/jquery-3.4.1/jquery-3.4.1.min.js"></script>
    <script src="./layuimini-2/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>


    <script>
        var form;
        layui.use(['form'], function () {
            var $ = layui.jquery;
                form = layui.form

        });

        $(function () {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/product/findAllType",
                success: function (res) {
                    for (var i = 0; i < res.length; i++) {
                        $("#type").append("<option value=" + res[i].type + ">" + res[i].type + "</option>");
                        form.render("select");
                    }

                }
            });
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/product/findAllMaterial",
                success: function (res) {
                    for (var i = 0; i < res.length; i++) {
                        $("#material").append("<option value=" + res[i].type + ">" + res[i].type + "</option>");
                        form.render("select");
                    }

                }
            });
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/product/findAllSpace",
                success: function (res) {
                    for (var i = 0; i < res.length; i++) {
                        $("#space").append("<option value=" + res[i].type + ">" + res[i].type + "</option>");
                        form.render("select");
                    }

                }
            });
        });
    </script>
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <fieldset class="table-search-fieldset">
            <legend>????????????</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-form-item">
                            <label class="layui-form-label">??????</label>
                            <div class="layui-input-inline">
                                <select id="type" name="type" lay-filter="aihao">
                                    <option value="" selected=""></option>
                                </select>
                            </div>
                            <label class="layui-form-label">??????</label>
                            <div class="layui-input-inline">
                                <select id="material" name="material" lay-filter="aihao">
                                    <option value="" selected=""></option>
                                </select>
                            </div>
                            <label class="layui-form-label">??????</label>
                            <div class="layui-input-inline">
                                <select id="space" name="space" lay-filter="aihao">
                                    <option value="" selected=""></option>
                                </select>
                            </div>
                            <div class="layui-inline">
                                <button type="submit" class="layui-btn layui-btn-primary" lay-submit
                                        lay-filter="data-search-btn"><i class="layui-icon">???</i> ??? ???
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> ??????</button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">??????</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">??????</a>
        </script>

    </div>
</div>

<script>
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            id: 'productList',
            elem: '#currentTableId',
            url: '${pageContext.request.contextPath}/product/manage',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '??????',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {field: 'id', width: 80, title: '??????', sort: true, align: 'center'},
                {
                    field: 'image', width: "", title: '??????', templet: function (d) {
                        return "<img src='${pageContext.request.contextPath}/layuimini-2/images/product/" + d.image + "' onclick='showBigImage(this)'/>"
                    }
                    , align: 'center'
                },
                {field: 'model', width: "", title: '??????', sort: true, align: 'center'},
                {field: 'type', width: "", title: '??????', align: 'center'},
                {field: 'material', width: "", title: '??????', minWidth: 150, align: 'center'},
                {field: 'size', width: "", title: '??????', sort: true, align: 'center'},
                {field: 'space', width: "", title: '??????', sort: true, align: 'center'},
                {title: '??????', minWidth: "", toolbar: '#currentTableBar', align: "center"}
            ]],
            limit: 10,
            page: {
                layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']//?????????????????????
                , limits: [5, 10, 20]
                , first: true //???????????????
                , last: true //???????????????
            },
            done: function (res, curr, count) {
                $('.layui-table-cell').css({'height': 'auto'});
            },
            // skin: 'row',
            // size: 'lg'size: 'lg'size: 'lg'
        });

        // ??????????????????
        form.on('submit(data-search-btn)', function (data) {
            var result = JSON.stringify(data.field);

            // layer.alert(result, {
            //     title: '?????????????????????'
            // });
            //??????????????????
            table.reload('productList', {
                limit: 10,
                page: {
                    curr: 1,
                    layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']//?????????????????????
                    , limits: [5, 10, 20]
                    , first: true //???????????????
                    , last: true //???????????????
                },
                url: "${pageContext.request.contextPath}/product/selectProduct",
                where: {
                    type: data.field.type,
                    material: data.field.material,
                    space: data.field.space
                }
            });

            return false;
        });

        /**
         * toolbar????????????
         */
        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'add') {  // ??????????????????
                var index = layer.open({
                    title: '????????????',
                    type: 2,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: './layuimini-2/page/table/add_product.jsp',
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
            } else if (obj.event === 'delete') {  // ??????????????????
                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                layer.alert(JSON.stringify(data));
            }
        });

        //???????????????????????????
        table.on('checkbox(currentTableFilter)', function (obj) {
            console.log(obj)
        });

        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {

                var index = layer.open({
                    title: '????????????',
                    type: 2,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: '${pageContext.request.contextPath}/product/findProduct/' + data.id,
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
                return false;
            } else if (obj.event === 'delete') {
                layer.confirm('??????????????????', function (index) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/product/delProduct/" + data.id,
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

    function showBigImage(e) {
        layer.open({
            type: 1,
            title: false,
            closeBtn: 0,
            shadeClose: true, //??????????????????
            area: [$(e).width + 'px', $(e).height + 'px'], //??????
            content: "<img src=" + $(e).attr('src') + " />"
        });
    }
</script>
</body>
</html>