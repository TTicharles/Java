package Test.servlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Test.factory.DAOFactory;
import Test.info.User;
public class LoginServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 562156543693977931L;
	public void doGet(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
		String path="index.jsp";
		String user_id=req.getParameter("user_id");
		String password=req.getParameter("password");
		List<String> info=new ArrayList<String>();
		if(user_id==null || "".equals(user_id)){
			info.add("<script>alert('用户id不能为空!')</script>");
		}
		if(password==null || "".equals(password)){
			info.add("<script>alert('密码不能为空!')</script>");
		}
		if(info.size()==0){
			User user=new User();
			user.setUser_id(user_id);
			user.setPassword(password);
			try{
				if(DAOFactory.getIUserDAOInstance().findLogin(user)){
					HttpSession session=req.getSession();
					session.setAttribute("username", user.getUsername());
				}else {
					info.add("<script>alert('you failed!')</script>");					
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		req.setAttribute("info", info);
		req.getRequestDispatcher(path).forward(req, resp);
	}
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
		this.doGet(req,resp);
	}
}
