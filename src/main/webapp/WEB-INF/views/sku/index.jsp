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

    <title>物品管理</title>
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
                        <a href="<%=root%>sku/addPage.do"><button type="button" class="btn btn-info btn-sm">新增物品</button></a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="tabs-container">
                    <ul class="nav nav-tabs">
                        <li class="active"><a onclick="changeTab(1)" data-toggle="tab" href="#tab-1" aria-expanded="true">正使用</a>
                        </li>
                        <li class=""><a onclick="changeTab(0)" data-toggle="tab" href="#tab-2" aria-expanded="false">未使用</a>
                        </li>
                        <li class=""><a onclick="changeTab(2)" data-toggle="tab" href="#tab-3" aria-expanded="false">使用完</a>
                        </li>
                        <li class=""><a onclick="changeTab(3)" data-toggle="tab" href="#tab-4" aria-expanded="false">已过期</a>
                        </li>
                        <li class=""><a onclick="changeTab(4)" data-toggle="tab" href="#tab-5" aria-expanded="false">已废弃</a>
                        </li>
                    </ul>
                    <input type="hidden" id="tabIndex" value="1">
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane active">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <table class="table table-striped table-bordered table-hover" id="using">
                                        </table>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <button type="button" onclick="openModel('', 1, 2);" class="btn btn-warning btn-sm">批量用完</button>
                                        <button type="button" onclick="openModel('', 2, 2);" class="btn btn-danger btn-sm">批量废弃</button>
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
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <button type="button" onclick="openModel('', 1, 2);" class="btn btn-success btn-sm">批量用完</button>
                                        <button type="button" onclick="openModel('', 2, 2);" class="btn btn-danger btn-sm">批量废弃</button>
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
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <button type="button" onclick="openModel('', 2, 2);" class="btn btn-danger btn-sm">批量废弃</button>
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
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <button type="button" onclick="openModel('', 2, 2);" class="btn btn-danger btn-sm">批量废弃</button>
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
                <h4 class="modal-title" id="myModalLabel"></h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <textarea id="remark" class="form-control" rows="3" placeholder="描述"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="submit()" data-dismiss="modal" id="submit">提交</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" id="closeModal">关闭</button>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="dataId" value="">
