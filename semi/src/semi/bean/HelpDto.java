package semi.bean;

public class HelpDto {
	
	private int board_NO,write;
	private String head,reply,content,hdate;
	public HelpDto() {
		super();
	}
	public HelpDto(int board_NO, int write, String head, String reply, String content, String hdate) {
		super();
		this.board_NO = board_NO;
		this.write = write;
		this.head = head;
		this.reply = reply;
		this.content = content;
		this.hdate = hdate;
	}
	public int getBoard_NO() {
		return board_NO;
	}
	public void setBoard_NO(int board_NO) {
		this.board_NO = board_NO;
	}
	public int getWrite() {
		return write;
	}
	public void setWrite(int write) {
		this.write = write;
	}
	public String getHead() {
		return head;
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