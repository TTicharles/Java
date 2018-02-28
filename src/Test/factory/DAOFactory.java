package Test.factory;
import Test.dao.IUserDAO;
import Test.dao.UserDAOProxy;
public class DAOFactory {
	public static IUserDAO getIUserDAOInstance(){
		return new UserDAOProxy();
	}
}
