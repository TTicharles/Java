package Test.action;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Test.dao.RecordDao;
import Test.info.PageBean;
import Test.info.Record;
import Test.jdbc.DatabaseConnection;
public class RecordDaoImpl implements RecordDao{
			//记录查询实现类RecordDaoImpl
	public PageBean<Record> findByPage(int page_num){
		int page_size=3;
			//初始化当前页面记录数3
		int count=0;
			//总记录数为0
		try {
			java.sql.Connection conn=new DatabaseConnection().getConnection();
			PreparedStatement stmt=conn.prepareStatement("select count(*) from record");
			ResultSet rSet=stmt.executeQuery();
			while(rSet.next()){
				count=Integer.parseInt(rSet.getString("count(*)"));
			}
			rSet.close();
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PageBean<Record> pageBean=new PageBean<Record>();
			//新建泛型对象，数据类型为Record，并调用相关方法
		pageBean.setCount(count);
		pageBean.setPage_num(page_num);
		pageBean.setPage_size(page_size);
		
		List<Record> list=new ArrayList<Record>();
		try {
			java.sql.Connection connection=new DatabaseConnection().getConnection();
			PreparedStatement stmtPreparedStatement=connection.prepareStatement("select * from record limit"+(page_num-1)*page_size+","+page_size);
			ResultSet rs=stmtPreparedStatement.executeQuery();
			while(rs.next()){
				Record record=new Record();
				//新建Record类对象，并将从数据库获取的内容通过set方法设置为该对象，最后通过add()添加到记录集合Record中去
				record.setEmtitle(rs.getString("emtitle"));
				record.setTime(rs.getString("time"));
				list.add(record);
			}
			connection.close();
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		pageBean.setBealist(list);
		return pageBean;
	}
}
