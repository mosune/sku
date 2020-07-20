<%@ page isELIgnored="false" language="java"
         contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="base.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>首页</title>
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear">
                                <span class="block m-t-xs" style="font-size:20px;">
                                    <i class="fa fa-area-chart"></i>
                                    <strong class="font-bold">家庭管理系统</strong>
                                </span>
                            </span>
                        </a>
                    </div>
                    <div class="logo-element">DRP</div>
                </li>
                <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                    <span class="ng-scope">gcgyyt</span>
                </li>
                <li>
                    <a class="J_menuItem" href="#">
                        <i class="fa fa-home"></i>
                        <span class="nav-label">主页</span>
                    </a>
                </li>
                <li>
                    <a href="<%=root%>/sku/index.do" class="J_menuItem">
                        <i class="fa fa-paper-plane"></i>
                        <span class="nav-label">物品管理</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="J_menuItem">
                        <i class="fa fa-life-saver"></i>
                        <span class="nav-label">类目管理</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-info " href="#">
                        <i class="fa fa-bars"></i>
                    </a>
                </div>
            </nav>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe id="J_iframe" width="100%" height="100%" frameborder="0" src="<%--<%=root %>/toHome.do--%>"></iframe>
        </div>
    </div>
    <!--右侧部分结束-->
</div>
<div style="text-align:center;">
    <p>来源:<a href="javascript:;" target="_blank">家庭</a></p>
</div>

<!-- 全局js -->
<script src="<%=root %>/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<%=root %>/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<!-- 自定义js -->
<script src="<%=root %>/resources/js/hAdmin.js?v=4.1.0"></script>
<script type="text/javascript" src="<%=root %>/resources/js/index.js"></script>
</body>
</html>