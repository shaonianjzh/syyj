<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../../lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="../../css/public.css" media="all">
    <style>
        body {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<form id="culture-form" class="layui-form layuimini-form">
    <input id="id" name="id" type="hidden">
    <div class="layui-form-item">
        <label class="layui-form-label">图片</label>
        <div class="layui-input-inline">
            <button type="button" class="layui-btn" id="test1">
                <i class="layui-icon">&#xe67c;</i>上传图片
            </button>
            <div>
                <img id="image" src="" style="width: 240px;height: 300px">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">标题</label>
        <div class="layui-input-inline">
            <input type="text" id="title" name="title" lay-verify="required" lay-reqtext="标题不能为空" placeholder="请输入标题"
                   value=""
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <textarea id="demo" style="display: none;"></textarea>
        <button id="culture-save" class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认保存</button>
    </div>
</form>
<script src="../../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>

    layui.use(['form', 'upload','jquery','layedit'], function () {
        var form = layui.form,
            upload = layui.upload,
            layer = layui.layer,
            layedit = layui.layedit,
            $ = layui.$;


        layedit.set({
            uploadImage: {
                url: '${pageContext.request.contextPath}/news/addNewsImage' //接口url
                , type: 'post' //默认post
            }
        });
        var index = layedit.build('demo'); //建立编辑器

        upload.render({
            elem: '#test1' //绑定元素
            , url: '${pageContext.request.contextPath}/news/uploadNewsImage' //上传接口
            , done: function (res) {
                $("#image").attr("src", "${pageContext.request.contextPath}/layuimini-2/images/news/"+res.data);
            }
            , error: function () {
                //请求异常回调
                alert("上传失败,文件不能大于5mb,请重新上传");
            }
        });
        //监听提交
        form.on('submit(saveBtn)', function (data) {
            // var index = layer.alert(JSON.stringify(data.field), {
            //     title: '最终的提交信息'
            // }, function () {
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/news/addNews",
                data:{
                    title:data.field.title,
                    content:layedit.getContent(index)
                },
                // contentType:"application/json",
                success: function () {
                    parent.location.reload();
                }
            });
            var iframeIndex = parent.layer.getFrameIndex(window.name);
            parent.layer.close(iframeIndex);
            // });
            return false;
        });

    });
</script>
</body>
</html>