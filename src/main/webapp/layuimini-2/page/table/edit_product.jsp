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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuimini-2/lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuimini-2/css/public.css" media="all">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layuimini-2/lib/js/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layuimini-2/lib/js/cropperjs/cropper.min.css"/>
    <script src="${pageContext.request.contextPath}/layuimini-2/lib/js/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/layuimini-2/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>

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
    <style>
        body {
            background-color: #ffffff;
        }
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
<form id="culture-form" class="layui-form layuimini-form">
    <input id="id" name="id" type="hidden" value="${product.id}">
    <div class="layui-form-item">
        <label class="layui-form-label">??????</label>
        <div class="layui-input-inline">
            <button type="button" class="layui-btn" id="test1">
                <i class="layui-icon">&#xe67c;</i>????????????
            </button>
            <div>
                <img id="image" src="${pageContext.request.contextPath}/layuimini-2/images/product/${product.image}" style="width: 300px;height: 240px">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">??????</label>
        <div class="layui-input-inline">
            <input type="text" id="model" name="model" lay-verify="required" lay-reqtext="??????????????????" placeholder="???????????????"
                   value="${product.model}"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">??????</label>
        <div class="layui-input-inline">
            <select id="type" name="type" lay-filter="aihao">
                <option value="" selected="${product.type}"></option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">??????</label>
        <div class="layui-input-inline">
            <select id="material" name="material" lay-filter="aihao">
                <option value="" selected="${product.material}"></option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">??????</label>
        <div class="layui-input-inline">
            <input type="text" id="size" name="size" lay-verify="required" lay-reqtext="??????????????????" placeholder="???????????????"
                   value="${product.size}"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">??????</label>
        <div class="layui-input-inline">
            <select id="space" name="space" lay-filter="aihao">
                <option value="" selected="${product.space}"></option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="culture-save" class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">????????????</button>
        </div>
    </div>
</form>

<!--?????????-->
<div class="modal fade" id="myModal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog"
     tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h1 class="modal-title" id="myModalLabel" style="font-size:20px;">????????????</h1>
            </div>
            <div class="modal-body">
                <div class="continer">
                    <div class="col-md-9">
                        <div id="cropWrapper">
                            <img src="../../images/plus.png" alt=""/><br/>
                            <input type="file" id="inputFile" accept="image/jpg,image/jpeg,image/gif,image/png"/>
                        </div>
                    </div>
                    <div class="col-md-3" id="previewBox"></div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-12 text-right">
                    <button type="button" class="btn btn-success" id="btnCropImage">
                        ??????
                    </button>
                    <button type="button" class="btn btn-default" id="btnDismissDialog" data-dismiss="modal">??????</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/layuimini-2/lib/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/layuimini-2/lib/js/cropperjs/cropper.min.js" type="text/javascript"></script>

