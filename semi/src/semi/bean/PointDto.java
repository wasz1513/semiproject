package semi.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PointDto {
	private int point_no;
	private int point_save;
	private String point_save_date;
	private String point_save_details;
	private int point_use;
	private String point_use_date;
	private String point_use_details;
	
	public int getPoint_no() {
		return point_no;
	}
	public void setPoint_no(int point_no) {
		this.point_no = point_no;
	}
	public int getPoint_save() {
		return point_save;
	}
	public void setPoint_save(int point_save) {
		this.point_save = point_save;
	}
	public String getPoint_save_date() {
		return point_save_date;
	}
	public void setPoint_save_date(String point_save_date) {
		this.point_save_date = point_save_date;
	}
	public String getPoint_save_details() {
		return point_save_details;
	}
	public void setPoint_save_details(String point_save_details) {
		this.point_save_details = point_save_details;
	}
	public int getPoint_use() {
		return point_use;
	}
	public void setPoint_use(int point_use) {
		this.point_use = point_use;
	}
	public String getPoint_use_date() {
		return point_use_date;
	}
	public void setPoint_use_date(String point_use_date) {
		this.point_use_date = point_use_date;
	}
	public String getPoint_use_details() {
		return point_use_details;
	}
	public void setPoint_use_details(String point_use_details) {
		this.point_use_details = point_use_details;
	}
	// 시간 변환 - 가입일자
	public String getPoint_use_dateWithFormat() throws ParseException {
		if (point_use_date == null) {
			return "";
		} else {
			SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
			Date date = read.parse(point_use_date);
			
			SimpleDateFormat write = new SimpleDateFormat("y. M. d, H:m");
			String time = write.format(date);

			return time;
		}
	}
	public String getPoint_save_dateWithFormat() throws ParseException {
		if (point_save_date == null) {
			return "";
		} else {
			SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
			Date date = read.parse(point_save_date);
			
			SimpleDateFormat write = new SimpleDateFormat("y. M. d, H:m");
			String time = write.format(date);

			return time;
		}
	}

}
