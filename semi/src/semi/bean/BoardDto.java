package semi.bean;

	public class BoardDto{
	
	
	private int no;
	private String head;
	private String title;
	private int replycount;
	private String wdate;
	private int readcount;
	private String content;
	private int writer;
	
	public BoardDto(int no, String head, String title, int replycount, String wdate, int readcount, String content,
			int writer) {
		super();
		this.no = no;
		this.head = head;
		this.title = title;
		this.replycount = replycount;
		this.wdate = wdate;
		this.readcount = readcount;
		this.content = content;
		this.writer = writer;
	}

	public BoardDto() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getReplycount() {
		return replycount;
	}

	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getWriter() {
		return writer;
	}

	public void setWriter(int writer) {
		this.writer = writer;
	}
	}
	