<script>
    layui.use(['form', 'upload', 'jquery'], function () {
        var form = layui.form,
            upload = layui.upload,
            layer = layui.layer,
            $ = layui.$;

        <%--upload.render({--%>
        <%--    elem: '#test1' //????????????--%>
        <%--    , url: '${pageContext.request.contextPath}/product/addProductImage' //????????????--%>
        <%--    , done: function (res) {--%>
        <%--        $("#image").attr("src", "${pageContext.request.contextPath}/layuimini-2/images/product/" + res.data);--%>
        <%--    }--%>
        <%--    , error: function () {--%>
        <%--        //??????????????????--%>
        <%--        alert("????????????,??????????????????5mb,???????????????");--%>
        <%--    }--%>
        <%--});--%>
        //????????????
        form.on('submit(saveBtn)', function (data) {
            // var index = layer.alert(JSON.stringify(data.field), {
            //     title: '?????????????????????'
            // }, function () {
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/product/editProduct",
                data: JSON.stringify(data.field),
                contentType: "application/json",
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
<script type="text/javascript">

    var ID_OF_CROP_IMAGE = "tmpCropImage";

    $(function () {
        $("#test1").click(function () {
            //???????????????????????????
            $('#myModal').modal('show');
            //?????????????????????????????????????????????????????????
            $("#inputFile").trigger('click');
            //?????????????????????????????????????????????
            putImageToCropWrapper();
        });
    });

    /**
     * ??????????????????????????????,??????input file???????????????
     * */
    function putImageToCropWrapper() {
        var cropWrapper = document.getElementById("cropWrapper");
        var inputFile = document.getElementById("inputFile");
        var imageType = /image.*/;

        var fileOnLoadHandler = function (tmpImage) {
            return function (e) {
                tmpImage.src = e.target.result;
                initCropper();
            };
        }

        inputFile.addEventListener("change", function (evt) {
            for (var i = 0, numFiles = this.files.length; i < numFiles; i++) {
                var file = this.files[i];
                if (!file.type.match(imageType)) {
                    continue;
                }
                var newImg = document.createElement("img");
                cropWrapper.innerHTML = "<input type='file' id='inputFile' accept='image/jpg,image/jpeg,image/gif,image/png' />";
                cropWrapper.appendChild(newImg);
                //??????????????????????????????ID,???????????????????????????
                $("#cropWrapper img").attr("id", ID_OF_CROP_IMAGE);

                var reader = new FileReader();
                reader.onload = fileOnLoadHandler(newImg);
                reader.readAsDataURL(file);
            }
        }, false);
    }

    /**
     * ????????????
     */
    function initCropper() {
        var cropImage = document.getElementById(ID_OF_CROP_IMAGE);
        var cropper = new Cropper(cropImage, {
            aspectRatio: 5 / 4,  //??????????????????
            dragMode: 'none',     //????????????
            ready: function () {  //?????????????????????,????????????????????????????????????
                var _this = this.cropper;

                //??????????????????Canvas
                function cutCanvas() {
                    return _this.getCroppedCanvas({
                        width: 160,
                        height: 90,
                        beforeDrawImage: function (canvas) {
                            const context = canvas.getContext('2d');
                            context.imageSmoothingEnabled = false;
                            context.imageSmoothingQuality = 'high';
                        }
                    })
                };

                //???canvas???????????????????????????
                function convertCanvasToImage(canvas) {
                    var image = new Image();
                    // image.src = canvas.toDataURL('image/jpeg');
                    return canvas.toDataURL('image/jpg');
                    // return image;
                };

                //?????????File??????
                function dataURLtoFile(dataurl, filename) {
                    var arr = dataurl.split(',');
                    var mime = arr[0].match(/:(.*?);/)[1];
                    var bstr = atob(arr[1]);
                    var n = bstr.length;
                    var u8arr = new Uint8Array(n);
                    while (n--) {
                        u8arr[n] = bstr.charCodeAt(n);
                    }
                    //?????????file??????
                    // return new File([u8arr], filename, {type:mime});
                    //????????????blob??????
                    return new Blob([u8arr], {type: mime});
                }

                //?????????????????????????????????
                $("#btnCropImage").click(function () {
                    var html = convertCanvasToImage(cutCanvas())
                    var photo = dataURLtoFile(html, "file");
                    var formData = new FormData();
                    formData.append("file", photo);
                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/product/addProductImage",
                        data: formData,
                        contentType: false,
                        processData: false,
                        cache: false,
                        success: function (res) {
                            alert("????????????");
                            $("#myModal").modal("hide");
                            setTimeout(function () {//??????0.3s
                                $("#image").attr("src", "${pageContext.request.contextPath}/layuimini-2/images/product/"+res.data);
                            }, 500);
                        }
                    });
                    //$('#previewBox').append(html);
                });

                //????????????????????????????????????????????????
                $("#myModal").on('hide.bs.modal', function () {
                    $('#inputFile').removeData();
                });
            }
        })
    }

</script>

</html>