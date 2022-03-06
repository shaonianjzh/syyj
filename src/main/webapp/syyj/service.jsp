<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8"/>
    <title>服务保障</title>
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

        .s-service {
            text-align: center;
            width: 250px;
            height: 330px;
            background-color: #ececec;
            border-radius: 25px;
            padding-top: 130px;
        }

        .s-service:hover {
            background-color: #9a2926;
            color: white;
        }

        .s-font {

            color: #666666;
            font-size: 19px;
        }


        .wrap {
            float: left;
            position: relative;
            overflow: hidden;
            font-family: arial, sans-serif;
        }

        .wrap img {
            border: 0;
            width: 220px;
            height: 330px;
        }

        .wrap p {
            border-radius: 25px;
            display: block;
            width: 528px;
            height: 400px;
            position: absolute;
            left: 10;
            top: 350px;
            /*使用RGBA颜色值*/
            background-color: rgba(0, 0, 0, 0.6);
            font-size: 12px;
            color: #FFFFFF;
            padding: 0;
            margin: 0;
            line-height: 16px;
            /*定义过渡效果，all表示针对所有值有变化的CSS属性*/
            transition: all 0.6s ease-in-out;
        }

        .wrap p span {
            text-indent: 40px;
            font-size: 20px;
            display: block;
            padding: 20px;
            line-height: 30px;
        }

        .wrap:hover p {
            top: 0;
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
            服务保障
        </div>
        <div class="col-12" style="text-align: center;">安心/放心</div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-3">
            <div class="s-service">
                <span style="color: #666666; display: block;font-size:30px;margin-bottom: 25px"
                      class="glyphicon glyphicon-inbox"
                      aria-hidden="true"></span>
                <p class="s-font">100%品质保证</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="s-service">
                 <span style="color: #666666; display: block;font-size:30px;margin-bottom: 25px"
                       class="glyphicon glyphicon-send"
                       aria-hidden="true"></span>
                <p class="s-font">7天无理由退换</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="s-service">
                 <span style="display: block;font-size:30px;margin-bottom: 25px;color: #666666;"
                       class="glyphicon glyphicon-map-marker"
                       aria-hidden="true"></span>
                <p class="s-font">质保一年</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="s-service">
                 <span style="color: #666666; display: block;font-size:30px;margin-bottom: 25px"
                       class="glyphicon glyphicon-plane"
                       aria-hidden="true"></span>
                <p class="s-font">全国五包到家</p>
            </div>
        </div>
    </div>
    <div class="row">
        <div style="font-size: 35px;margin-top: 80px;margin-bottom: 30px">100%品质保证</div>
    </div>
    <div class="row">
        <div class="col-md-6 wrap">
            <img src="img/service/Snipaste_2022-02-17_11-54-09.png" style="border-radius: 25px;width: 95%"/>
            <p>
                    <span>
                        海棠木
海棠木是高端家具用材，由于其纹理的颜色与花梨木类色泽相近也被称为小红木。一般适用于高端实木家具、桥梁、枕木、乐器、手工艺品等。
                    </span>
            </p>
        </div>
        <div class="col-md-6 wrap">
            <img src="img/service/Snipaste_2022-02-17_11-57-22.png" style="border-radius: 25px;width: 95%"/>
            <p>
                    <span>
                        乌丝檀木
常绿大乔木，硬杂木类，树高达25米以上，胸径可达3-4米，树干通直。木材颜色偏红，心边材区分明显，木质细密，矿物线明显，具有金属光泽。
                    </span>
            </p>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="col-12">
        <img src="img/service/Snipaste_2022-02-17_11-59-04.png"
             style="width: 100%;margin-top: 30px;margin-bottom: 100px"/>
    </div>
</div>
<div class="container-fluid" style="background-color: #ececec">
    <div class="container">
        <div class="row">
            <p style="font-size: 35px;margin-left: 75px;margin-top: 80px;margin-bottom: 30px">
                7天无理由退换
            </p>
        </div>
        <div class="row" style="margin-left: 40px;margin-bottom: 80px">
            <div class="col-md-4">
                <img src="img/service/15.a3e06b4f.jpg" style="width: 100%;border-radius: 25px"/>
            </div>
            <div class="col-md-8">
                <div style="margin-left: 60px">
                    <p style="font-size: 20px">为您提供长达7天无理由退换货期限，我们有信心我们的产品经得起时间的考验。</p>
                    <p style="font-size: 16px;margin-bottom: 20px;margin-top: 20px;color: #9a2926">若发现下列情况，将无法进行退换货:</p>
                    <p style="font-size: 16px">1. 退换货需提前沟通，未经沟通确认，强行寄回至仓库的商品;</p>
                    <p style="font-size: 16px">2.产品包装、配件、吊牌、发票、赠品、赠券等不完整、人为损坏的商品不予退换;</p>
                    <p style="font-size: 16px"> 3. 安装或使用过的商品不予退换(质量问题除外) ;</p>
                    <p style="font-size: 16px">4. 任何非正常使用及保管导致出现问题的不予退换;</p>
                    <p style="font-size: 16px"> 5. 未经授权，私自维修、改动、不正确安装造市的问题商品不予退换;</p>
                    <p style="font-size: 16px">6. 定制商品或需要定制期的其它特殊商品;</p>
                    <p style="font-size: 16px"> 7. 超7天退货期限的不予退货。</p>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row" style="margin-top: 80px;margin-left: 80px">
        <p style="font-size: 35px">
            全国五包到家
        </p>
    </div>
    <div class="row" style="margin-top: 30px;margin-left: 80px;text-align: center;margin-bottom: 110px">
        <div class="col-md-2">
            <img src="img/service/下载.png"/>
            <p style="font-size: 23px;margin-top: 20px">包长途运输</p>
        </div>
        <div class="col-md-2">
            <img src="img/service/12.f9025d28.png"/>
            <p style="font-size: 23px;margin-top: 20px">包同城配送</p>
        </div>
        <div class="col-md-2">
            <img src="img/service/下载%20(1).png"/>
            <p style="font-size: 23px;margin-top: 20px">包搬楼</p>
        </div>
        <div class="col-md-2">
            <img src="img/service/下载%20(2).png"/>
            <p style="font-size: 23px;margin-top: 20px">包安装</p>
        </div>
        <div class="col-md-2">
            <img src="img/service/下载%20(3).png"/>
            <p style="font-size: 23px;margin-top: 20px">包售后</p>
        </div>
    </div>
</div>
<div class="container-fluid" style="margin-bottom: 80px">
    <div class="col-12">
        <img src="img/service/Snipaste_2022-02-17_12-54-52.png" style="width: 100%"/>
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
