<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="Test.jdbc.DatabaseConnection"%>
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
<style>
a, a:hover {text-decoration: none;}
a, a:link {text-decoration: none;}
</style>
</head>
<body style="background-color:#CCC;">
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
				<div class="col-md-12 column">
					<ul class="breadcrumb">
						<li class="active"><a href="#java_web" data-toggle="tab">Java web</a></li>
						<li><a href="#sql_server" data-toggle="tab">Mysql</a></li>
					</ul>
				</div>
			</div>

			<div class="tab-content col-md-10 col-md-offset-1" id="java_web">
				<div class="tab-pane fade in active" style="margin-top:10px;">
					<table class="table">
						<thead>
							<tr>
								<th class="col-md-3">Problem</th>
								<th class="col-md-1 col-md-offset-8">Date</th>
							</tr>
						</thead>
						<tbody>
							<%
								Connection conn = new DatabaseConnection().getConnection();
								PreparedStatement stmts = conn
										.prepareStatement("select count(*) from record");
								ResultSet rt = stmts.executeQuery();
								int record_count = 0;
								while (rt.next()) {
									record_count = Integer.parseInt(rt.getString("count(*)"));
								}
								int show_page = 0;
								int page_size = 7;
								PreparedStatement stmt = conn
										.prepareStatement("select * from record limit ?,?");
								stmt.setInt(1, show_page * page_size);
								stmt.setInt(2, page_size);
								ResultSet rs = stmt.executeQuery();
								while (rs.next()) {
							%>
							<tr>
								<td class="col-md-3"><%=rs.getString("emtitle")%></td>
								<td class="col-md-1 col-md-offset-8"><%=rs.getString("time")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span class="badge bg-success"> <a class="text-danger"
										href="detail.jsp?id=<%=rs.getInt("id")%>">more</a>
								</span></td>
							</tr>
							<%
								}
								rs.close();
								rt.close();
								conn.close();
							%>
						</tbody>
					</table>
					<div class="row">
						<div class="col-md-9"></div>
						<ul class="pagination">
							<%
								int j = record_count / page_size;
								if (record_count % page_size != 0) {
									j = j + 1;
								}
								for (int i = 0; i < j; i++) {
							%>
							<li><a href="java_next.jsp?show_page=<%=i%>"><%=i + 1%></a></li>
							<%
								}
							%>
							<li><a href="java_next.jsp?show_page=<%=show_page + 1%>">下一页</a></li>
						</ul>
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
