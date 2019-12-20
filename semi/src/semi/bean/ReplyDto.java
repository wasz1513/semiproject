package semi.bean;

public class ReplyDto {
	private int no,origin;
	private String content,writer,wdate;
	public ReplyDto() {
		super();
	}
	public ReplyDto(int no, int origin, String content, String writer, String wdate) {
		super();
		this.no = no;
		this.origin = origin;
		this.content = content;
		this.writer = writer;
		this.wdate = wdate;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getOrigin() {
		return origin;
	}
	public void setOrigin(int origin) {
		this.origin = origin;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	
	
	
}
