package Test.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Test.action.PageAction;
import Test.info.PageBean;
import Test.info.Record;
public class PageServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private PageAction pageAction=new PageAction();
	private int getPage_num(HttpServletRequest request){
		int page_num=1;
		String parm=request.getParameter("page_num");
		if(parm!=null && !parm.trim().isEmpty()){
			page_num=Integer.parseInt(parm);
		}
		return page_num;
	}
	private String getUrl(HttpServletRequest request){
		String url=request.getRequestURI()+"?"+request.getQueryString();
		int index=url.lastIndexOf("&page_num=");
		if(index!=-1){
			url=url.substring(0,index);
		}
		return url;
	}	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		String path="Test.jsp";
		try {		
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			int page_num=getPage_num(request);
			String url=getUrl(request);
			PageBean<Record> pageBean= pageAction.findByPage(page_num);
			pageBean.setUrl(url);
			request.setAttribute("pb", pageBean);		
		} catch (Exception e) {
			// TODO: handle exception
			path="error.jsp";
		}
        request.getRequestDispatcher(path).forward(request, response);
	}
}
