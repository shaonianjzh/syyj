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
    <script src="../lib/jquery-3.4.1/jquery-3.4.1.min.js"></script>
    <script>
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/company/getJoin",
            success: function (data) {
                $("#demo_advantage").html(data.data.joinAdvantage);
                $("#demo_condition").html(data.data.joinCondition);
                $("#demo_progress").html(data.data.joinProgress);
            }
        });
    </script>
</head>
<body>
<div class="layuimini-container">
    <div class="layui-tab layui-tab-brief">
        <ul class="layui-tab-title">
            <li class="layui-this layui-btn-primary">加盟优势</li>
            <li class="layui-btn-primary">加盟条件</li>
            <li class="layui-btn-primary">加盟流程</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <textarea id="demo_advantage" style="display: none;"></textarea>
                <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn1">保存</button>
            </div>
            <div class="layui-tab-item layui-show">
                <textarea id="demo_condition" style="display: none;"></textarea>
                <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn2">保存</button>
            </div>
            <div class="layui-tab-item layui-show">
                <textarea id="demo_progress" style="display: none;"></textarea>
                <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn3">保存</button>
            </div>
        </div>
    </div>
</div>

<script src="../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="../lib/jquery-3.4.1/jquery-3.4.1.min.js"></script>

<script>
    layui.use(['layedit','jquery','form'], function(){
        var layedit = layui.layedit,
            form = layui.form,
        $ = layui.$;
        layedit.set({
            uploadImage: {
                url: '${pageContext.request.contextPath}/company/joinUploadImage' //接口url
                , type: 'post' //默认post
            }
        });
        var index1 = layedit.build('demo_advantage'); //建立编辑器
        form.on('submit(saveBtn1)', function (data) {
            // var result = JSON.stringify(data.field);
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/company/joinAdvantage",
                data: JSON.stringify(layedit.getContent(index1)),
                contentType:"application/json",
                success: function () {
                    alert("保存成功");
                }
            });
        });
        var index2 = layedit.build('demo_condition'); //建立编辑器
        form.on('submit(saveBtn2)', function (data) {
            // var result = JSON.stringify(data.field);
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/company/joinCondition",
                data: JSON.stringify(layedit.getContent(index2)),
                contentType:"application/json",
                success: function () {
                    alert("保存成功");
                }
            });
        });
        var index3 = layedit.build('demo_progress'); //建立编辑器
        form.on('submit(saveBtn3)', function (data) {
            // var result = JSON.stringify(data.field);
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/company/joinProgress",
                data: JSON.stringify(layedit.getContent(index3)),
                contentType:"application/json",
                success: function () {
                    alert("保存成功");
                }
            });
        });
    });

</script>
</body>
</html>
