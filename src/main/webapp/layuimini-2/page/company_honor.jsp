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
    <link rel="stylesheet" type="text/css" href="../lib/js/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../lib/js/cropperjs/cropper.min.css"/>
    <script src="../lib/js/jquery-1.9.1.js" type="text/javascript"></script>
    <style>
        #cropWrapper {
            margin: 20px;
        }

        #cropWrapper img {
            max-width: 100%;
        }

        #inputFile {
            display: none;
        }

        #previewBox {
            overflow-y: scroll;
            overflow-x: hidden;
        }

        #previewBox img {
            margin: 10px;
        }
    </style>


</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button id="add_honor" class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add">
                    添加
                </button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
        </script>

    </div>
</div>

<div class="modal fade" id="myModal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog"
     tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h1 class="modal-title" id="myModalLabel" style="font-size:20px;">截取图片</h1>
            </div>
            <div class="modal-body">
                <div class="continer">
                    <div class="col-md-9">
                        <div id="cropWrapper">
                            <img src="../images/plus.png" alt=""/><br/>
                            <input type="file" id="inputFile" accept="image/jpg,image/jpeg,image/gif,image/png"/>
                        </div>
                    </div>
                    <div class="col-md-3" id="previewBox"></div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-12 text-right">
                    <button type="button" class="btn btn-success" id="btnCropImage">
                        裁剪
                    </button>
                    <button type="button" class="btn btn-default" id="btnDismissDialog" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="../lib/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script src="../lib/js/cropperjs/cropper.min.js" type="text/javascript"></script>


<script>
    layui.use(['form', 'table', 'upload','jquery'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table,
            upload = layui.upload;
        // croppers = layui.croppers;
        table.render({
            id: 'honorList',
            elem: '#currentTableId',
            url: '${pageContext.request.contextPath}/company/honor',
            toolbar: '#toolbarDemo',
            loading: true,
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                // {type: "checkbox", width: 50},
                {field: 'id', width: 80, title: '序号', sort: true, align: 'center'},
                {
                    field: 'image', width: "", title: '荣誉图片', templet: function (d) {
                        return "<img src='${pageContext.request.contextPath}/layuimini-2/images/honor/" + d.image + "' onclick='showBigImage(this)'/>"
                    }
                    , align: 'center'
                },
                {title: '操作', minWidth: "", toolbar: '#currentTableBar', align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: false,
            done: function (res, curr, count) {
                $('.layui-table-cell').css({'height': 'auto'});
            },
            size: 'lg'
        });

        /**
         * toolbar监听事件
         */
        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                layer.open({
                    type: 1,
                    title: false,
                    closeBtn: 0,
                    shadeClose: true, //点击阴影关闭
                    content: "<button type='button' class='layui-btn' id='test1'> <i class='layui-icon'>&#xe67c;</i>上传图片</button>"
                });
            }
            uploadInst = upload.render({
                elem: '#test1' //绑定元素
                , url: '${pageContext.request.contextPath}/company/uploadHonorImage' //上传接口
                , done: function (res) {
                    alert("上传成功");
                    location.reload();
                }
                , error: function () {
                    //请求异常回调
                    layer.msg("上传失败,文件不能大于5mb,请重新上传");
                }
            });
        });

        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                layer.open({
                    type: 1,
                    title: false,
                    closeBtn: 0,
                    shadeClose: true, //点击阴影关闭
                    content: "<button type='button' class='layui-btn' id='test2'> <i class='layui-icon'>&#xe67c;</i>上传图片</button>"
                });
                upload.render({
                    elem: '#test2' //绑定元素
                    , url: '${pageContext.request.contextPath}/company/updateHonorImage'
                    , data: {id: data.id}   //上传接口
                    , done: function (res) {
                        alert("上传成功");
                        //上传完毕回调
                        <%--$(".company-img").css("backgroundImage","url('${pageContext.request.contextPath}/layuimini-2/images/honor/"+res.data+"')");--%>
                        // var iframeIndex = parent.layer.getFrameIndex(window.name);
                        // parent.layer.close(iframeIndex);
                        location.reload();
                    }
                    , error: function () {
                        //请求异常回调
                        layer.msg("上传失败,文件不能大于5mb,请重新上传");
                    }
                });
            } else if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/company/delHonor/" + data.id,
                        type: "get",
                        success: function (d) {
                            table.reload('honorList', {})
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
            shadeClose: true, //点击阴影关闭
            area: [$(e).width + 'px', $(e).height + 'px'], //宽高
            content: "<img src=" + $(e).attr('src') + " />"
        });
    }
</script>
</body>

</html>