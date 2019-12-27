package semi.bean;

public class GoodsDto {

	private int rn;
	private int goods_no;
	private String goods_title;
	private String goods_category;
	private String goods_content;
	private String goods_state;
	private int goods_price;
	private int goods_readcount;
	private int goods_replycount;
	private String goods_writetime;
	private String customer_id;
	private String customer_basic_address;
	private int customer_no;
	

	public int getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}
	public String getCustomer_basic_address() {
		return customer_basic_address;
	}
	public void setCustomer_basic_address(String customer_basic_address) {
		this.customer_basic_address = customer_basic_address;
	}
	public GoodsDto(int rn, int goods_no, String goods_title, String goods_category, String goods_content,
			String goods_state, int goods_price, int goods_readcount, int goods_replycount, String goods_writetime,
			String customer_id) {
		super();
		this.rn = rn;
		this.goods_no = goods_no;
		this.goods_title = goods_title;
		this.goods_category = goods_category;
		this.goods_content = goods_content;
		this.goods_state = goods_state;
		this.goods_price = goods_price;
		this.goods_readcount = goods_readcount;
		this.goods_replycount = goods_replycount;
		this.goods_writetime = goods_writetime;
		this.customer_id = customer_id;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public GoodsDto() {
		super();
	}
	public int getGoods_no() {
		return goods_no;
	}
	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}
	public String getGoods_title() {
		return goods_title;
	}
	public void setGoods_title(String goods_title) {
		this.goods_title = goods_title;
	}
	public String getGoods_category() {
		return goods_category;
	}
	public void setGoods_category(String goods_category) {
		this.goods_category = goods_category;
	}
	public String getGoods_content() {
		return goods_content;
	}
	public void setGoods_content(String goods_content) {
		this.goods_content = goods_content;
	}
	public String getGoods_state() {
		return goods_state;
	}
	public void setGoods_state(String goods_state) {
		this.goods_state = goods_state;
	}
	public int getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}
	public int getGoods_readcount() {
		return goods_readcount;
	}
	public void setGoods_readcount(int goods_readcount) {
		this.goods_readcount = goods_readcount;
	}
	public int getGoods_replycount() {
		return goods_replycount;
	}
	public void setGoods_replycount(int goods_replycount) {
		this.goods_replycount = goods_replycount;
	}
	public String getGoods_writetime() {
		return goods_writetime;
	}
	public void setGoods_writetime(String goods_writetime) {
		this.goods_writetime = goods_writetime;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public GoodsDto(int goods_no, String goods_title, String goods_category, String goods_content, String goods_state,
			int goods_price, int goods_readcount, int goods_replycount, String goods_writetime, String customer_id) {
		super();
		this.goods_no = goods_no;
		this.goods_title = goods_title;
		this.goods_category = goods_category;
		this.goods_content = goods_content;
		this.goods_state = goods_state;
		this.goods_price = goods_price;
		this.goods_readcount = goods_readcount;
		this.goods_replycount = goods_replycount;
		this.goods_writetime = goods_writetime;
		this.customer_id = customer_id;
	}
	@Override
	public String toString() {
		return "GoodsDto [goods_no=" + goods_no + ", goods_title=" + goods_title + ", goods_category=" + goods_category
				+ ", goods_content=" + goods_content + ", goods_state=" + goods_state + ", goods_price=" + goods_price
				+ ", goods_readcount=" + goods_readcount + ", goods_replycount=" + goods_replycount
				+ ", goods_writetime=" + goods_writetime + ", customer_id=" + customer_id + "]";
	}
	
	
}