<input type="hidden" id="optType" value="">
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
    var _unUsing;
    var _used;
    var _expire;
    var _drop;

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
                {field: 'box',width: '10%', title: '<input class="form-check-input" onclick="usingAll(this)" type="checkbox">', align: 'center',
                    formatter:function(value,row){
                            var html = "<input class=\"form-check-input\" value=\'"+row.id+"\' name=\"usingBox\" type=\"checkbox\">";
                            return html;
                        }
                },
                {field: 'n',width: '15%', title: '物品名称', align: 'center',
                    formatter:function(value,row){
                        var html = "<img src=\"<%=root%>"+row["picUrl"]+"\" width=\"100\" height=\"100\" />&nbsp;&nbsp;<span><a href='"+row["url"]+"' target=\"_Blank\">"+row["name"]+"</span>"
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
                        return '<button type="button" class="btn btn-warning btn-xs" onclick="openModel(\''+row.id+'\', 1, 1)">用完</button>&nbsp;&nbsp;' +
                            '<button type="button" class="btn btn-danger btn-xs" onclick="openModel(\''+row.id+'\', 2, 1)">废弃</button>&nbsp;&nbsp;' +
                            '<button type="button" class="btn btn-info btn-xs" onclick="update(\''+row.id+'\')">修改</button>';
                    }}
            ],
            toolbar: '#toolbar'
        });
    });

    $(document).ready(function() {
        _unUsing = $('#unUse').bootstrapTable({
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
            queryParams: queryParams2,
            sortable: true,
            idField: 'id',
            columns: [
                {field: 'box',width: '10%', title: '<input class="form-check-input" onclick="usingAll(this)" type="checkbox">', align: 'center',
                    formatter:function(value,row){
                        var html = "<input class=\"form-check-input\" value=\'"+row.id+"\' name=\"unUsingBox\" type=\"checkbox\">";
                        return html;
                    }
                },
                {field: 'n',width: '15%', title: '物品名称', align: 'center',
                    formatter:function(value,row){
                        var html = "<img src=\"<%=root%>"+row["picUrl"]+"\" width=\"100\" height=\"100\" />&nbsp;&nbsp;<span><a href='"+row["url"]+"' target=\"_Blank\">"+row["name"]+"</span>"
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
                        return '<button type="button" class="btn btn-success btn-xs" onclick="openModel(\''+row.id+'\')">使用</button>&nbsp;&nbsp;' +
                            '<button type="button" class="btn btn-danger btn-xs" onclick="openModel(\''+row.id+'\')">废弃</button>&nbsp;&nbsp;' +
                            '<button type="button" class="btn btn-info btn-xs" onclick="update(\''+row.id+'\')">修改</button>&nbsp;&nbsp;' +
                            '<button type="button" class="btn btn-primary btn-xs" onclick="log(\''+row.id+'\')">记录</button>';
                    }}
            ],
            toolbar: '#toolbar'
        });
    });

    $(document).ready(function() {
        _used = $('#used').bootstrapTable({
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
            queryParams: queryParams3,
            sortable: true,
            idField: 'id',
            columns: [
                {field: 'box',width: '10%', title: '<input class="form-check-input" onclick="usingAll(this)" type="checkbox">', align: 'center',
                    formatter:function(value,row){
                        var html = "<input class=\"form-check-input\" value=\'"+row.id+"\' name=\"usedBox\" type=\"checkbox\">";
                        return html;
                    }
                },
                {field: 'n',width: '15%', title: '物品名称', align: 'center',
                    formatter:function(value,row){
                        var html = "<img src=\"<%=root%>"+row["picUrl"]+"\" width=\"100\" height=\"100\" />&nbsp;&nbsp;<span><a href='"+row["url"]+"' target=\"_Blank\">"+row["name"]+"</span>"
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
                        return '<button type="button" class="btn btn-danger btn-xs" onclick="openModel(\''+row.id+'\', 2, 1)">废弃</button>&nbsp;&nbsp;' +
                            '<button type="button" class="btn btn-info btn-xs" onclick="update(\''+row.id+'\')">修改</button>';
                    }}
            ],
            toolbar: '#toolbar'
        });
    });

    $(document).ready(function() {
        _expire = $('#over').bootstrapTable({
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
            queryParams: queryParams4,
            sortable: true,
            idField: 'id',
            columns: [
                {field: 'box',width: '10%', title: '<input class="form-check-input" onclick="usingAll(this)" type="checkbox">', align: 'center',
                    formatter:function(value,row){
                        var html = "<input class=\"form-check-input\" value=\'"+row.id+"\' name=\"overBox\" type=\"checkbox\">";
                        return html;
                    }
                },
                {field: 'n',width: '15%', title: '物品名称', align: 'center',
                    formatter:function(value,row){
                        var html = "<img src=\"<%=root%>"+row["picUrl"]+"\" width=\"100\" height=\"100\" />&nbsp;&nbsp;<span><a href='"+row["url"]+"' target=\"_Blank\">"+row["name"]+"</span>"
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
                        return '<button type="button" class="btn btn-danger btn-xs" onclick="openModel(\''+row.id+'\', 2, 1)">废弃</button>&nbsp;&nbsp;' +
                            '<button type="button" class="btn btn-info btn-xs" onclick="update(\''+row.id+'\')">修改</button>';
                    }}
            ],
            toolbar: '#toolbar'
        });
    });

    $(document).ready(function() {
        _drop = $('#trans').bootstrapTable({
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
            queryParams: queryParams5,
            sortable: true,
            idField: 'id',
            columns: [
                {field: 'box',width: '10%', title: '<input class="form-check-input" onclick="usingAll(this)" type="checkbox">', align: 'center',
                    formatter:function(value,row){
                        var html = "<input class=\"form-check-input\" value=\'"+row.id+"\' name=\"transBox\" type=\"checkbox\">";
                        return html;
                    }
                },
                {field: 'n',width: '15%', title: '物品名称', align: 'center',
                    formatter:function(value,row){
                        var html = "<img src=\"<%=root%>"+row["picUrl"]+"\" width=\"100\" height=\"100\" />&nbsp;&nbsp;<span><a href='"+row["url"]+"' target=\"_Blank\">"+row["name"]+"</span>"
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
                        return '<button type="button" class="btn btn-info btn-xs" onclick="update(\''+row.id+'\')">修改</button>&nbsp;&nbsp;'+
                            '<button type="button" class="btn btn-primary btn-xs" onclick="log(\''+row.id+'\')">记录</button>';
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
        params.status = 1;
        return params;
    }

    function queryParams2(params) {
        params.nameLike = $('#nameLike1').val();
        params.startTime = $('#startTime').val();
        params.endTime = $('#endTime').val();
        params.categoryId = $('#categoryId').val();
        params.status = 0;
        return params;
    }

    function queryParams3(params) {
        params.nameLike = $('#nameLike1').val();
        params.startTime = $('#startTime').val();
        params.endTime = $('#endTime').val();
        params.categoryId = $('#categoryId').val();
        params.status = 2;
        return params;
    }

    function queryParams4(params) {
        params.nameLike = $('#nameLike1').val();
        params.startTime = $('#startTime').val();
        params.endTime = $('#endTime').val();
        params.categoryId = $('#categoryId').val();
        params.status = 3;
        return params;
    }

    function queryParams5(params) {
        params.nameLike = $('#nameLike1').val();
        params.startTime = $('#startTime').val();
        params.endTime = $('#endTime').val();
        params.categoryId = $('#categoryId').val();
        params.status = 4;
        return params;
    }

    function changeTab(type) {
        $("#tabIndex").val(type);
    }

    function usingAll(a) {
        var xz = $(a).prop("checked");//判断全选按钮的选中状态
        var name;
        var tabIndex = $("#tabIndex").val();
        if (tabIndex === '1') {
            name = 'usingBox';
        } else if (tabIndex === '0') {
            name = 'unUsingBox';
        } else if (tabIndex === '2') {
            name = 'usedBox';
        } else if (tabIndex === '3') {
            name = 'overBox';
        } else {
            name = 'transBox';
        }
        $("input[name='"+name+"']").prop("checked",xz);  //让class名为qx的选项的选中状态和全选按钮的选中状态一致。
    }

    function search1() {
        var tabIndex = $("#tabIndex").val();
        if (tabIndex === '1') {
            _using.bootstrapTable("refresh");
        } else if (tabIndex === '0') {
            _unUsing.bootstrapTable("refresh");
        } else if (tabIndex === '2') {
            _used.bootstrapTable("refresh");
        } else if (tabIndex === '3') {
            _expire.bootstrapTable("refresh");
        } else {
            _drop.bootstrapTable("refresh");
        }
    }

    function submit() {
        var id = $("#dataId").val();
        var ids = [];
        if (id != null && id != '') {
            ids.push(id);
        } else {
            var name;
            var tabIndex = $("#tabIndex").val();
            if (tabIndex === '1') {
                name = 'usingBox';
            } else if (tabIndex === '0') {
                name = 'unUsingBox';
            } else if (tabIndex === '2') {
                name = 'usedBox';
            } else if (tabIndex === '3') {
                name = 'overBox';
            } else {
                name = 'transBox';
            }
            $("input[name='"+name+"']").each(function() {
                if(this.checked) {
                    ids.push($(this).val());
                }
            });
        }
        var para={"ids": ids, "status":$("#optType").val(), "remark":$("#remark").val()};
        $.ajax({
            url: "<%=root%>sku/updateStatus.do",
            type: "post",
            async: false,
            dataType:'json',
            contentType:'application/json;character:utf-8',
            data:JSON.stringify(para),
            success:function(data) {
                if (data.msg) {
                    toastr.error(data.msg);
                } else {
                    toastr.info("修改成功");
                    _using.bootstrapTable("refresh");
                    _unUsing.bootstrapTable("refresh");
                    _used.bootstrapTable("refresh");
                    _expire.bootstrapTable("refresh");
                    _drop.bootstrapTable("refresh");
                }
            }
        });
    }

    function openModel(id, type, isSingle) {
        $("#dataId").val('');
        $("#remark").val('');
        if (type === 1) {
            $("#myModalLabel").html("物品使用完");
            $("#optType").val(2);
        } else if (type === 2) {
            $("#myModalLabel").html("物品废弃");
            $("#optType").val(4);
        } else {
            $("#myModalLabel").html("物品开始使用");
            $("#optType").val(1);
        }
        $("#modal").modal("show");
        if (isSingle === 1) {
            $("#dataId").val(id);
        }
    }

    function update(id) {
        window.location.href="<%=root%>/sku/updatePage.do?id="+id;
    }

    function log(id) {
        window.location.href="<%=root%>/log/index.do?id="+id;
    }
</script>
</html>