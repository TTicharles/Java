package Test.dao;
import Test.info.User;
public interface IUserDAO {
	public boolean findLogin(User user) throws Exception;
}
