<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">   <%-- 在IE运行最新的渲染模式 --%>
	<meta name="viewport" content="width=device-width, initial-scale=1">   <%-- 初始化移动浏览显示 --%>

	
	<!-- 引入各种CSS样式表 -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/font-awesome.css">
	<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" href="css/index.css">	<!-- 修改自Bootstrap官方Demon，你可以按自己的喜好制定CSS样式 -->
	<link rel="stylesheet" href="css/font-change.css">	<!-- 将默认字体从宋体换成微软雅黑（个人比较喜欢微软雅黑，移动端和桌面端显示效果比较接近） -->		
	
	<script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>

	<title>学校管理系统</title>
</head>

<script type="text/javascript">
	setInterval(
			"document.getElementById('sysDate').value=new Date().toLocaleString()+'  星期'+'日一二三四五六'.charAt(new Date().getDay());",
			1000);//1000ms执行一次方法，即1s更新一次时间显示
</script>
	
<body>
<!-- 顶部菜单（来自bootstrap官方Demon）==================================== -->
<nav class="navbar navbar-inverse navbar-fixed-top">
<div class="container">
	<div class="navbar-header">
	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" >
	<span class="sr-only">Toggle navigation</span>
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
	</button>
	<a class="navbar-brand" href="sysIn.jsp">学校管理系统</a>
	</div>
	      		
	<div id="navbar" class="navbar-collapse collapse">
		<ul class="nav navbar-nav navbar-right">			            
			<li><a href="#adminLogin.jsp" onclick="showAtRight('adminLogin.jsp')" ><i class="fa fa-list"></i> 管理员登录</a></li>
			<li><a href="#userLogin.jsp" onclick="window.location.href='userLogin.jsp'" ><i class="fa fa-list"></i> 退出系统</a></li>	
			<li><input id="sysDate" style="width:240px;height:50px;background:#E6E6FA;text-align:center;" /></li>
		</ul>   			
	</div>
</div>
</nav>


<!-- 左侧菜单选项========================================= -->
<div class="container-fluid">
	<div class="row-fluie">
		<div class="col-sm-3 col-md-2 sidebar">		
			<ul class="nav nav-sidebar">
				<!-- 一级菜单 -->
				<li class="active"><a href="#userMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
					<i class="fa fa-users"></i>&nbsp; 学生用户 <span class="sr-only">(current)</span></a>
				</li> 
				<!-- 二级菜单 -->
				<!-- 注意一级菜单中<a>标签内的href="#……"里面的内容要与二级菜单中<ul>标签内的id="……"里面的内容一致 -->
				<ul id="userMeun" class="nav nav-list collapse menu-second">
					<li><a href="#stuLogin.jsp" onclick="showAtRight('stuLogin.jsp')"><i class="fa fa-users"></i> 学生登录</a></li>
					<li><a href="#stuReg.jsp" onclick="showAtRight('stuReg.jsp')"><i class="fa fa-users"></i> 学生注册</a></li>
					
				</ul>
				 
				<li><a href="#productMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
					<i class="fa fa-user"></i>&nbsp; 教师用户 <span class="sr-only">(current)</span></a>
				</li> 
				<ul id="productMeun" class="nav nav-list collapse menu-second">
					<li><a href="#teaLogin.jsp" onclick="showAtRight('teaLogin.jsp')"><i class="fa fa-user"></i> 教师登录</a></li>
					<li><a href="#teaReg.jsp" onclick="showAtRight('teaReg.jsp')"><i class="fa fa-user"></i> 教师注册</a></li>
				</ul>
				
				<li><a href="#recordMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
					<i class="fa fa-globe"></i>&nbsp; 管理员用户 <span class="sr-only">(current)</span></a>
				</li> 
				<ul id="recordMeun" class="nav nav-list collapse menu-second">
					<li><a href="#adminLogin.jsp" onclick="showAtRight('adminLogin.jsp')" ><i class="fa fa-globe"></i> 登录系统</a></li>
				</ul>
				
				<li><a href="###" class="nav-header menu-first collapsed" data-toggle="collapse" onclick="window.location.href='userLogin.jsp'">
					<i class="fa fa-user"></i>&nbsp; 退出系统 <span class="sr-only">(current)</span></a>
				</li>
					
			</ul>
			
		</div>
	</div>
</div>

