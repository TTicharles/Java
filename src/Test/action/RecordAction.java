package Test.action;
import Test.info.Record;
import Test.jdbc.DatabaseConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class RecordAction {
	public static String addRecord(String title,String emtitle,String content,String url,String time){
		try {
			java.sql.Connection conn=new DatabaseConnection().getConnection();
			PreparedStatement stmt=conn.prepareStatement("insert into record(title,emtitle,content,url,time) values (?,?,?,?,?)");
			stmt.setString(1, title);
			stmt.setString(2, emtitle);
			stmt.setString(3, content);
			stmt.setString(4, url);
			stmt.setString(5, time);
			stmt.executeUpdate();
			conn.close();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return "success";
	}
	public static Record getRecord(int id){
		Record record = null;
		try {
			java.sql.Connection conn = new DatabaseConnection().getConnection();
			PreparedStatement st = conn.prepareStatement("select * from record where id=?");
			st.setInt(1, id);
			st.execute();
			ResultSet rs = st.getResultSet();
			while (rs.next()) {
				record=new Record();
				record.setTitle(rs.getString("title"));
				record.setEmtitle(rs.getString("emtitle"));
				record.setContent(rs.getString("content"));
				record.setUrl(rs.getString("url"));
			}
			conn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return record;
	}
}
