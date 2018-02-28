<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript">
	function validate(f) {
		if (!(/^\w{5,15}$/.test(f.user_id.value))) {
			alert("用户ID必须是5~15位！");
			f.user_id.focus();
			return false;
		}
		if (!(/^\w{5,15}$/.test(f.password.value))) {
			alert("用户密码必须是5~15位！");
			f.password.focus();
			return false;
		}
	}
</script>
</head>
<body style="background-color:#CCC;">
	<div class="container">
		<h1 id="User">WE JUST CHANGE THE WORLD!</h1>
		<%
			request.setCharacterEncoding("utf-8");
			String username=(String)session.getAttribute("username");
			if(username!=null){
				out.println("<h1 id='User1'>"+username+" WILL CHANGE THE WORLD !!!</h1>");
			}
			List<String> info = (List<String>) request.getAttribute("info");
			if (info != null) {
				Iterator<String> iter = info.iterator();
				while (iter.hasNext()) {
		%>
		<%=iter.next()%>
		<%
			}
			}
		%>
		<script>
			var html = document.getElementById("User1").innerHTML;
			if (html != null) {
				document.getElementById("User").innerHTML = "";
			} else {
				document.getElementById("User").innerHTML = "WE JUST CHANGE THE WORLD!";
			}
		</script>
		<div class="navbar navbar-inverse">
			<div style="height:auto;" class="navbar-inner nav-collapse">
				<div class="container">
					<ul class="nav navbar-nav">
						<li class="active"><a href="#home" data-toggle="tab">Home</a></li>
						<li><a href="#article" data-toggle="tab">Daily article</a></li>
						<li><a href="#contact" data-toggle="tab">Attend us</a></li>
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
							<li><a style="CURSOR:hand;" data-toggle="modal"
								data-target="#myModal"><span
									class="glyphicon glyphicon-log-in"></span> Login in</a></li>
						</ul>
					</div>

					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true"
						data-backdrop="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title text-center" id="myModalLabel">用户登陆</h4>
								</div>
								<form class="form-horizontal" role="form" action="Login"
									method="post" onsubmit="return validate(this)">
									<div class="modal-body">
										<div class="form-group">
											<label for="name" class="col-sm-2 control-label">UserId</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="name"
													name="user_id" required="required" placeholder="请输入用户id">
											</div>
										</div>
										<div class="form-group">
											<label for="password" class="col-sm-2 control-label">PassWord</label>
											<div class="col-sm-10">
												<input type="password" class="form-control" id="password"
													name="password" required="required" placeholder="请输入密码">
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<div class="col-md-5">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">close</button>
										</div>
										<div class="col-md-5">
											<button type="submit" class="btn btn-primary">Login
												in</button>
										</div>
									</div>
								</form>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal -->
					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="container  tab-content">
		<div class="col-md-12 tab-pane fade in active" id="home"
			style="background-color:#fff;border-radius:5px;">
			<div class="col-md-8">
				<h2>Let's write the code: Hello World</h2>
				<p>使用HTML输出Hello World</p>
				<pre>
&lt;!DOCTYPE HTML&gt;
&lt;html&gt;
&lt;body&gt;			
	&lt;h1&gt;Hello World&lt;/h1&gt;
&lt;/body&gt;
&lt;/html&gt;</pre>
				<p>使用PHP输出Hello World</p>
				<pre>&lt;!DOCTYPE HTML&gt;
&lt;html&gt;
&lt;body&gt;			
&lt;?php&gt;
 	echo "Hello Word";
	echo phpinfo();
&lt;/php&gt;
&lt;/body&gt;
&lt;/html&gt;</pre>
				<p>使用Java输出Hello World</p>
				<pre>public class Hello World{
	public static void main(String[] args){
		System.out.println("Hello World");
	}
}</pre>
				<p>使用C输出Hello World</p>
				<pre>#include&lt;stdio.h&gt;
void main(){
	printf("Hello World");
}</pre>
				<p>使用JavaScript输出Hello World</p>
				<pre>var sys=require("sys");
sys.puts("Hello World");</pre>
				<p>使用Python输出Hello World</p>
				<pre>>>>>print "Hello World"	
Hello World</pre>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-3">
				<h2>Make it by this</h2>
				<div class="row">
					<ul class="nav nav-pills nav-stacked">
						<li><a href='java.jsp'>Java</a></li>
						<li><a href='#'>Python</a></li>
						<li><a href='#'>C</a></li>
						<li><a href='#'>HTML</a></li>
						<li><a href='#'>C++</a></li>
						<li><a href='#'>JavaScript</a></li>
						<li><a href='#'>Ruby</a></li>
						<li><a href='#'>SQL</a></li>
						<li><a href='#'>C#</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="col-md-12 tab-pane fade" id="article"
			style="background-color:#fff;border-radius:5px;padding-bottom:20px;">
			<h3 class="text-center">Record logs with you problem</h3>
			<br>
			<form class="form-horizontal" role="form" action="addRecord"
				method="post">
				<div class="form-group">
					<label for="title" class="col-md-2 control-label">主标题</label>
					<div class="col-md-8">
						<input class="form-control" type="text" id="title"
							placeholder="请输入主标题" required="required" name="title">
					</div>
				</div>
				<br>
				<div class="form-group">
					<label for="em_title" class="col-md-2 control-label">副标题</label>
					<div class="col-md-8">
						<input class="form-control" type="text" id="em_title"
							placeholder="请输入副标题" required="required" name="emtitle">
					</div>
				</div>
				<br>
				<div class="form-group">
					<label for="content" class="col-md-2 control-label">简介</label>
					<div class="col-md-8">
						<textarea rows="8" class="form-control" id="content"
							placeholder="请输入不少于140字的简介" required="required" name="content"></textarea>
					</div>
				</div>
				<br>
				<div class="form-group">
					<label for="upload" class="col-md-2 control-label">选择二维码</label>
					<div class="col-md-8">
						<input type="file" id="upload" name="url">
					</div>
				</div>
				<br>
				<div class="form-group">
					<label for="time" class="col-md-2 control-label">选择当地时间</label>
					<div class="col-md-2">
						<input type="date" class="form-control" id="time" name="time">
					</div>
				</div>
				<br>
				<button type="submit" class="btn btn-info col-md-6 col-md-offset-3">提交</button>
			</form>
			<br>
			<p class="text-center">
				<em>Post as admit only</em>
			</p>
		</div>

		<div class="col-md-12 tab-pane fade" id="contact"
			style="background-color:#fff;border-radius:5px;padding-top:15px;">
			<address class="text-center">
				<strong> Zhangjiajie City,HuNan Province,China. </strong><br> <abbr
					title="Telphone">Tel:</abbr>(027)0744-888666
			</address>
		</div>
	</div>

	<div class="container" style="margin-top:20px;">
		<div class="col-md-12"
			style="background-color:#fff;border-radius:5px;">
			<div class="row" style="margin-top:30px;">
				<h5 class="text-center">
					The world will be charged by us.<br>
					<br>
					<small>世界将由我们来掌控</small>
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
