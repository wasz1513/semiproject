package semi.bean;

public class HelpReplyDto {
	private int no, origin, start, finish;
	private String content, hdate, writer;

	public HelpReplyDto(int no, int origin, int start, int finish, String content, String hdate, String writer) {
		super();
		this.no = no;
		this.origin = origin;
		this.start = start;
		this.finish = finish;
		this.content = content;
		this.hdate = hdate;
		this.writer = writer;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getFinish() {
		return finish;
	}

	public void setFinish(int finish) {
		this.finish = finish;
	}

	public HelpReplyDto() {
		super();
	}

	public HelpReplyDto(int no, int origin, String content, String hdate, String writer) {
		super();
		this.no = no;
		this.content = content;
		this.hdate = hdate;
		this.writer = writer;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getOrigin() {
		return origin;
	}

	public void setOrigin(int origin) {
		this.origin = origin;
	}
}
