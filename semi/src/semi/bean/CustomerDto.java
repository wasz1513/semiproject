package semi.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CustomerDto {
	private int customer_no;
	private String customer_name;
	private String customer_birth;
	private String customer_nickname;
	private String customer_id;
	private String customer_pw;
	private String customer_phone;
	private String customer_email;
	private String customer_post;
	private String customer_basic_address;
	private String customer_extra_address;
	private String customer_grade;
	private String customer_joindate;
	private String customer_lastlogin;
	private int customer_point;
	private String keyword_first;
	private String keyword_second;
	private String keyword_third;
	private String keyword_fourth;
	private String keyword_fifth;
	
	
	
	

	public CustomerDto(int customer_no, String customer_name, String customer_birth, String customer_nickname,
			String customer_id, String customer_pw, String customer_phone, String customer_email, String customer_post,
			String customer_basic_address, String customer_extra_address, String customer_grade,
			String customer_joindate, String customer_lastlogin, int customer_point, String keyword_first,
			String keyword_second, String keyword_third, String keyword_fourth, String keyword_fifth) {
		super();
		this.customer_no = customer_no;
		this.customer_name = customer_name;
		this.customer_birth = customer_birth;
		this.customer_nickname = customer_nickname;
		this.customer_id = customer_id;
		this.customer_pw = customer_pw;
		this.customer_phone = customer_phone;
		this.customer_email = customer_email;
		this.customer_post = customer_post;
		this.customer_basic_address = customer_basic_address;
		this.customer_extra_address = customer_extra_address;
		this.customer_grade = customer_grade;
		this.customer_joindate = customer_joindate;
		this.customer_lastlogin = customer_lastlogin;
		this.customer_point = customer_point;
		this.keyword_first = keyword_first;
		this.keyword_second = keyword_second;
		this.keyword_third = keyword_third;
		this.keyword_fourth = keyword_fourth;
		this.keyword_fifth = keyword_fifth;
	}

	public String getKeyword_first() {
		return keyword_first;
	}

	public void setKeyword_first(String keyword_first) {
		this.keyword_first = keyword_first;
	}

	public String getKeyword_second() {
		return keyword_second;
	}

	public void setKeyword_second(String keyword_second) {
		this.keyword_second = keyword_second;
	}

	public String getKeyword_third() {
		return keyword_third;
	}

	public void setKeyword_third(String keyword_third) {
		this.keyword_third = keyword_third;
	}

	public String getKeyword_fourth() {
		return keyword_fourth;
	}

	public void setKeyword_fourth(String keyword_fourth) {
		this.keyword_fourth = keyword_fourth;
	}

	public String getKeyword_fifth() {
		return keyword_fifth;
	}

	public void setKeyword_fifth(String keyword_fifth) {
		this.keyword_fifth = keyword_fifth;
	}

	public int getCustomer_point() {
		return customer_point;
	}

	public void setCustomer_point(int customer_point) {
		this.customer_point = customer_point;
	}

	public CustomerDto() {
		super();
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getCustomer_birth() {
		return customer_birth;
	}

	public void setCustomer_birth(String customer_birth) {
		this.customer_birth = customer_birth;
	}

	public String getCustomer_nickname() {
		return customer_nickname;
	}

	public void setCustomer_nickname(String customer_nickname) {
		this.customer_nickname = customer_nickname;
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public String getCustomer_pw() {
		return customer_pw;
	}

	public void setCustomer_pw(String customer_pw) {
		this.customer_pw = customer_pw;
	}

	public String getCustomer_phone() {
		return customer_phone;
	}

	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}

	public String getCustomer_email() {
		return customer_email;
	}

	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}

	public String getCustomer_post() {
		return customer_post;
	}

	public String getPostStr() {
		if (customer_post == null)
			return "";
		else
			return customer_post;
	}

	public void setCustomer_post(String customer_post) {
		this.customer_post = customer_post;
	}

	public String getCustomer_basic_address() {
		return customer_basic_address;
	}

	public String getCustomer_basic_addressStr() {

		if (customer_basic_address == null)
			return "";
		else
			return customer_basic_address;
	}

	public void setCustomer_basic_address(String customer_basic_address) {
		this.customer_basic_address = customer_basic_address;
	}

	public String getCustomer_extra_address() {
		return customer_extra_address;
	}

	public String getCustomer_extra_addressStr() {

		if (customer_extra_address == null)
			return " ";
		else
			return customer_extra_address;
	}

	public void setCustomer_extra_address(String customer_extra_address) {
		this.customer_extra_address = customer_extra_address;
	}

	public String getCustomer_grade() {
		return customer_grade;
	}

	public void setCustomer_grade(String customer_grade) {
		this.customer_grade = customer_grade;
	}

	public String getCustomer_joindate() {
		return customer_joindate;
	}

	public void setCustomer_joindate(String customer_joindate) {
		this.customer_joindate = customer_joindate;
	}

	public String getCustomer_lastlogin() {
		return customer_lastlogin;
	}

	public void setCustomer_lastlogin(String customer_lastlogin) {
		this.customer_lastlogin = customer_lastlogin;
	}

	// 주소통합
	public String getCustomer_address() {
		
		if (customer_post != null && customer_basic_address != null && customer_extra_address != null) {
			return "[" + customer_post + "] " + customer_basic_address + " " + customer_extra_address;
		} 
		else if(customer_post != null && customer_basic_address != null) {
			return "[" + customer_post + "] " + customer_basic_address + " ";
		}
		else {
			return "";
		}
	}

	// 시간 변환 - 가입일자
	public String getCustomer_joindateWithFormat() throws ParseException {
		if (customer_joindate == null) {
			return "";
		} else {
			SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
			Date date = read.parse(customer_joindate);
			
			SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일 H시 m분");
			String time = write.format(date);

			return time;
		}

	}

	// 시간 변환 - 최종로그인
	public String getCustomer_lastloginWithFormat() throws ParseException {
		if (customer_lastlogin == null) {
			return "";
		} else {
			SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
			Date date = read.parse(customer_lastlogin);

			SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일 H시 m분");
			String time = write.format(date);

			return time;
		}
	}

}