<!-- 右侧内容展示==================================================   -->  
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<h1 class="page-header"><i class="fa fa-cog fa-spin"></i>&nbsp;用户中心
	<%for(int i=1;i<=30;i++){out.print("&nbsp;");} %><small>欢迎使用学校管理系统！</small></h1>
		
	<!-- 载入左侧菜单指向的jsp（或html等）页面内容  -->
 	<div id="content">
 	 
		<h3><strong>使用指南：</strong></h3>  
		
		<dl>
		  <dt>学生用户</dt>
		  <dd>
		  	<ul>
		  	<li>学生登录</li>
		  	<li>学生注册</li>
		  	</ul>
		  </dd>
		  <dt>教师用户</dt>
		  <dd>
		  	<ul>
		  	<li>教师登录</li>
		  	<li>教师注册</li>
		  	</ul>
		  </dd>
		  <dt>管理员用户</dt>
		  <dd>
		  	<ul>
		  	<li>登录系统</li>
		  	</ul>
		  </dd>
		  <dt>退出系统</dt>
		  <dd>
		  	<ul>
		  	<li>退出登录</li>
		  	</ul>
		  </dd>
		</dl>       						
 					
</div>

</div> 
		
		
<script type="text/javascript">

/*
 * 对选中的标签激活active状态，对先前处于active状态但之后未被选中的标签取消active
 * （实现左侧菜单中的标签点击后变色的效果）
 */
$(document).ready(function () {
	$('ul.nav > li').click(function (e) {
		//e.preventDefault();	加上这句则导航的<a>标签会失效
		$('ul.nav > li').removeClass('active');
		$(this).addClass('active');
	});
});

/*
 * 解决ajax返回的页面中含有javascript的办法：
 * 把xmlHttp.responseText中的脚本都抽取出来，不管AJAX加载的HTML包含多少个脚本块，我们对找出来的脚本块都调用eval方法执行它即可
 */
function executeScript(html)
{
	var reg = /<script[^>]*>([^\x00]+)$/i;
    //对整段HTML片段按<\/script>拆分
    var htmlBlock = html.split("<\/script>");
    for (var i in htmlBlock) 
    {
        var blocks;//匹配正则表达式的内容数组，blocks[1]就是真正的一段脚本内容，因为前面reg定义我们用了括号进行了捕获分组
        if (blocks = htmlBlock[i].match(reg)) 
        {
            //清除可能存在的注释标记，对于注释结尾-->可以忽略处理，eval一样能正常工作
            var code = blocks[1].replace(/<!--/, '');
            try 
            {
                eval(code) //执行脚本
            } 
            catch (e) 
            {
            }
        }
    }
}

/*
 * 利用div实现左边点击右边显示的效果（以id="content"的div进行内容展示）
 * 注意：
 *   ①：js获取网页的地址，是根据当前网页来相对获取的，不会识别根目录；
 *   ②：如果右边加载的内容显示页里面有css，必须放在主页（即例中的index.jsp）才起作用
 *   （如果单纯的两个页面之间include，子页面的css和js在子页面是可以执行的。 主页面也可以调用子页面的js。但这时要考虑页面中js和渲染的先后顺序 ）
*/
function showAtRight(url) {
	var xmlHttp;
	
	if (window.XMLHttpRequest) {
		// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlHttp=new XMLHttpRequest();	//创建 XMLHttpRequest对象
	}
	else {
		// code for IE6, IE5
		xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
	}

	xmlHttp.onreadystatechange=function() {		
		//onreadystatechange — 当readystate变化时调用后面的方法
		
		if (xmlHttp.readyState == 4) {
			//xmlHttp.readyState == 4	——	finished downloading response
			
			if (xmlHttp.status == 200) {
				//xmlHttp.status == 200		——	服务器反馈正常			
				
				document.getElementById("content").innerHTML=xmlHttp.responseText;	//重设页面中id="content"的div里的内容
				executeScript(xmlHttp.responseText);	//执行从服务器返回的页面内容里包含的JavaScript函数
			}
			//错误状态处理
			else if (xmlHttp.status == 404){
				alert("出错了☹   （错误代码：404 Not Found），……！"); 
				/* 对404的处理 */
				return;
			}
			else if (xmlHttp.status == 403) {  
				alert("出错了☹   （错误代码：403 Forbidden），……"); 
				/* 对403的处理  */ 
				return;
	        }
			else {
				alert("出错了☹   （错误代码：" + request.status + "），……"); 
				/* 对出现了其他错误代码所示错误的处理   */
				return;
			}   
		} 
            
	  }
	
	//把请求发送到服务器上的指定文件（url指向的文件）进行处理
	xmlHttp.open("GET", url, true);		//true表示异步处理
	xmlHttp.send();
}		
</script>
	
</body>
</html>