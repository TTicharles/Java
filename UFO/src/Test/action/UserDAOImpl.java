package Test.action;
import java.sql.*;
import Test.dao.IUserDAO;
import Test.info.User;;
public class UserDAOImpl implements IUserDAO{
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	public UserDAOImpl(Connection conn){
		this.conn=conn;
	}
	public boolean findLogin(User user) throws Exception{
		boolean flag=false;
		try {
			String sql="select username from user_info where user_id=? and password=?";
			this.pstmt=this.conn.prepareStatement(sql);
			this.pstmt.setString(1, user.getUser_id());
			this.pstmt.setString(2, user.getPassword());
			ResultSet rs=this.pstmt.executeQuery();
			if(rs.next()){
				user.setUsername(rs.getString(1));
				flag=true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}finally{
			if(this.pstmt!=null){
				try {
					this.pstmt.close();
				} catch (Exception e) {
					// TODO: handle exception
					throw e;
				}
			}
		}
		return flag;
	}
}
