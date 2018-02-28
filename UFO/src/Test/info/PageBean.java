package Test.info;
import java.util.List;
public class PageBean<T> {
	private int count;
		//数据库总记录数
	private int page_num;
		//当前页码数
	private int page_size;
		//当前页面记录数
	private String url;
		//页面的路径
	private List<T> bealist;
		//以上数据的集合
	public int getTp(){
		//获取最大页数
		int tp=count/page_size;
		return count%page_size == 0 ? tp: tp+1;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPage_num() {
		return page_num;
	}
	public void setPage_num(int page_num) {
		this.page_num = page_num;
	}
	public int getPage_size() {
		return page_size;
	}
	public void setPage_size(int page_size) {
		this.page_size = page_size;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public List<T> getBealist() {
		return bealist;
	}
	public void setBealist(List<T> bealist) {
		this.bealist = bealist;
	}
}
