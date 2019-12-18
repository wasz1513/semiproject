package semi.bean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;

public class CustomerDao {

	private static DataSource source;
	static {
		try {
			InitialContext ctx = new InitialContext();
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public Connection getConnection() throws Exception {
		return source.getConnection();
	}

	// 로그인
	public boolean login(String customer_id, String customer_pw) throws Exception {
		Connection con = this.getConnection();

		String sql = "select * from customer where customer_id = ? and customer_pw=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, customer_id);
		ps.setString(2, customer_pw);
		ResultSet rs = ps.executeQuery();
		boolean result = rs.next();

		con.close();
		return result;
	}

	// getList 기능(모두 불러오기)
	public List<CustomerDto> getList(CustomerDto dto) throws Exception {
		Connection con = getConnection();
		String sql = "select * from customer where customer_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getCustomer_id());
		ResultSet rs = ps.executeQuery();

		List<CustomerDto> list = new ArrayList<>();
		while (rs.next()) {
			CustomerDto dto2 = new CustomerDto();
			dto2.setCustomer_no(rs.getInt("customer_no"));
			dto2.setCustomer_name(rs.getString("customer_name"));
			dto2.setCustomer_birth(rs.getString("customer_birth"));
			dto2.setCustomer_nickname(rs.getString("customer_nickname"));
			dto2.setCustomer_id(rs.getString("customer_id"));
			dto2.setCustomer_pw(rs.getString("customer_pw"));
			dto2.setCustomer_phone(rs.getString("customer_phone"));
			dto2.setCustomer_email(rs.getString("customer_email"));
			dto2.setCustomer_post(rs.getString("customer_post"));
			dto2.setCustomer_basic_address(rs.getString("customer_basic_address"));
			dto2.setCustomer_extra_address(rs.getString("customer_extra_address"));
			dto2.setCustomer_grade(rs.getString("customer_grade"));
			dto2.setCustomer_joindate(rs.getString("customer_joindate"));
			dto2.setCustomer_lastlogin(rs.getString("customer_lastlogin"));
			list.add(dto2);
		}

		con.close();
		return list;
	}

	// 회원 비밀번호 변경
	public void ChangePassword(CustomerDto dto) throws Exception {
		Connection con = getConnection();
		String sql = "update customer set customer_pw=? where customer_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getCustomer_pw());
		ps.setString(2, dto.getCustomer_id());
		ps.execute();
		con.close();
	}

	// 회원 정보 변경(닉네임, 폰번호, post, 기본주소, 상세주소 / ID)
	public void updateCustomerInfo(CustomerDto dto) throws Exception {
		Connection con = getConnection();
		String sql = "update customer set customer_nickname=?,customer_phone=?,customer_email=?,customer_post=?,customer_basic_address=?,customer_extra_address=? where customer_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getCustomer_nickname());
		ps.setString(2, dto.getCustomer_phone());
		ps.setString(3, dto.getCustomer_email());
		ps.setString(4, dto.getCustomer_post());
		ps.setString(5, dto.getCustomer_basic_address());
		ps.setString(6, dto.getCustomer_extra_address());
		ps.setString(7, dto.getCustomer_id());
		ps.execute();
		con.close();
	}

	// 회원 탈퇴
	public void withdrawal(int customer_no) throws Exception {
		Connection con = getConnection();
		String sql = "delete from customer where customer_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, customer_no);
		ps.execute();
		con.close();
	}

	// 회원가입
	public void regist(CustomerDto dto) throws Exception {
		Connection con = this.getConnection();

		String sql = "insert into customer values(customer_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,'오렌지',sysdate,sysdate)";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getCustomer_name());
		ps.setString(2, dto.getCustomer_birth());
		ps.setString(3, dto.getCustomer_nickname());
		ps.setString(4, dto.getCustomer_id());
		ps.setString(5, dto.getCustomer_pw());
		ps.setString(6, dto.getCustomer_phone());
		ps.setString(7, dto.getCustomer_email());
		ps.setString(8, dto.getCustomer_post());
		ps.setString(9, dto.getCustomer_basic_address());
		ps.setString(10, dto.getCustomer_extra_address());

		ps.execute();

		con.close();

	}

	// 단일조회
	public CustomerDto get(String customer_id) throws Exception {
		Connection con = getConnection();

		String sql = "select * from customer where customer_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, customer_id);
		ResultSet rs = ps.executeQuery();
		CustomerDto dto;

		if (rs.next()) {

			dto = new CustomerDto();

			dto.setCustomer_no(rs.getInt("customer_no"));
			dto.setCustomer_name(rs.getString("customer_name"));
			dto.setCustomer_birth(rs.getString("customer_birth"));
			dto.setCustomer_nickname(rs.getString("customer_nickname"));
			dto.setCustomer_id(rs.getString("customer_id"));
			dto.setCustomer_pw(rs.getString("customer_pw"));
			dto.setCustomer_phone(rs.getString("customer_phone"));
			dto.setCustomer_email(rs.getString("customer_email"));
			dto.setCustomer_post(rs.getString("customer_post"));
			dto.setCustomer_basic_address(rs.getString("customer_basic_address"));
			dto.setCustomer_extra_address(rs.getString("customer_extra_address"));
			dto.setCustomer_grade(rs.getString("customer_grade"));
			dto.setCustomer_joindate(rs.getString("customer_joindate"));
			dto.setCustomer_lastlogin(rs.getString("customer_lastlogin"));
		} else {
			dto = null;
		}
		con.close();

		return dto;
	}

	// 마지막 접속시간 변경
	public void updateLastLogin(String customer_id) throws Exception {
		Connection con = getConnection();
		String sql = "update customer set customer_lastlogin=sysdate where customer_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, customer_id);
		ps.execute();
		con.close();
	}

	// id찾기 기능
	public String find(String customer_name, String customer_phone) throws Exception {
		Connection con = this.getConnection();

		String sql = "select customer_id from customer where customer_name =? " + "and customer_phone=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, customer_name);
		ps.setString(2, customer_phone);
		ResultSet rs = ps.executeQuery();
		String customer_id = null;

		if (rs.next()) {
			customer_id = rs.getString("customer_id");
		}
		con.close();
		return customer_id;
	}

}
