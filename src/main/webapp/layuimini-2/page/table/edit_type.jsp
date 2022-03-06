<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuimini-2/lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuimini-2/css/public.css" media="all">
    <style>
        body {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<form id="culture-form" class="layui-form layuimini-form">
    <input type="hidden" id="name" name="name" value="${name}">
    <div class="layui-form-item">
        <label class="layui-form-label required">种类</label>
        <div class="layui-input-block">
            <input type="text" id="type" name="type" lay-verify="required" lay-reqtext="种类不能为空" placeholder="请输入种类"
                   value="${name}"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="culture-save" class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认保存</button>
        </div>
    </div>
</form>
<script src="${pageContext.request.contextPath}/layuimini-2/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>

    layui.use(['form'], function () {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.$;

        //监听提交
        form.on('submit(saveBtn)', function (data) {
            // var index = layer.alert(JSON.stringify(data.field), {
            //     title: '最终的提交信息'
            // }, function () {

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/product/editType",
                data: JSON.stringify(data.field),
                contentType:"application/json",
                success: function () {
                    layer.msg("保存成功",{icon:2});
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