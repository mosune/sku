<%@ page language="java" contentType="text/html; charset=UTF-8"
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
                    <input type="" class="form-control" id="name">
                </div>
            </div>
            <div class="form-group row">
                <label for="categoryId" class="col-sm-2 col-form-label"><span style="color: red">*</span>物品类目</label>
                <div class="col-sm-4">
                    <select id="categoryId" class="custom-select input-s-lg form-control">
                        <option value="">类目</option>
                        <c:forEach items="${categorys}" var="item">
                            <option value="${item.id}">${item.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label for="buyDate" class="col-sm-2 col-form-label">购买时间</label>
                <div class="col-sm-4">
                    <input type="text" name="buyDateStr" id="buyDateStr" class="form-control" />
                    <input type="hidden" id = "buyDate" name="buyDate" class="form-control" />
                </div>
            </div>
            <div class="form-group row">
                <label for="changeDate" class="col-sm-2 col-form-label">更换时间</label>
                <div class="col-sm-4">
                    <input type="text" name="changeDateStr" id="changeDateStr" class="form-control" />
                    <input type="hidden" id = "changeDate" name="changeDate" class="form-control" />
                </div>
            </div>
            <div class="form-group row">
                <label for="date2" class="col-sm-2 col-form-label">有效期</label>
                <div class="col-sm-4">
                    <input type="text" placeholder="更换时间" name="date2" id="date2" class="input-lg form-control float-right">
                    <input type="hidden" id = "startTime" name="startTime" class="form-control" />
                    <input type="hidden" id = "endTime" name="endTime" class="form-control" />
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
                    <input class="form-control" id="shopName">
                </div>
            </div>
            <div class="form-group row">
                <label for="brand" class="col-sm-2 col-form-label">品牌</label>
                <div class="col-sm-4">
                    <input class="form-control" id="brand">
                </div>
            </div>
            <div class="form-group row">
                <label for="url" class="col-sm-2 col-form-label">链接</label>
                <div class="col-sm-4">
                    <input class="form-control" id="url">
                </div>
            </div>
            <div class="form-group row">
                <label for="status" class="col-sm-2 col-form-label"><span style="color: red">*</span>状态</label>
                <div class="col-sm-4">
                    <select id="status" class="custom-select input-s-lg form-control">
                        <option value="5">5</option>
                        <option value="4">4</option>
                        <option value="3">3</option>
                        <option value="2">2</option>
                        <option value="1">1</option>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label for="star" class="col-sm-2 col-form-label">喜爱星级</label>
                <div class="col-sm-4">
                    <input type="number" name="your_awesome_parameter" id="star" class="rating" value="" data-min="1" data-max="5" />
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
            <input id="src" name="src" type="hidden">
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

    var _goodsTable;
    $(document).ready(function() {
        _goodsTable = $('#goodsTable').bootstrapTable({
            sidePagination:'server',//设置为服务器端分页
            url: '<%=root%>/goods/list.do',
            method: 'post',
            contentType: 'application/x-www-form-urlencoded;charset=utf-8',
            striped: true,
            pagination: true,
            pageList: [10,30,50],
            showToggle: true,
            showRefresh: true,
            showColumns: true,
            queryParams: queryParams,
            sortable: true,
            idField: 'id',
            columns: [
                {field: 'opt',width: '15%', title: '选择', align: 'center',
                    formatter: function(value, row){
                        return '<input type="checkbox" value="'+row.id+'" name="goodsChoose" />';
                    }},
                {field: 'name',width: '15%', title: '名称', align: 'center'},
                {field: 'cateName', width: '10%', title: '类别', align: 'center'},
                {field: 'salePrice', width: '10%', title: '售卖价格（元）', align: 'center'},
                {field: 'originalPrice', width: '10%', title: '成本价格（元）', align: 'center'},
                {field: 'currentStock', width: '10%', title: '当前库存', align: 'center'},
                {field: 'remark',width: '20%', title: '描述', align: 'center'},
                {field: 'num',width: '15%', title: '数量', align: 'center',
                    formatter: function(value, row){
                        return '<input type="text" id="'+row.id+'" />';
                    }}
            ],
            toolbar: '#toolbar'
        });
    });
    function queryParams(params) {
        params.nameLike = $('#nameLike').val();
        return params;
    }
    function search() {
        _goodsTable.bootstrapTable("refresh");
    }
    function addOrder() {
        var json = [];
        $('input[name="goodsChoose"]:checked').each(function(){
            var j = {};
            j.key = $(this).val();
            j.value = $("#"+$(this).val()+"").val();
            if (j.value === '' || j.value == null) {
                toastr.error("请输入数量");
                die;
            }
            json.push(j);
        });
        var a = JSON.stringify(json);
        $.ajax({
            url: "<%=root%>order/addOrder.do",
            type: "post",
            data: {order:a,
                type:1},
            async: false,
            dataType: "json",
            success:function(data) {
                if (data.msg) {
                    toastr.error(data.msg);
                } else {
                    toastr.info("添加成功");
                }
            }
        });
        window.location.href = "<%=root%>/order/index.do";
    }
</script>
</html>