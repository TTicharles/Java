package Test.dao;
import Test.dao.IUserDAO;
import Test.info.User;
import Test.action.UserDAOImpl;
import Test.jdbc.DatabaseConnection;;
public class UserDAOProxy implements IUserDAO{
	private DatabaseConnection dbc=null;
	private IUserDAO dao=null;
	public UserDAOProxy(){
		try {
			this.dbc=new DatabaseConnection();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		this.dao=new UserDAOImpl(this.dbc.getConnection());
	}
	public boolean findLogin(User user) throws Exception{
		boolean flag=false;
		try {
			flag=this.dao.findLogin(user);
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}
}
