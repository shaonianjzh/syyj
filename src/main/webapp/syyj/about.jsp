<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8"/>
    <title>关于我们</title>
    <link type="text/css" rel="stylesheet" href="./css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>

    <script>
        $(function () {
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
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/company/findImage",
                success: function (data) {
                    $("#introduce-img").attr("src", "${pageContext.request.contextPath}/layuimini-2/images/" + data.data.image);
                    $("#company-introduce").html(data.data.introduce);
                }
            });
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/company/culture",
                success: function (res) {
                    for (let i = 0; i < res.data.length; i++) {
                        $("#culture").append(" <div class='col-md-3'>"
                            + "<div class=' row company-culture '>"
                            + "<div class='culture-title'>"
                            + "<p>" + res.data[i].title + "</p>"
                            + "</div>"
                            + "<div class='culture-content'>"
                            + "<p>" + res.data[i].content + "</p>"
                            + "</div>"
                            + "</div>"
                            + "</div>");
                    }
                }
            });
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/company/development",
                success: function (res) {
                    for (let i = 0; i < res.data.length; i++) {
                        if (i % 2 == 0) {
                            $("#achievement2").append(" <div class='col-md-3'>"
                                + "<div class='row achievement1'>"
                                + "<div class='a-title2'>"
                                + "<p>" + res.data[i].yearth + "</p>"
                                + "</div>"
                                + "<div class='a-content'>"
                                + "<p>" + res.data[i].achievement + "</p>"
                                + " </div>"
                                + "</div>"
                                + "</div>");
                        } else {
                            $("#achievement1").append(" <div class='col-md-3'>"
                                + "<div class='row achievement1'>"
                                + "<div class='a-content'>"
                                + "<p>" + res.data[i].achievement + "</p>"
                                + " </div>"
                                + "<div class='a-title1'>"
                                + "<p>" + res.data[i].yearth + "</p>"
                                + "</div>"
                                + "</div>"
                                + "</div>");
                        }
                    }
                }
            });
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/company/honor",
                success: function (res) {
                    for (let i = 0; i < res.data.length; i++) {
                        $("#honor").append("<div class='col-md-4 honor-img' style='margin-bottom: 25px'>" +
                            "<img src=" + "${pageContext.request.contextPath}/layuimini-2/images/honor/" + res.data[i].image + "  style='width: 95%;'/>"
                            + "</div>");
                    }
                }
            });
        });

        function addMsg() {
            if ($("#name").val() == "" || $("#telphone").val() == "" || $("#content").val() == "") {
                alert("提交内容不能为空");
                return;
            }
            alert("提交成功");
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

        .company-culture {
            border-radius: 15px 15px 25px 25px;
            border: solid 2px #9a2926;
            width: 180px;
            height: 200px;
            margin-bottom: 25px;
        }

        .achievement1 {
            border-radius: 25px;
            border: solid 2px #9a2926;
            width: 180px;
            height: auto;
            margin-bottom: 25px;
        }

        .culture-title {
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            background-color: #9a2926;
            text-align: center;
            font-size: 24px;
            color: white;
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .a-title1 {
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;
            background-color: #9a2926;
            text-align: center;
            font-size: 24px;
            color: white;
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .a-title2 {
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            background-color: #9a2926;
            text-align: center;
            font-size: 24px;
            color: white;
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .culture-content {
            font-size: 20px;
            color: #333333;
            padding-top: 25px;
            padding-left: 15px;
            padding-right: 15px;
        }

        .a-content {
            font-size: 20px;
            color: #333333;
            padding-top: 25px;
            padding-left: 15px;
            padding-right: 15px;
        }

        .honor-img {
            border-radius: 25px;
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
    <div class="row">
        <div class="col-12" style="text-align: center; font-size:xx-large; margin-top: 60px;">
            公司简介
        </div>
        <div class="col-12" style="text-align: center;">森泰健康/源于自然/100%实木</div>
    </div>
    <div class="row" style="margin-top: 35px;">
        <div class="col-md-4">
            <div>
                <img id="introduce-img" src="img/aboout/1639975922685.png" style="border-radius: 25px; width: 100%;">
            </div>
        </div>
        <div class="col-md-8">
            <div class="row" style="margin-left: 30px; margin-top: 20px;">
                <p style="font-size: 25px;">北京森源艺佳家具有限公司</p>
            </div>
            <div class="row">
                <p id="company-introduce"
                   style="text-indent: 30px; font-size: 15px; line-height: 50px; margin-left: 50px;margin-right: 20px;">
                    北京森源艺佳有限公司成立于2006年8月份，公司占地面积50亩，现有员工170余人，是华北地区卓越的实木套房、实木客厅、实木餐桌、餐椅等配套家具生产企业。

                    我们以先进的设备、精湛的技术、严格的管理，融合电子数控和传统手工业的长处，确保产品的品质卓越，风格独特。环保、绿色、无污染是森源艺佳公司始终保持的生产理念，倡导：“绿色环保”将健康环保带入千家万户。

                    本公司是集研发、设计、制造、销售、服务为一体的专业实木家具企业。公司秉承现代化家具的设计理念及人性化的设计思想，赋予了家具鲜明的时代感。流行与经典的完美结合，时尚与简约的精致体现，简洁朴素的线条，寓示着“平淡为真”的生活哲理，构成了森源艺佳家具的产品理念。

                    多年来森源艺佳家具一直以“诚实守信、共赢互利”为企业宗旨，以高质量、真品牌、低价位和优质服务占领市场。

                    在未来的日子里，本公司将以更加努力的敬业精神，不断开拓创新，与您携手共创美好家园。
                </p>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid" style="background-color: #ececec;">
    <div class="container">
        <div class="col-12" style="text-align: center; font-size:xx-large; margin-top: 50px;">企业文化</div>
        <div class="col-12" style="text-align: center;">企业/文化/建设</div>
        <div id="culture" class="row"
             style="margin-top: 50px; margin-left: 50px; margin-right: 50px; margin-bottom: 80px;">


        </div>
    </div>
</div>
<div class="container">
    <div class="col-12" style="text-align: center; font-size:xx-large; margin-top: 80px;">荣誉资质</div>
    <div class="col-12" style="text-align: center;">高质量/无污染</div>
    <div id="honor" class="row" style="margin-top: 80px; margin-left: 150px;margin-right: 150px; margin-bottom: 80px;">
    </div>
</div>
<div class="container-fluid" style="background-color: #ececec;">
    <div class="container">
        <div class="col-12" style="text-align: center; font-size:xx-large; margin-top: 50px;">发展历程</div>
        <div class="col-12" style="text-align: center;margin-bottom: 50px">不忘/初心</div>
        <div class="row" style="margin-left: 150px; position: relative" id="achievement1">
<%--            <div class="col-md-3" style="position: absolute;bottom: 0;left: 150px">--%>
<%--                <div class="row achievement1">--%>
<%--                    <div class="a-content">--%>
<%--                        <p> asdf asdf</p>--%>
<%--                    </div>--%>
<%--                    <div class="a-title1">--%>
<%--                        <p>asdfasdfasd</p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>
        <div class="row" id="achievement2">
<%--            <div class="col-md-3">--%>
<%--                <div class="row achievement1">--%>
<%--                    <div class="a-title2">--%>
<%--                        <p>asdfasdfasd</p>--%>
<%--                    </div>--%>
<%--                    <div class="a-content">--%>
<%--                        <p> asdf asdf</p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
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
                    <form id="msg-form" method="post">
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
                    <img src="img/home/1637395444075.png" style="width: 40%;" id="qrCode"/>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
