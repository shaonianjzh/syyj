<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8" />
    <title>家具保养</title>
    <link type="text/css" rel="stylesheet" href="./css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script type="text/javascript" src="./js/jquery-3.2.1.min.js"> </script>
    <script type="text/javascript" src="./js/bootstrap.min.js"> </script>

    <script>

        $(function () {
            $.ajax({
                type: "post",
                url:"${pageContext.request.contextPath}/message/findLinkman",
                success:function (data){
                    $("#linkman").html(data.data.linkman);
                    $("#email").html(data.data.email);
                    $("#phone").html(data.data.phone);
                    $("#website").html(data.data.website);
                    $("#qrCode").attr("src","${pageContext.request.contextPath}/layuimini-2/images/linkman/"+data.data.image);
                }
            });
        });
        function addMsg(){
            if($("#name").val()==""||$("#telphone").val()==""||$("#content").val()==""){
                alert("提交内容不能为空");
                return;
            }
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/message/addMsg",
                data:{
                    name:$("#name").val(),
                    telphone:$("#telphone").val(),
                    content:$("#content").val()
                },
                success:function (res) {
                    alert("提交成功");
                }
            });
        }

    </script>
    <style>
        .paddtop {
            margin-top: 10px;
            text-align: center;
        }

        .text_center {
            text-align: center;
        }

        .font_sc {
            color: #6b1c18;
            font-size: 22px;
        }
        .index{
            margin-left: 25px;
            color:#6b1c18;
        }
        .new-image{
            width: 100%;
            height: 200px;
            border-radius: 25px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row paddtop">
        <div class="col-md-6 ">
            <img src="img/home/logo.39da3c57.png" />
        </div>
        <div class="col-md-6">
            <img src="img/home/下载.png" />
            <span class="font_sc">联系电话：13968979018 / 13567723886</span>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <nav class="nav"
                 style="font-size: 18px; text-align: center; margin-top: 30px; margin-bottom: 30px;">
                <a id="a1" class="nav-link index " href="./index.jsp">网站首页</a>
                <a id="a2" class="nav-link index" href="./about.jsp">关于我们</a>
                <a id="a3" class="nav-link index" href="./product.jsp">产品中心</a>
                <a id="a4" class="nav-link index" href="./news.jsp">新闻中心</a>
                <a id="a5" class="nav-link index" href="./maintain.jsp">家具保养</a>
                <a id="a6" class="nav-link index" href="./service.jsp">服务保障</a>
                <a id="a7" class="nav-link index" href="./join.jsp">加盟服务</a>
                <a id="a8" class="nav-link index" href="./tailor-made.jsp">定制服务</a>
            </nav>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="col-12">
        <img src="img/aboout/banner.2efc5dc3.png" style="width: 100%;" />
    </div>
</div>
<div class="container">
    <div class="row" style="margin-bottom: 30px">
        <div class="col-12" style="text-align: center; font-size:xx-large; margin-top: 60px;">
            注意事项
        </div>
        <div class="col-12" style="text-align: center;">悉心 / 呵护</div>
        <div style="font-size: 17px;text-indent: 30px;color: #666666;text-align: center;line-height: 30px;margin-top: 30px;">
            家具如人，人需要养生才能活得长久滋润，家具也需要“养生”——保养，才能历经岁月沧桑而风采依旧。面对阳光、空气、季节更替等自然因素，以及搬动、摆放、运输、清洗、除尘等人为因素，哪怕是一丁点的疏忽与不慎，都可能对家具造成致命伤。
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="col-12">
        <img src="img/maintain/Snipaste_2022-02-16_20-37-43.png" style="width: 100%"/>
    </div>
</div>
<div class="container">
    <div class="row" style="margin-bottom: 30px">
        <div class="col-12" style="text-align: center; font-size:xx-large; margin-top: 60px;">
            家具保养
        </div>
        <div class="col-12" style="text-align: center;">悉心 / 呵护</div>
    </div>
</div>
<div class="container">
    <div class="row" style="margin-left: 80px;margin-right: 80px;margin-bottom: 30px">
        <div class="col-md-4">
            <img class="new-image" src="./img/maintain/news.jpg">
        </div>
        <div class="col-md-8" style="margin-top: 30px; border-bottom:solid 2px #c2c2c2">
            <div style="margin-left: 50px;margin-bottom: 80px">
                <p style="font-size: 20px;" id="title1">保养</p>
                <p id="content1" style="margin-bottom: 30px">保养</p>
                <p id="time1" style="color: #9a2926;font-size: 18px">2022-2-15 19:06:23</p>
            </div>
        </div>
    </div>
</div>






<div class="container-fluid" style="background-color:#532321; border-bottom: solid 2px #754f4d;">
    <div class="container">
        <div class="row">
            <div class="col-12" style="height: 100px;font-size: 15px;color: white; margin-bottom: 20px;">
                <p style="padding-left: 100px; padding-top: 20px;">您好!</p>
                <p style="padding-left: 100px;">
                    感谢您来到北京森源艺佳家居有限公司，若您有问题咨询或有合作意向，可以给我们留言。也可以使用以下方式联系我们，我们将仅尽快给您回复，并为您提供真诚的服务，谢谢！</p>
            </div>
        </div>
        <div class="row"></div>
    </div>
</div>
<div class="container-fluid" style="background-color:#532321;">
    <div class="container">
        <div class="row">
            <div class="col-md-4" style="margin-left: 85px; color: white;">
                <p style="font-size: 25px; margin-top: 20px;">CONTACT</p>
                <p style="font-size: 20px;">联系</p>
                <div style="font-size: 15px;">
                    <div style="margin-bottom: 15px;">
                        <i class="bi bi-person" style="padding-right: 20px;"></i><span>联系人:</span><span
                            id="linkman"></span><br>
                    </div>
                    <div style="margin-bottom: 15px;">
                        <i class="bi bi-envelope" style="padding-right: 20px;"></i><span>邮箱:</span><span
                            id="email"></span><br>
                    </div>
                    <div style="margin-bottom: 15px;">
                        <i class="bi bi-telephone" style="padding-right: 20px;"></i><span>电话:</span><span
                            id="phone"></span><br>
                    </div>
                    <div style="margin-bottom: 150px;">
                        <i class="bi bi-globe" style="padding-right: 20px;"></i><span>网址:</span><span
                            id="website"></span><br>
                    </div>

                </div>
            </div>
            <div class="col-md-4" style="color: white; float: left;">
                <p style="font-size: 25px; margin-top: 20px;">LEAVE A MESSAGW</p>
                <p style="font-size: 20px;">留言</p>
                <div>
                    <form>
                        您的称呼：<input id="name" type="text" class="form-control"
                                    style="width: 200px;height: 25px;"/>
                        联系电话：<input id="telphone" type="text" class="form-control"
                                    style="width: 200px;height: 25px;"/>
                        留言内容：<textarea id="content" class="form-control" style="width: 200px;"></textarea>
                        <button type="submit" class="btn btn-primary" onclick="addMsg()"
                                style="background-color: #9A2A27; margin-top: 10px; width: 200px; border-color:#9A2A27 ; height: 20px; font-size: 10px; line-height: 8px;">
                            提交
                        </button>
                    </form>
                </div>
            </div>
            <div class="col-md-3">
                <div style="margin-top: 100px;">
                    <img src="img/home/1637395444075.png" id="qrCode" style="width: 40%;"/>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
