<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8"
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

    <title>图书出库管理</title>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>物品管理</h5>
        </div>
        <div class="ibox-content">
            <div class="row">
                <div class="col-md-3 m-b-xs">
                    <div class="form-group">
                        <input type="text" placeholder="更换时间" name="date2" id="date2" class="input-lg form-control float-right">
                        <input type="hidden" id = "startTime" name="startTime" class="form-control" />
                        <input type="hidden" id = "endTime" name="endTime" class="form-control" />
                    </div>
                </div>
                <div class="col-md-3 m-b-xs">
                    <div class="form-group">
                        <input type="text" id="nameLike1" placeholder="物品名称" class="input-lg form-control">
                    </div>
                </div>
                <div class="col-md-3 m-b-xs">
                    <select id="categoryId" class="custom-select input-lg form-control">
                        <option value="">类目</option>
                        <c:forEach items="${categorys}" var="item">
                            <option value="${item.id}">${item.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-3 m-b-xs">
                    <span class="input-group-btn"><button type="button" onclick="search1();" class="btn btn-sm btn-primary">搜索</button> </span>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 m-b-xs">
                    <div class="form-group">
                        <a href="<%=root%>sku/addPage.do"><button type="button" class="btn btn-info btn-lg">新增物品</button></a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="tabs-container">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true">正使用</a>
                        </li>
                        <li class=""><a data-toggle="tab" href="#tab-2" aria-expanded="false">未使用</a>
                        </li>
                        <li class=""><a data-toggle="tab" href="#tab-3" aria-expanded="false">使用完</a>
                        </li>
                        <li class=""><a data-toggle="tab" href="#tab-4" aria-expanded="false">已过期</a>
                        </li>
                        <li class=""><a data-toggle="tab" href="#tab-5" aria-expanded="false">已废弃</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane active">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <table class="table table-striped table-bordered table-hover" id="using">
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-2" class="tab-pane">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <table class="table table-striped table-bordered table-hover" id="unUse">
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-3" class="tab-pane">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <table class="table table-striped table-bordered table-hover" id="used">
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-4" class="tab-pane">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <table class="table table-striped table-bordered table-hover" id="over">
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-5" class="tab-pane">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <table class="table table-striped table-bordered table-hover" id="trans">
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" style="display: none;" data-keyboard="false" data-backdrop="static" id="modal" aria-hidden="true" role="dialog" aria-labelledby="modalHeader">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">物品开始使用/使用完/废弃</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <textarea class="form-control" rows="3" placeholder="描述"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="submit">提交</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" id="closeModal">关闭</button>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="dataId" value="">
</body>
<script src="<%=root %>/resources/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=root %>/resources/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=root %>/resources/js/jquery.extends.js"></script>
<script type="text/javascript">
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

    var _using;
    var _orderCaiTable;
    var _orderAllTable;

    $(document).ready(function() {
        _using = $('#using').bootstrapTable({
            sidePagination:'server',//设置为服务器端分页
            url: '<%=root%>/sku/list.do',
            method: 'post',
            contentType: 'application/x-www-form-urlencoded;charset=utf-8',
            striped: true,
            pagination: true,
            pageList: [10,30,50],
            showToggle: true,
            showRefresh: true,
            showColumns: true,
            queryParams: queryParams1,
            sortable: true,
            idField: 'id',
            columns: [
                {field: 'box',width: '10%', title: '<input class="form-check-input" type="checkbox">', align: 'center',
                    formatter:function(value,row){
                            var html = "<input class=\"form-check-input\" type=\"checkbox\">";
                            return html;
                        }
                },
                {field: 'n',width: '15%', title: '物品名称', align: 'center',
                    formatter:function(value,row){
                        var html = "<img src=\""+row["picUrl"]+"\" width=\"100\" height=\"100\" />&nbsp;&nbsp;<span><a href='"+row["url"]+"' target=\"_Blank\">"+row["name"]+"</span>"
                        return html;
                    }},
                {field: 'cateName', width: '10%', title: '分类', align: 'center'},
                {field: 'shopName',width: '10%', title: '店铺名称', align: 'center'},
                {field: 'buyTime',width: '10%', title: '购买时间', align: 'center',
                    formatter : function(value) {
                        return $(this).dateFormat(value, 'yyyy-MM-dd HH:mm:ss');
                    }},
                {field: 'changeTime',width: '10%', title: '需更换时间', align: 'center',
                    formatter : function(value) {
                        return $(this).dateFormat(value, 'yyyy-MM-dd HH:mm:ss');
                    }},
                {field: 'star',width: '5%', title: '喜爱星级', align: 'center',
                    formatter : function(value) {
                        var html = "<div align='center' class=\"star_bg star_"+value+"_m star_margin\"></div>";
                        return html;
                    }},
                {field: 'opt',width: '10%', title: '操作', align: 'center',
                    formatter: function(value, row){
                        return '<button type="button" class="btn btn-warning btn-xs" onclick="openModel(\''+row.id+'\')">用完</button>&nbsp;&nbsp;' +
                            '<button type="button" class="btn btn-danger btn-xs" onclick="openModel(\''+row.id+'\')">废弃</button>&nbsp;&nbsp;' +
                            '<button type="button" class="btn btn-info btn-xs">修改</button>';
                    }}
            ],
            toolbar: '#toolbar'
        });
    });

    $(document).ready(function() {
        _orderDingTable = $('#orderDingTable').bootstrapTable({
            sidePagination:'server',//设置为服务器端分页
            url: '<%=root%>/order/list.do',
            method: 'post',
            contentType: 'application/x-www-form-urlencoded;charset=utf-8',
            striped: true,
            pagination: true,
            pageList: [10,30,50],
            showToggle: true,
            showRefresh: true,
            showColumns: true,
            queryParams: queryParams2,
            sortable: true,
            idField: 'id',
            columns: [
                {field: 'number',width: '15%', title: '单号', align: 'center'},
                {field: 'totalPrice', width: '10%', title: '总金额（元）', align: 'center'},
                {field: 'status',width: '10%', title: '状态', align: 'center',
                    formatter : function(value) {
                        if (value === 4) return "采购退货";
                        else if(value === 5) return "采购退货成功";
                        else if(value === 6) return "退货取消";
                    }},
                {field: 'createTime',width: '10%', title: '创建时间', align: 'center',
                    formatter : function(value) {
                        return $(this).dateFormat(value, 'yyyy-MM-dd HH:mm:ss');
                    }},
                {field: 'opt',width: '10%', title: '操作', align: 'center',
                    formatter: function(value, row){
                        return '<button type="button" class="btn btn-info btn-xs" onclick="openModel(\''+row.id+'\')">详情</button>&nbsp;&nbsp;' +
                            '<button type="button" class="btn btn-primary btn-xs" onclick="outDepot(\''+row.id+'\', 1)">出库</button>&nbsp;&nbsp;'
                            + '<button type="button" class="btn btn-danger btn-xs" onclick="deleteData(\''+row.id+'\', 1)">取消</button>&nbsp;&nbsp;';
                    }}
            ],
            toolbar: '#toolbar'
        });
    });

    $(document).ready(function() {
        _orderCaiTable = $('#orderCaiTable').bootstrapTable({
            sidePagination:'server',//设置为服务器端分页
            url: '<%=root%>/order/list.do',
            method: 'post',
            contentType: 'application/x-www-form-urlencoded;charset=utf-8',
            striped: true,
            pagination: true,
            pageList: [10,30,50],
            showToggle: true,
            showRefresh: true,
            showColumns: true,
            queryParams: queryParams3,
            sortable: true,
            idField: 'id',
            columns: [
                {field: 'number',width: '15%', title: '单号', align: 'center'},
                {field: 'totalPrice', width: '10%', title: '总金额（元）', align: 'center'},
                {field: 'status',width: '10%', title: '状态', align: 'center',
                    formatter : function(value) {
                        if (value === 11) return "待出库";
                        else if(value === 12) return "已出库";
                        else if(value === 13) return "销售已取消";
                    }},
                {field: 'createTime',width: '10%', title: '创建时间', align: 'center',
                    formatter : function(value) {
                        return $(this).dateFormat(value, 'yyyy-MM-dd HH:mm:ss');
                    }},
                {field: 'opt',width: '10%', title: '操作', align: 'center',
                    formatter: function(value, row){
                        return '<button type="button" class="btn btn-info btn-xs" onclick="openModel(\''+row.id+'\')">详情</button>&nbsp;&nbsp;' +
                            '<button type="button" class="btn btn-primary btn-xs" onclick="outDepot(\''+row.id+'\')">出库</button>&nbsp;&nbsp;'
                            + '<button type="button" class="btn btn-danger btn-xs" onclick="deleteData(\''+row.id+'\')">取消</button>&nbsp;&nbsp;';
                    }}
            ],
            toolbar: '#toolbar'
        });
    });

    function queryParams1(params) {
        params.nameLike = $('#nameLike1').val();
        params.startTime = $('#startTime').val();
        params.endTime = $('#endTime').val();
        params.categoryId = $('#categoryId').val();
        params.status = 0;
        return params;
    }

    function queryParams2(params) {
        params.nameLike = $('#nameLike2').val();
        var dataArr = new Array();
        dataArr.push(4);
        params.status = dataArr;
        return params;
    }

    function queryParams3(params) {
        params.nameLike = $('#nameLike3').val();
        var dataArr = new Array();
        dataArr.push(11);
        params.status = dataArr;
        return params;
    }

    function search1() {
        _using.bootstrapTable("refresh");
    }

    function search2() {
        _orderDingTable.bootstrapTable("refresh");
    }

    function search3() {
        _orderCaiTable.bootstrapTable("refresh");
    }

    function outDepot(id, type) {
        swal({
                title: "确认出库么？",
                text: "要慎重啊！这个操作可是不能反悔的",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "出库",
                cancelButtonText: "取消",
                closeOnConfirm: false,
                closeOnCancel: false,
                showLoaderOnConfirm: true
            },
            function(isConfirm){
                if (isConfirm) {
                    if (type == 1) type = 'out';
                    else type = 'back_out';
                    $.ajax({
                        url: "<%=root%>goodsStock/purchaseIn.do",
                        type: "post",
                        data: {
                            orderId:id,
                            type:type
                        },
                        success:function(result){
                            if (result.msg) {
                                swal("取消", result.msg, "error");
                            } else {
                                swal("成功!", "出库成功", "success");
                                _orderDingTable.bootstrapTable("refresh");
                                _orderCaiTable.bootstrapTable("refresh");
                            }
                        }
                    })
                } else {
                    swal("取消", "谢谢您的考虑:)", "error");
                }
            });
    }

    function deleteData(id, type) {
        swal({
                title: "确认取消么？",
                text: "要慎重啊！这个操作可是不能反悔的",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "删除",
                cancelButtonText: "取消",
                closeOnConfirm: false,
                closeOnCancel: false,
                showLoaderOnConfirm: true
            },
            function(isConfirm){
                if (isConfirm) {
                    if (type == 1) type = 'out';
                    else type = 'back_out';
                    $.ajax({
                        url: "<%=root%>goodsStock/delete.do",
                        type: "post",
                        data: {orderId:id,
                            type:type},
                        success:function(result){
                            if (result.msg) {
                                swal("取消", result.msg, "error");
                            } else {
                                swal("成功!", "您取消了这个订单", "success");
                                _orderDingTable.bootstrapTable("refresh");
                                _orderCaiTable.bootstrapTable("refresh");
                            }
                        }
                    })
                } else {
                    swal("取消", "谢谢您的考虑:)", "error");
                }
            });
    }

    function openModel(id) {
        $("#modal").modal("show");
        $("#dataId").val = id;
    }
</script>
</html>