package Test.action;
import Test.dao.RecordDao;
import Test.info.PageBean;
import Test.info.Record;
public class PageAction {
		//新建PageAction类，调用按页查询内容的方法
	RecordDao recordDao=new RecordDaoImpl();
	public PageBean<Record> findByPage(int page_num){
		try {
			return recordDao.findByPage(page_num);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
	}
}
