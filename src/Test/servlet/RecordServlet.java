package Test.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Test.action.RecordAction;
public class RecordServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		if(request.getRequestURI().endsWith("/addRecord")){
			IsaddRecord(request, response);
		}
	}
	private void IsaddRecord(HttpServletRequest request,HttpServletResponse response) throws IOException{	
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		String username=(String)session.getAttribute("username");
		if(username==null){
			String html="<html><head><meta http-equiv='content-type' content='/text/html';charset='utf-8'></head>"
					+ "<script>alert('请您登陆后提交！！！');</script></html>";
			response.getWriter().println(html);
			response.setHeader("refresh", "1;URL=index.jsp");
		}else {
			String title = request.getParameter("title");
			String emtitle = request.getParameter("emtitle");
			String content = request.getParameter("content");
			String url = request.getParameter("url");
			String time = request.getParameter("time");
			String left = RecordAction.addRecord(title, emtitle, content, url, time);
			String html="<html><head><meta http-equiv='content-type' content='/text/html';charset='utf-8'></head>"
					+ "<script>alert('success!');</script></html>";
			response.getWriter().println(html);
			response.setHeader("refresh", "1;URL=index.jsp");
		}
	}
}
