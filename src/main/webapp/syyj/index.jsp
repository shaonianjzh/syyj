<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8"/>
    <title>首页</title>
    <link type="text/css" rel="stylesheet" href="./css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/message/addFangWen"
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
            $.ajax({
                type: "get",
                url: "${pageContext.request.contextPath}/news/findNews?page=1&limit=3",
                success: function (data) {
                    if (data.data[0].title != null) {
                        $("#title1").html(data.data[0].title);
                        $("#content1").html(data.data[0].content);
                        $("#time1").html(data.data[0].time);
                    }
                    if (data.data[1].title != null) {
                        $("#title2").html(data.data[1].title);
                        $("#content2").html(data.data[1].content);
                        $("#time2").html(data.data[1].time);
                    }
                    if (data.data[2].title != null) {
                        $("#title3").html(data.data[2].title);
                        $("#content3").html(data.data[2].content);
                        $("#time3").html(data.data[2].time);
                    }
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
            margin-left: 30px;
            color: #6b1c18;
        }

        .news-set {
            padding-top: 80px;
            width: 300px;
            height: 300px;
            padding-left: 25px;
            padding-right: 25px;
            border: solid #9a2926 3px;
            overflow: hidden;
        }
        .content img{
            width: 100%;
            height: 100%;
        }

        .foot-set {
            margin-bottom: 20px;
        }

        /* .home-img{
            border-radius: 25px,25px,25px,25px;
        } */
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
                <a id="a1" class="nav-link index" href="./index.jsp">网站首页</a>
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
    <div class="row">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="./img/home/3.575e3196.jpg" alt="...">
                </div>
                <div class="item">
                    <img src="./img/home/2.09794e46.jpg" alt="...">
                </div>
                <div class="item">
                    <img src="./img/home/2.09794e46.jpg" alt="...">
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">

        <div class="col-12" style="text-align: center; font-size:xx-large; margin-top: 100px;">
            <img src="./img/home/p1.png">
            公司简介
            <img src="./img/home/p2.png">
        </div>
        <div class="col-12" style="text-align: center;">森泰健康/源于自然/100%实木</div>

        <div class="col-12" style="margin-top: 50px;">
            <p style="text-indent: 33px; font-size: 17px; color: #666666; line-height: 200%;">
                北京森源艺佳有限公司成立于2006年8月份，公司占地面积50亩，现有员工170余人，是华北地区卓越的实木套房、实木客厅、实木餐桌、餐椅等配套家具生产企业。</p>
            <p style="text-indent: 33px; font-size: 17px; color: #666666; line-height: 200%;">
                我们以先进的设备、精湛的技术、严格的管理，融合电子数控和传统手工业的长处，确保产品的品质卓越，风格独特。环保、绿色、无污染是森源艺佳公司始终保持
                的生产理念，倡导：“绿色环保”将健康环保带入千家万户。...</p>

        </div>

        <div class="col-12" style="text-align: center; margin-top: 50px;margin-bottom: 50px;">
            <i><a href="about.jsp"><img src="img/home/Snipaste_2022-02-15_18-52-09.png"/></a></i>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="col-12" style="text-align: center;">
        <img src="./img/home/pic3.png" style="width: 70%"/>
    </div>
</div>
<div class="container">
    <div class="row">

        <div class="col-12" style="text-align: center; font-size:xx-large; margin-top: 80px;">
            <img src="./img/home/p1.png">
            精品推荐
            <img src="./img/home/p2.png">
        </div>
        <div class="col-12" style="text-align: center; margin-bottom: 50px;">传承东方/共享世界/</div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-6">
            <img src="img/home/5.c7878924.jpg" style="width: 100%;"/>
        </div>
        <div class="col-md-6" style="text-align: center; background-color: #ececec;">
            <p style="text-align: center; font-size: 25px;margin-top: 100px;margin-bottom: 20px;">雅者韵也</p>
            <p style="text-indent: 50px;margin-left: 100px;margin-right: 100px;line-height: 30px;">
                "一国之事，系一人之本，谓之'风';言天下之事，形四方之风，谓之'雅';雅者，正也，言王政之所由废兴也，政有大小，故有'小雅'焉，有'大雅'焉;'颂'者，美盛
                德之形容，以其成功告于神明者也。是谓四始，《诗》之至也。"
            </p>
            <i class="bi bi-wallet2" style="line-height: 150px"><a href="./product.jsp"
                                                                   style="font-size: 20px;">了解更多</a></i>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-12" style="text-align: center; font-size:xx-large; margin-top: 100px;">
            <img src="./img/home/p1.png">
            旗下明星组合
            <img src="./img/home/p2.png">
        </div>
        <div class="col-12" style="text-align: center; margin-bottom: 50px;">富贵/典雅/尽在森源艺佳</div>
    </div>
    <div class="row">
        <div class="col-md-7">
            <div class="row home-img">
                <img src="./img/home/8.94608940.jpg" style="width: 100%; border-radius: 25px;"/>
            </div>
            <div class="row" style="text-align: center; ">
                <p style="font-size: 20px; margin-top: 50px;margin-bottom: 10px; margin-left: 100px;">
                    【货号】：K107#布艺沙发（1+2+3）</p>
                <p style="font-size: 20px; margin-bottom: 10px; margin-left: 60px;">【规格】： &nbsp;单人位 990*900*980
                </p>
                <p style="font-size: 20px; margin-left: 100px;">【型号】：K107#布艺沙发（1+2+3）</p>
            </div>
        </div>

        <div class="col-md-5">
            <img src="img/home/product1.png" style="margin-left: 50px; width: 100%;"/>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <div class="row">
                <img src="img/home/7.dabe1063.png" style="width: 100%; border-radius: 25px;">
            </div>
            <div class="row">
                <p style="font-size: 20px; margin-top: 100px;margin-bottom: 10px; margin-left: 50px;">
                    【货号】：K107#布艺沙发（1+2+3）</p>
                <p style="font-size: 20px; margin-bottom: 10px; margin-left: 50px;">【规格】： &nbsp;单人位 990*900*980
                </p>
                <p style="font-size: 20px; margin-left: 50px;">【型号】：K107#布艺沙发（1+2+3）</p>
            </div>
        </div>
        <div class="col-md-8">
            <div class="row">
                <div class="col-md-2" style="margin-left: 50px;">
                    <div class="row">
                        <div class="col-md-6">
                            <p style="font-size: 55px;">遐</p>
                        </div>
                        <div class="col-md-6">
                            <p style="font-size: 55px; "></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <p style="font-size: 55px; "></p>
                        </div>
                        <div class="col-md-6">
                            <p style="font-size: 55px;">想</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <p style="text-indent: 20px; line-height: 30px; margin-top: 50px;">
                        "一国之事，系一人之本，谓之'风';言天下之事，形四方之风，谓之'雅';雅者，正也，言王政之所由废兴也，政有大小，故有'小雅'焉，有'大雅'焉;'颂'者，美
                        盛德之形容，以其成功告于神明者也。是谓四始，《诗》之至也。"</p>
                </div>
            </div>
            <div class="row">
                <img src="./img/home/9.e44c4eeb.jpg"
                     style="width: 90%; border-radius: 25px; margin-left: 80px;"/>
            </div>
        </div>
    </div>
    <div class="row" style="margin: 80px;">
        <div class="col-md-8">
            <img src="./img/home/5.c7878924.jpg" style="width: 100%; border-radius: 25px; float: left;"/>
        </div>
        <div class="col-md-4">
            <div class="row" style="text-align: center;">
                <p style="font-size: 18px;margin-bottom: 10px; margin-left: 25px;">
                    【货号】：K107#布艺沙发（1+2+3）</p>
                <p style="font-size: 18px; margin-bottom: 10px;">【规格】：单人位 990*900*980
                </p>
                <p style="font-size: 18px; margin-left: 25px;">【型号】：K107#布艺沙发（1+2+3）</p>
            </div>
            <div class="row">
                <img src="./img/home/12.png" style="border-radius: 25px; width: 100%;margin-top: 40px;"/>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid">
    <img src="img/home/Snipaste_2022-02-15_18-46-41.png" style="width: 100%; "/>
</div>
<div class="container">
    <div class="row">
        <div class="col-12" style="text-align: center; font-size:xx-large; margin-top: 100px;">
            <img src="./img/home/p1.png">
            新闻中心
            <img src="./img/home/p2.png">
        </div>
        <div class="col-12" style="text-align: center; margin-bottom: 50px;">关注实时新闻 / 了解企业资讯</div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <div class="news-set">
                <p style="font-size: 20px;" id="title1">暂无新闻</p>
                <p id="content1" class="content">暂无新闻</p>
                <p id="time1" >2022-2-15 19:06:23</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="news-set">
                <p style="font-size: 20px;" id="title2">暂无新闻</p>
                <p id="content2" class="content">暂无新闻</p>
                <p id="time2">2022-2-15 19:06:23</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="news-set">
                <p style="font-size: 20px;" id="title3">暂无新闻</p>
                <p id="content3" class="content">暂无新闻</p>
                <p id="=time3">2022-2-15 19:06:23</p>
            </div>
        </div>
    </div>
    <div class="row" style="text-align: center; margin-bottom: 100px;margin-top: 30px;">
        <a href="news.jsp"><img src="img/home/Snipaste_2022-02-15_18-52-09.png"/></a>
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
