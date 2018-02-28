package Test.jdbc;
import java.sql.Connection;
import java.sql.DriverManager;
public class DatabaseConnection {
	private static final String DriverName="com.mysql.jdbc.Driver";
	private static final String UrlName="jdbc:mysql://127.0.0.1:3306/model";
	private static final String DBname="root";
	private static final String DBpsword="123";
	private Connection conn=null;
	public DatabaseConnection() throws Exception {
		try {
			Class.forName(DriverName);
			this.conn=DriverManager.getConnection(UrlName, DBname, DBpsword);
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}
	public Connection getConnection(){
		return this.conn;
	}
	public void close() throws Exception{
		if(this.conn!=null){
			try{
				this.conn.close();
			}catch(Exception e){
				throw e;
			}
		}
	}
}
