package semi.bean;

public class GoodsDto {

	private int no;
	private String title;
	private String category;
	private String content;
	private String state;
	private int price;
	private int readcount;
	private int replycount;
	private String writetime;
	private String customer_id;
	
	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public GoodsDto() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getReplycount() {
		return replycount;
	}

	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}

	public String getWritetime() {
		return writetime;
	}

	public void setWritetime(String writetime) {
		this.writetime = writetime;
	}

	public GoodsDto(int no, String title, String category, String content, String state, int price, int readcount,
			int replycount, String writetime, String customer_id) {
		super();
		this.no = no;
		this.title = title;
		this.category = category;
		this.content = content;
		this.state = state;
		this.price = price;
		this.readcount = readcount;
		this.replycount = replycount;
		this.writetime = writetime;
		this.customer_id = customer_id;
	}

	@Override
	public String toString() {
		return "GoodsDto [no=" + no + ", title=" + title + ", category=" + category + ", content=" + content
				+ ", state=" + state + ", price=" + price + ", readcount=" + readcount + ", replycount=" + replycount
				+ ", writetime=" + writetime + "]";
	}
	
}
