<%@ page isELIgnored="false"  language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../base.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="<%=root %>resources/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <link href="<%=root %>resources/css/plugins/daterangepicker/daterangepicker.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=root %>resources/css/plugins/star-rating.css">
    <script src="<%=root %>resources/js/plugins/daterangepicker/daterangepicker.js" charset="UTF-8"></script>
    <script src="<%=root %>resources/js/plugins/bootstrap-rating-input.js"></script>

    <link href="<%=root %>resources/css/plugins/fileInput/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    <link href="<%=root %>resources/themes/explorer-fas/theme.css" media="all" rel="stylesheet" type="text/css"/>
    <script src="<%=root %>resources/js/plugins/fileInput/plugins/piexif.js" type="text/javascript"></script>
    <script src="<%=root %>resources/js/plugins/fileInput/plugins/sortable.js" type="text/javascript"></script>
    <script src="<%=root %>resources/js/plugins/fileInput/fileinput.js" type="text/javascript"></script>
    <script src="<%=root %>resources/js/plugins/fileInput/locales/fr.js" type="text/javascript"></script>
    <script src="<%=root %>resources/js/plugins/fileInput/locales/es.js" type="text/javascript"></script>
    <script src="<%=root %>resources/themes/fas/theme.js" type="text/javascript"></script>
    <script src="<%=root %>resources/themes/explorer-fas/theme.js" type="text/javascript"></script>

    <title>添加物品</title>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>添加物品</h5>
        </div>
        <div class="ibox-content">
            <div class="form-group row">
                <label for="name" class="col-sm-2 col-form-label"><span style="color: red">*</span>物品名称</label>
                <div class="col-sm-4">
                    <input type="" class="form-control" id="name" value="<c:if test="${sku!=null}">${sku.name}</c:if>"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="categoryId" class="col-sm-2 col-form-label"><span style="color: red">*</span>物品类目</label>
                <div class="col-sm-4">
                    <select id="categoryId" class="custom-select input-s-lg form-control">
                        <option value="">类目</option>
                        <c:forEach items="${categorys}" var="item">
                            <c:if test="${sku != null && sku.categoryId == item.id}">
                                <option value="${item.id}" selected>${item.name}</option>
                            </c:if>
                            <c:if test="${sku == null || (sku != null && sku.categoryId != item.id)}">
                                <option value="${item.id}">${item.name}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label for="buyDate" class="col-sm-2 col-form-label">购买时间</label>
                <div class="col-sm-4">
                    <input type="text" name="buyDateStr" id="buyDateStr" class="form-control" value="<c:if test="${sku!=null && sku.buyTime != null}"><fmt:formatDate value="${sku.buyTime}" pattern="yyyy-MM-dd"/></c:if>" />
                    <input type="hidden" id = "buyDate" name="buyDate" class="form-control" value="<c:if test="${sku!=null && sku.buyTime != null}"><fmt:formatDate value="${sku.buyTime}" pattern="yyyy-MM-dd"/></c:if>"" />
                </div>
            </div>
            <div class="form-group row">
                <label for="changeDate" class="col-sm-2 col-form-label">更换时间</label>
                <div class="col-sm-4">
                    <input type="text" name="changeDateStr" id="changeDateStr" class="form-control" value="<c:if test="${sku!=null && sku.changeTime != null}"><fmt:formatDate value="${sku.changeTime}" pattern="yyyy-MM-dd"/></c:if>" />
                    <input type="hidden" id = "changeDate" name="changeDate" class="form-control" value="<c:if test="${sku!=null && sku.changeTime != null}"><fmt:formatDate value="${sku.changeTime}" pattern="yyyy-MM-dd"/></c:if>" />
                </div>
            </div>
            <div class="form-group row">
                <label for="date2" class="col-sm-2 col-form-label">有效期</label>
                <div class="col-sm-4">
                    <input type="text" placeholder="有效期" name="date2" id="date2" class="input-lg form-control float-right" value="<c:if test='${sku!=null && sku.productTime != null}'><fmt:formatDate value='${sku.productTime}' pattern='yyyy-MM-dd'/>至<fmt:formatDate value='${sku.expiredTime}' pattern="yyyy-MM-dd"/></c:if>"/>
                    <input type="hidden" id = "startTime" name="startTime" class="form-control" value="<c:if test='${sku!=null && sku.productTime != null}'><fmt:formatDate value='${sku.productTime}' pattern="yyyy-MM-dd HH:mm:ss"/></c:if>" />
                    <input type="hidden" id = "endTime" name="endTime" class="form-control" value="<c:if test='${sku!=null && sku.expiredTime != null}'><fmt:formatDate value='${sku.expiredTime}' pattern='yyyy-MM-dd HH:mm:ss'/></c:if>"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="file" class="col-sm-2 col-form-label">图片</label>
                <div class="col-sm-4">
                    <input id="file" name="file" type="file" multiple>
                </div>
            </div>
            <div class="form-group row">
                <label for="shopName" class="col-sm-2 col-form-label">店铺</label>
                <div class="col-sm-4">
                    <input class="form-control" id="shopName" value="<c:if test="${sku!=null && sku.shopName != null}">${sku.shopName}</c:if>" />
                </div>
            </div>
            <div class="form-group row">
                <label for="brand" class="col-sm-2 col-form-label">品牌</label>
                <div class="col-sm-4">
                    <input class="form-control" id="brand" value="<c:if test="${sku!=null && sku.brand != null}">${sku.brand}</c:if>"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="url" class="col-sm-2 col-form-label">链接</label>
                <div class="col-sm-4">
                    <input class="form-control" id="url" value="<c:if test="${sku!=null && sku.url != null}">${sku.url}</c:if>"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="status" class="col-sm-2 col-form-label"><span style="color: red">*</span>状态</label>
                <div class="col-sm-4">
                    <select id="status" class="custom-select input-s-lg form-control">
                        <option value="0" <c:if test="${sku!=null && sku.status == 0}">selected</c:if>>未使用</option>
                        <option value="1" <c:if test="${sku!=null && sku.status == 1}">selected</c:if>>正使用</option>
                        <option value="2" <c:if test="${sku!=null && sku.status == 2}">selected</c:if>>使用完</option>
                        <option value="3" <c:if test="${sku!=null && sku.status == 3}">selected</c:if>>已过期</option>
                        <option value="4" <c:if test="${sku!=null && sku.status == 4}">selected</c:if>>已废弃</option>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label for="star" class="col-sm-2 col-form-label">喜爱星级</label>
                <div class="col-sm-4">
                    <input type="number" name="your_awesome_parameter" id="star" class="rating" value="<c:if test="${sku!=null && sku.star != null}">${sku.star}</c:if>" data-min="1" data-max="5" />
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-6">
                    <div id="toolbar">
                        <button type="button" onclick="addOrder();" class="btn btn-primary btn-sm">保存</button>
                        <button type="button" onclick="addOrder();" class="btn btn-danger btn-sm">取消</button>
                    </div>
                </div>
            </div>
            <input id="src" name="src" type="hidden" value="<c:if test="${sku != null && sku.picUrl != null}">${sku.picUrl}</c:if>">
            <input id="dataId" type="hidden" value="<c:if test="${sku != null}">${sku.id}</c:if>">
        </div>
    </div>
