package semi.bean;

public class HelpreplyDto {
	private int no;
	private String content,hdate,origin;
	public HelpreplyDto() {
		super();
	}
	public HelpreplyDto(int no, String content, String hdate, String origin) {
		super();
		this.no = no;
		this.content = content;
		this.hdate = hdate;
		this.origin = origin;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getHdate() {
		return hdate;
	}
	public void setHdate(String hdate) {
		this.hdate = hdate;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	
	
}