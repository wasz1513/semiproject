package semi.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PointDao {
	private static DataSource source;
	static {
		try {
			InitialContext ctx = new InitialContext();
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws Exception{
		return source.getConnection();
	}
	//필요한 기능

	
	
	//특정 회원의 포인트 적립
	public void savePoint(int point, String id, int customer) throws Exception{
		Connection con = getConnection();
		String sql="update customer set customer_point=customer_point+? where customer_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, point);
		ps.setString(2, id);
		ps.execute();
		String sql2="insert into point values(point_seq.nextval,?,sysdate,'구매적립금',0,null,null,?)";
		PreparedStatement ps2 = con.prepareStatement(sql2);
		ps2.setInt(1, point);
		ps2.setInt(2, customer);
		ps2.execute();
		
		con.close();	
	}
	//특정 회원의 포인트 사용
	public void usePoint(int point, String id, int customer) throws Exception{
		Connection con = getConnection();
		String sql="update customer set customer_point=customer_point-? where customer_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, point);
		ps.setString(2, id);
		ps.execute();
		String sql2="insert into point values(point_seq.nextval,0,null,null,?,sysdate,'포인트사용',?)";
		PreparedStatement ps2 = con.prepareStatement(sql2);
		ps2.setInt(1, point);
		ps2.setInt(2, customer);
		ps2.execute();
		
		con.close();	
	}
	//관리자 기능 : 전체 회원을 불러오면 알아서 
	
	//목록으로 불러오기(전체)
	public List<PointDto> getList() throws Exception{
		Connection con = getConnection();
		String sql="select * from point";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<PointDto> list = new ArrayList<>();
		while(rs.next()) {
			PointDto dto = new PointDto();
			dto.setPoint_no(rs.getInt("point_no"));
			dto.setPoint_save(rs.getInt("point_save"));
			dto.setPoint_save_date(rs.getString("point_save_date"));
			dto.setPoint_save_details(rs.getString("point_save_details"));
			dto.setPoint_use(rs.getInt("point_use"));
			dto.setPoint_use_date(rs.getString("point_use_date"));
			dto.setPoint_use_details(rs.getString("point_use_details"));
			list.add(dto);
		}	
		con.close();
		return list;
	}
	//특정 회원의 전체 포인드 히스토리
	public List<PointDto> get(int customer_no) throws Exception{
		Connection con = getConnection();
		String sql="select * from point where customer=?";//point table의 customer
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, customer_no);
		ResultSet rs = ps.executeQuery();
		List<PointDto> list = new ArrayList<>();
		while(rs.next()) {
			PointDto dto = new PointDto();
			dto.setPoint_no(rs.getInt("point_no"));
			dto.setPoint_save(rs.getInt("point_save"));
			dto.setPoint_save_date(rs.getString("point_save_date"));
			dto.setPoint_save_details(rs.getString("point_save_details"));
			dto.setPoint_use(rs.getInt("point_use"));
			dto.setPoint_use_date(rs.getString("point_use_date"));
			dto.setPoint_use_details(rs.getString("point_use_details"));
			list.add(dto);
		}	
		con.close();
		return list;
	}
}
