<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8"/>
    <title>加盟服务</title>
    <link type="text/css" rel="stylesheet" href="./css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>

    <script>
        $(function () {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/company/getJoin",
                success: function (res) {
                    $("#advantage").html(res.data.joinAdvantage);
                    $("#condition").html(res.data.joinCondition);
                    $("#join-progress").html(res.data.joinProgress);
                }
            });
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/message/findLinkman",
                success: function (data) {
                    $("#linkman").html(data.data.linkman);
                    $("#email").html(data.data.email);
                    $("#phone").html(data.data.phone);
                    $("#website").html(data.data.website);
                    $("#qrCode").attr("src", "${pageContext.request.contextPath}/layuimini-2/images/linkman/" + data.data.image);
                }
            });
        });

        function addMsg() {
            if ($("#name").val() == "" || $("#telphone").val() == "" || $("#content").val() == "") {
                alert("提交内容不能为空");
                return;
            }
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/message/addMsg",
                data: {
                    name: $("#name").val(),
                    telphone: $("#telphone").val(),
                    content: $("#content").val()
                },
                success: function (res) {
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

        .index {
            margin-left: 25px;
            color: #6b1c18;
        }

        #advantage {
            margin-left: 80px;
            margin-right: 80px;
        }

        #advantage div {
            font-size: 20px;
        }

        #advantage p {
            font-size: 17px;
            text-indent: 34px;
            line-height: 35px;
        }

        #condition {
            margin-left: 80px;
            margin-right: 80px;
            margin-bottom: 50px;
        }

        #condition div {
            font-size: 20px;
        }

        #condition p {
            font-size: 17px;
            text-indent: 34px;
            line-height: 35px;
        }
        #progress{
            margin-left: 80px;
            margin-right: 80px;
            margin-bottom: 50px;
        }
        #join-progress p{
            font-size: 17px;
            text-indent: 34px;
            line-height: 35px;
        }
        #join-progress div {
            font-size: 20px;
            line-height: 37px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row paddtop">
        <div class="col-md-6 ">
            <img src="img/home/logo.39da3c57.png"/>
        </div>
        <div class="col-md-6">
            <img src="img/home/下载.png"/>
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
        <img src="img/aboout/banner.2efc5dc3.png" style="width: 100%;"/>
    </div>
</div>

<div class="container">
    <div class="row" style="margin-bottom: 30px">
        <div class="col-12" style="text-align: center; font-size:xx-large; margin-top: 60px;">
            加盟优势
        </div>
        <div class="col-12" style="text-align: center;">优/势</div>
    </div>
    <div class="row" id="advantage">

    </div>
</div>
<div class="container-fluid" style="background-color: #ececec">
    <div class="container">
        <div class="row" style="margin-bottom: 30px">
            <div class="col-12" style="text-align: center; font-size:xx-large; margin-top: 60px;">
                加盟条件
            </div>
            <div class="col-12" style="text-align: center;">条/件</div>
        </div>
        <div class="row" id="condition">

        </div>
    </div>
</div>
<div class="container">
    <div class="row" style="margin-bottom: 50px;margin-top: 80px">
        <div class="col-12" style="text-align: center; font-size:xx-large; margin-top: 60px;">
            加盟流程
        </div>
        <div class="col-12" style="text-align: center;width: 100%">流/程</div>
    </div>
    <div class="row" id="progress">
        <div class="col-md-6">
            <img src="img/join/19.253c999f.png" style="border-radius: 25px;width: 90%"/>
        </div>
        <div class="col-md-6">
            <div id="join-progress">

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