</div>
</body>
<script src="<%=root %>/resources/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=root %>/resources/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=root %>/resources/js/jquery.extends.js"></script>
<script type="text/javascript">
    $("#file")
        .fileinput({
            language: "zh", //设置语言
            uploadUrl: "<%=root %>file/upload.do", //上传的地址
            allowedFileExtensions: ["jpg", "png", "jpeg", "bmp"], //接收的文件后缀
            theme: "fa",      // 主题设置
            initialPreviewAsData: true,
            dropZoneEnabled: false,          // 禁止点击预览区域进行文件上传操作
            maxFileCount: 1,                    // 最大上传为 1
            showUpload: false,             // 不显示上传按钮，选择后直接上传
            previewClass:"uploadPreview",
            enctype: 'multipart/form-data',
            <c:if test="${sku != null && sku.picUrl != null}">
                initialPreview: [
                    "<img src='${sku.picUrl}' />"
                ],
            </c:if>
        })
        .on("change", function() {
            // 清除掉上次上传的图片
            $(".uploadPreview").find(".file-preview-frame:first").remove();
            $(".uploadPreview").find(".kv-zoom-cache:first").remove();
        })
        .on("filebatchselected", function(e, files) {
            $(this).fileinput("upload");             // 文件选择完直接调用上传方法。
        })
        .on("fileuploaded", function(e, data, previewiId, index) {       // 上传完成后的处理
            var form = data.form,
                files = data.files,
                extra = data.extra,
                response = data.response,        // 响应
                reader = data.reader;          // 文件对象
                $("#src").val(response.path);
                let img = new Image();     // 这里上传的是图片，对图片处理获取图片的分辨率
                img.src = reader.result;
                if (img.complete) {
                    $(this).attr("data-displayReso", img.width + "*" + img.height);
                } else {
                    img.onload = function() {
                        $(this).attr("data-displayReso", img.width + "*" + img.height);
                    };
                }

        }
        // .on('filedelete', function (event, previewId, extra) {
        //     $("#src").val('');
        // })
        );

    //单个时间插件
    $("input[name='buyDateStr']").daterangepicker(
        {
            singleDatePicker: true,//设置为单个的datepicker，而不是有区间的datepicker 默认false
            showDropdowns: true,//当设置值为true的时候，允许年份和月份通过下拉框的形式选择 默认false
            autoUpdateInput: false,//1.当设置为false的时候,不给与默认值(当前时间)2.选择时间时,失去鼠标焦点,不会给与默认值 默认true
            timePicker24Hour : true,//设置小时为24小时制 默认false
            timePicker : false,//可选中时分 默认false
            locale: {
                format: "YYYY-MM-DD",
                separator: " - ",
                daysOfWeek: ["日","一","二","三","四","五","六"],
                monthNames: ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"]
            }
        }
    ).on('cancel.daterangepicker', function(ev, picker) {
        $("#buyDateStr").val("请选择日期");
        $("#buyDate").val("");
    }).on('apply.daterangepicker', function(ev, picker) {
        $("#buyDateStr").val(picker.startDate.format('YYYY-MM-DD'));
        $("#buyDate").val(picker.startDate.format('YYYY-MM-DD'));
    });

    //单个时间插件
    $("input[name='changeDateStr']").daterangepicker(
        {
            singleDatePicker: true,//设置为单个的datepicker，而不是有区间的datepicker 默认false
            showDropdowns: true,//当设置值为true的时候，允许年份和月份通过下拉框的形式选择 默认false
            autoUpdateInput: false,//1.当设置为false的时候,不给与默认值(当前时间)2.选择时间时,失去鼠标焦点,不会给与默认值 默认true
            timePicker24Hour : true,//设置小时为24小时制 默认false
            timePicker : false,//可选中时分 默认false
            locale: {
                format: "YYYY-MM-DD",
                separator: " - ",
                daysOfWeek: ["日","一","二","三","四","五","六"],
                monthNames: ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"]
            }
        }
    ).on('cancel.daterangepicker', function(ev, picker) {
        $("#changeDateStr").val("请选择日期");
        $("#changeDate").val("");
    }).on('apply.daterangepicker', function(ev, picker) {
        $("#changeDateStr").val(picker.startDate.format('YYYY-MM-DD'));
        $("#changeDate").val(picker.startDate.format('YYYY-MM-DD'));
    });

    //区间时间插件
    $("input[name='date2']").daterangepicker(
        {
            // autoApply: true,
            autoUpdateInput: false,
            // alwaysShowCalendars: true,
            ranges: {
                '今天': [moment(),moment()],
                '昨天': [moment().subtract(1, 'days'),moment().subtract(1, 'days')],
                '近7天': [moment().subtract(7, 'days'), moment()],
                '这个月': [moment().startOf('month'), moment().endOf('month')],
                '上个月': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            },
            locale: {
                format: "YYYY/MM/DD HH:MM:SS",
                separator: " - ",
                applyLabel: "确认",
                cancelLabel: "清空",
                fromLabel: "开始时间",
                toLabel: "结束时间",
                customRangeLabel: "自定义",
                daysOfWeek: ["日","一","二","三","四","五","六"],
                monthNames: ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"]
            }
        }
    ).on('cancel.daterangepicker', function(ev, picker) {
        $("#date2").val("请选择日期范围");
        $("#startTime").val("");
        $("#endTime").val("");
    }).on('apply.daterangepicker', function(ev, picker) {
        $("#startTime").val(picker.startDate.format('YYYY-MM-DD HH:mm:ss'));
        $("#endTime").val(picker.endDate.format('YYYY-MM-DD HH:mm:ss'));
        $("#date2").val(picker.startDate.format('YYYY-MM-DD')+" 至 "+picker.endDate.format('YYYY-MM-DD'));
    });

    function addOrder() {
        var id = $("#dataId").val();
        var para={"name": $("#name").val(),
            "categoryId":$("#categoryId").val(),
            "buyTime":$("#buyDate").val(),
            "changeTime":$("#changeDate").val(),
            "productTime":$("#startTime").val(),
            "expiredTime":$("#endTime").val(),
            "picUrl":$("#src").val(),
            "shopName":$("#shopName").val(),
            "brand":$("#brand").val(),
            "url":$("#url").val(),
            "status":$("#status").val(),
            "star":$("#star").val(),
            "id":id};
        $.ajax({
            url: "<%=root%>sku/addOrUpdate.do",
            type: "post",
            async: false,
            dataType:'json',
            contentType:'application/json;character:utf-8',
            data:JSON.stringify(para),
            success:function(data) {
                if (data.msg) {
                    toastr.error(data.msg);
                } else {
                    if (id) {
                        toastr.info("修改成功");
                    } else {
                        toastr.info("添加成功");
                    }
                    window.location.href = "<%=root%>/sku/index.do";
                }
            }
        });
    }
</script>
</html>