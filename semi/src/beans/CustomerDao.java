package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CustomerDao {
	
//	//DB 연결식
	private static DataSource source;
	static {
		try {
			InitialContext ctx = new InitialContext();
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public boolean login(CustomerDto dto) throws Exception{
		Connection con = getConnection();
		String sql = "select * from customer where customer_id=? and customer_pw=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getCustomer_id());
		ps.setString(2, dto.getCustomer_pw());
		ResultSet rs = ps.executeQuery();
		boolean result=rs.next();
		con.close();
		return result;
	}
	
	//getConnection
	public Connection getConnection() throws Exception{
		return source.getConnection();
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
	//회원 정보 변경(닉네임, 폰번호, post, 기본주소, 상세주소 / ID)
	public void updateCustomerInfo(CustomerDto dto) throws Exception{
		Connection con = getConnection();
		String sql = "update customer set customer_nickname=?,customer_phone=?,customer_email,customer_post=?,customer_basic_address=?,customer_extra_address=? where customer_id=?";
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
