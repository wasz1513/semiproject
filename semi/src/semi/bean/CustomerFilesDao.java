package semi.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CustomerFilesDao {

	private static DataSource source;
	static{
		try {
			InitialContext ctx = new InitialContext();
			source = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws Exception{
		return source.getConnection();
	}
	
	public void edit(CustomerFilesDto dto) throws Exception{
		Connection con = this.getConnection();
		String sql = "insert into customer_files values(customer_files_seq.nextval, ?, ?, ?, ? ,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getOrigin());
		ps.setString(2, dto.getUploadname());
		ps.setString(3, dto.getSavename());
		ps.setString(4, dto.getFiletype());
		ps.setLong(5, dto.getFilesize());
		ps.execute();
		con.close();
	}
	
	public List<CustomerFilesDto> getList(int origin) throws Exception{
		Connection con = this.getConnection();
		String sql = "select * from customer_files where origin=? order by customer_files_no";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, origin);
		ResultSet rs = ps.executeQuery();
		List<CustomerFilesDto> list = new ArrayList<>();
		while(rs.next()) {
			CustomerFilesDto dto = new CustomerFilesDto();
			dto.setCustomer_files_no(rs.getInt("customer_files_no"));
			dto.setOrigin(rs.getInt("origin"));
			dto.setUploadname(rs.getString("uploadname"));
			dto.setSavename(rs.getString("savename"));
			dto.setFiletype(rs.getString("filetype"));
			dto.setFilesize(rs.getLong("filesize"));
			list.add(dto);
		}
		con.close();
		return list;
	}
	
	public CustomerFilesDto filesInfo(int no) throws Exception{
		Connection con = this.getConnection();
		String sql = "select * from customer_files where customer_files_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		ResultSet rs = ps.executeQuery();
		CustomerFilesDto dto = null;
		if(rs.next()) {
			dto = new CustomerFilesDto();
			dto.setCustomer_files_no(rs.getInt("customer_files_no"));
			dto.setOrigin(rs.getInt("origin"));
			dto.setUploadname(rs.getString("uploadname"));
			dto.setSavename(rs.getString("savename"));
			dto.setFiletype(rs.getString("filetype"));
			dto.setFilesize(rs.getLong("filesize"));
		}
		con.close();
		return dto;
	}
	
	public void update(CustomerFilesDto dto) throws Exception{
		Connection con = this.getConnection();
		String sql = "update customer_files set uploadname=?, savename=?, filetype=?, filesize=? where origin=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getUploadname());
		ps.setString(2, dto.getSavename());
		ps.setString(3, dto.getFiletype());
		ps.setLong(4, dto.getFilesize());
		ps.setInt(5, dto.getOrigin());
		ps.execute();
		con.close();
	}
}
