package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class CustomerDao {
	
//	//DB 연결식
//	private static DataSource source;
//	static {
//		try {
//			InitialContext ctx = new InitialContext();
//			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
//		}catch(NamingException e) {
//			e.printStackTrace();
//		}
//	}
//	
//	//getConnection
//	public Connection getConnection() throws Exception{
//		return source.getConnection();
//	}
	
	//구방식 getConnection()
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		return DriverManager.getConnection("jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh23", "kh23");
	}
	
	//회원 비밀번호 변경
	public void ChangePassword(CustomerDto dto) throws Exception{
		Connection con = getConnection();
		String sql = "update customer set customer_pw=? where customer_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getCustomer_pw());
		ps.setString(2, dto.getCustomer_id());
		ps.execute();
		con.close();
	}
	//회원 정보 변경(닉네임, 폰번호, post, 기본주소, 상세주소)
	public void updateCustomerInfo(CustomerDto dto) throws Exception{
		Connection con = getConnection();
		String sql = "update customer set customer_nickname=?,customer_phone=?,customer_post=?,customer_basic_address=?,customer_extra_address=? where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getCustomer_nickname());
		ps.setString(2, dto.getCustomer_phone());
		ps.setString(3, dto.getCustomer_post());
		ps.setString(4, dto.getCustomer_basic_address());
		ps.setString(5, dto.getCustomer_extra_address());
		ps.setString(6, dto.getCustomer_id());
		ps.execute();
		con.close();
	}
	//마지막 접속시간 변경
	public void updateLastLogin(int customer_no) throws Exception{
		Connection con = getConnection();
		String sql = "update customer set customer_lastlogin=sysdate where customer_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, customer_no);
		ps.execute();
		con.close();
	}
	//회원 탈퇴
	public void withdrawal(int customer_no) throws Exception{
		Connection con = getConnection();
		String sql = "delete from customer where customer_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, customer_no);
		ps.execute();
		con.close();
	}
}
