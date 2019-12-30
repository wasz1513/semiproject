package semi.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardDto{
	
	private int no, rn;
	private String head;
	private String title;
	private int replycount;
	private String wdate;
	private int readcount;
	private String content;
	private String writer;
	
	public BoardDto(int rn, int no, String head, String title, int replycount, String wdate, int readcount, String content,
			String writer) {
		super();
		this.rn=rn;
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




	public int getRn() {
		return rn;
	}



	public void setRn(int rn) {
		this.rn = rn;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getWdateWithFormat() throws ParseException {
		if (wdate == null) {
			return "";
		} else {
			SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
			Date date = read.parse(wdate);
			
			SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일");
			String time = write.format(date);

			return time;
		}

	}
	
}
	