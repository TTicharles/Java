package Test.dao;
import Test.info.PageBean;
import Test.info.Record;
public interface RecordDao {
	//定义记录查询接口，待实现方法findByPage
	public PageBean<Record> findByPage(int page_num);
}
