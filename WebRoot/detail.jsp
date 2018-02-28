<%@page import="Test.action.RecordAction"%>
<%@page import="Test.info.Record"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>StackFlows</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>

<body style="background-color:#CCC;">
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		Record record = RecordAction.getRecord(id);
	%>
	<div class="container">
		<h1>Make it by this</h1>
		<div class="navbar navbar-inverse">
			<div style="height:auto;" class="navbar-inner nav-collapse">
				<div class="container">
					<ul class="nav navbar-nav">
						<li><a href="index.jsp">Home</a></li>
						<li class="active"><a href="java.jsp">Java Problem</a></li>
					</ul>
					<form class="navbar-form navbar-left" role="search" action=""
						method="post">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search">
						</div>
						<button class="btn btn-info" type="submit">
							<i style="color:#fff;" class="glyphicon glyphicon-search"></i>
						</button>
					</form>
					<div class="row">
						<ul class="nav navbar-nav navbar-right col-md-3">
							<li><a href="#"><span class="glyphicon glyphicon-user"></span>
									Sign up</a></li>
							<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
									Login in</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="col-md-12"
			style="background-color:#fff;border-radius:5px;">
			<div class="row clearfix" style="margin-top:20px;">
				<div class="col-md-10 col-md-offset-1">
					<div class="page-header">
						<h1>
							<strong><%=record.getTitle()%></strong>&nbsp;&nbsp; <small
								class="text-muted">[<%=record.getEmtitle()%>]
							</small>
						</h1>
					</div>
					<blockquote>
						<p class="lead"><%=record.getContent()%></p>
					</blockquote>
					<div class="row" style="padding-bottom:20px;">
						<div class="col-md-8">
							<address class="text-center">
								<p class="lead">
									<br> <strong>如何你有什么看法或意见</strong><br>
								<p></p>
								请扫描右旁二维码查阅或点击最下方邮件emali我们<br>
								</p>
							</address>
						</div>
						<div class="col-md-4">
							<img src="img/<%=record.getUrl()%>" class="img-thumbnail"
								alt="Cinque Terre" style="width:150px;height:150px;">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container" style="margin-top:20px;">
		<div class="col-md-12"
			style="background-color:#fff;border-radius:5px;">
			<div class="row" style="margin-top:30px;">
				<h5 class="text-center">
					The world will be charged by us.<br> <br> <small>世界将由我们来掌控</small>
				</h5>
				<address class="text-center">
					<a style="color:#333;text-decoration:none;"
						href="mailto:gqiushui23609@gmail.com">gqiushui23609@gmail.com</a>
				</address>
			</div>
		</div>
	</div>
</body>
</html>
