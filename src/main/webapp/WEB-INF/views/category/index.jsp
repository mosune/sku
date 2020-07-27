<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../base.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="<%=root %>resources/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="<%=root %>>resources/css/plugins/tree/bootstrap.min.css">
    <link href="<%=root %>>resources/css/plugins/tree/style.css">
    <title>类目管理</title>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>类目管理</h5>
        </div>
        <div class="ibox-content">
            <div class="row">
                <div class="col-md-12 m-b-xs">
                    <div class="form-group">
                        <button type="button" onclick="openModel('', '', '')" class="btn btn-info btn-sm">新增一级类目</button>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="tree well">
                    <ul>
                        <c:forEach items="${first}" var="item">
                            <li>
                                <span><i class="icon-folder-open"></i>${item.name}</span> <a href="#" onclick="openModel('${item.id}', '${item.name}', '${item.fatherId}')">修改</a> &nbsp;<a href="#" onclick="openModel('', '', '${item.id}')">添加</a>
                                <c:forEach items="${cates}" var="cate">
                                    <ul>
                                        <c:if test="${cate.fatherId == item.id}">
                                            <li>
                                                <span><i class="icon-minus-sign"></i> ${cate.name}</span> <a href="#" onclick="openModel('${cate.id}', '${cate.name}', '${cate.fatherId}')">修改</a> &nbsp;<a href="#" onclick="openModel('', '', '${cate.id}')">添加</a>
                                                <ul>
                                                    <c:forEach items="${cates}" var="cateNew">
                                                        <c:if test="${cateNew.fatherId == cate.id}">
                                                            <li>
                                                                <span><i class="icon-leaf"></i> ${cateNew.name}</span> <a href="#" onclick="openModel('${cateNew.id}', '${cateNew.name}', '${cateNew.fatherId}')">修改</a>
                                                            </li>
                                                        </c:if>
                                                    </c:forEach>
                                                </ul>
                                            </li>
                                        </c:if>
                                    </ul>
                                </c:forEach>
                            </li>
                        </c:forEach>
                    </ul>
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
                <h4 class="modal-title" id="myModalLabel">添加类目</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <input type="text" id="name" placeholder="类目名称" class="input-lg form-control">
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
<input type="hidden" id="fatherId" value="">
</body>
<script src="<%=root %>/resources/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=root %>/resources/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=root %>/resources/js/jquery.extends.js"></script>
<script type="text/javascript">
    $(function(){
        $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
        $('.tree li.parent_li > span').on('click', function (e) {
            var children = $(this).parent('li.parent_li').find(' > ul > li');
            if (children.is(":visible")) {
                children.hide('fast');
                $(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
            } else {
                children.show('fast');
                $(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
            }
            e.stopPropagation();
        });
    });

    function openModel(id, name, fatherId) {
        $("#dataId").val(id);
        $("#name").val(name);
        $("#fatherId").val(fatherId);
        $("#modal").modal("show");
    }

    function submit() {
        var id = $("#dataId").val();
        var name = $("#name").val();
        var fatherId = $("#fatherId").val();
        var para={"id": id, "name":name, "fatherId":fatherId};
        $.ajax({
            url: "<%=root%>category/addOrUpdate.do",
            type: "post",
            async: false,
            dataType:'json',
            contentType:'application/json;character:utf-8',
            data:JSON.stringify(para),
            success:function(data) {
                if (data.msg) {
                    toastr.error(data.msg);
                } else {
                    toastr.info("操作成功");
                    window.location.href="<%=root%>/category/index.do";
                }
            }
        });
    }
</script>
</html>