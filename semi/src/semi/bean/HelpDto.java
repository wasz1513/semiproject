package semi.bean;

public class HelpDto {
	
	private int board_NO,rn;
	private String head,reply,write,content,hdate;
	private int no;
	private int origin;
	private String writer;
	private String reply_hdate;
	private String reply_content;
	
	
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getReply_hdate() {
		return reply_hdate;
	}

	public void setReply_hdate(String reply_hdate) {
		this.reply_hdate = reply_hdate;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public HelpDto(int board_NO, int rn, String head, String reply, String write, String content, String hdate) {
		super();
		this.board_NO = board_NO;
		this.rn = rn;
		this.head = head;
		this.reply = reply;
		this.write = write;
		this.content = content;
		this.hdate = hdate;
	}
	
	public HelpDto() {
		super();
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public HelpDto(int board_NO, String head, String reply, String write, String content, String hdate) {
		super();
		this.board_NO = board_NO;
		this.head = head;
		this.reply = reply;
		this.write = write;
		this.content = content;
		this.hdate = hdate;
	}
	public int getBoard_NO() {
		return board_NO;
	}
	public void setBoard_NO(int board_NO) {
		this.board_NO = board_NO;
	}
	public String getHead() {
		if(head == null) {
			return "문의";
		}else {
			return head;			
		}
	}
	public void setHead(String head) {
		this.head = head;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getWrite() {
		return write;
	}
	public void setWrite(String write) {
		this.write = write;
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
	
	
}