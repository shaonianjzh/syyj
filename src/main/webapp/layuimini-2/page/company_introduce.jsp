<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title></title>
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
    <script>
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/company/findImage",
            success: function (data) {
                $("#company-img").attr("src", "${pageContext.request.contextPath}/layuimini-2/images/" + data.data.image);
                $("#demo").html(data.data.introduce);
            }
        });
    </script>
</head>
<body>
<div class="container">
    <div class="row">
        <button id="btnStartShotImage" type="button" class="btn btn-success">上传图片</button>
    </div>
    <div class="row">
        <img id="company-img" name="company-img" src="" style="width: 240px;height: 300px"/>
    </div>
    <div class="row">
        <textarea id="demo" style="display: none;"></textarea>
        <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">保存</button>
    </div>
</div>
<!--弹出框-->
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

</body>

<script src="../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="../lib/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script src="../lib/js/cropperjs/cropper.min.js" type="text/javascript"></script>
<script type="text/javascript">
    layui.use(['layedit', 'jquery', 'form'], function () {
        var layedit = layui.layedit,
            form = layui.form,
            $ = layui.$;
        layedit.set({
            uploadImage: {
                url: '${pageContext.request.contextPath}/company/introduce' //接口url
                , type: 'post' //默认post
            }
        });
        var index = layedit.build('demo'); //建立编辑器

        form.on('submit(saveBtn)', function (data) {
            // var result = JSON.stringify(data.field);
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/company/companyIntroduce",
                data: JSON.stringify(layedit.getContent(index)),
                contentType: "application/json",
                success: function () {
                    alert("保存成功");
                }
            });
        });
    });
</script>
<script type="text/javascript">

    var ID_OF_CROP_IMAGE = "tmpCropImage";

    $(function () {
        $("#btnStartShotImage").click(function () {
            //显示裁剪图片的弹窗
            $('#myModal').modal('show');
            //触发文件输入框点击事件开始加载图片文件
            $("#inputFile").trigger('click');
            //放图，截取，保存，放入指定位置
            putImageToCropWrapper();
        });
    });

    /**
     * 在应该放置图片的位置,放入input file选择的文件
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
                //给要被截取的图片加上ID,方便下一步的初始化
                $("#cropWrapper img").attr("id", ID_OF_CROP_IMAGE);

                var reader = new FileReader();
                reader.onload = fileOnLoadHandler(newImg);
                reader.readAsDataURL(file);
            }
        }, false);
    }

    /**
     * 截取图片
     */
    function initCropper() {
        var cropImage = document.getElementById(ID_OF_CROP_IMAGE);
        var cropper = new Cropper(cropImage, {
            aspectRatio: 4 / 5,  //裁剪图片比例
            dragMode: 'none',     //拖动模式
            ready: function () {  //挂载方法：保存,转换格式等操作在这里进行
                var _this = this.cropper;

                //将截图保存成Canvas
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

                //将canvas截图转换为图片数据
                function convertCanvasToImage(canvas) {
                    var image = new Image();
                    // image.src = canvas.toDataURL('image/jpeg');
                    return canvas.toDataURL('image/jpg');
                    // return image;
                };

                //转换为File对象
                function dataURLtoFile(dataurl, filename) {
                    var arr = dataurl.split(',');
                    var mime = arr[0].match(/:(.*?);/)[1];
                    var bstr = atob(arr[1]);
                    var n = bstr.length;
                    var u8arr = new Uint8Array(n);
                    while (n--) {
                        u8arr[n] = bstr.charCodeAt(n);
                    }
                    //转换成file对象
                    // return new File([u8arr], filename, {type:mime});
                    //转换成成blob对象
                    return new Blob([u8arr], {type: mime});
                }

                //设置裁剪按钮的点击事件
                $("#btnCropImage").click(function () {
                    var html = convertCanvasToImage(cutCanvas())
                    var photo = dataURLtoFile(html, "file");
                    var formData = new FormData();
                    formData.append("file", photo);
                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/company/uploadImage",
                        data: formData,
                        contentType: false,
                        processData: false,
                        cache: false,

                        // data: dataURLtoFile(html,"introduce.jpg"),
                        // contentType: "application/json",
                        success: function (res) {
                            alert("裁剪成功");
                            $("#myModal").modal("hide");
                            setTimeout(function () {//延迟0.3s
                                $("#company-img").attr("src", "${pageContext.request.contextPath}/layuimini-2/images/" + res.data);
                            }, 500);
                        }
                    });
                    //$('#previewBox').append(html);
                });

                //关闭模态框的时候清空文件域的数据
                $("#myModal").on('hide.bs.modal', function () {
                    $('#inputFile').removeData();
                });
            }
        })
    }

</script>

</html>