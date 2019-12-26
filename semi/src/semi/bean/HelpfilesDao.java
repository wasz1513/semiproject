package semi.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class HelpfilesDao {
	private static DataSource source;
	static {
		try {
			InitialContext ctx = new InitialContext();
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	//저장
	public Connection getConnection() throws Exception {
		return source.getConnection();
	}

	
	public void edit(HelpfilesDto dto)throws Exception{
		Connection con = this.getConnection();
		String sql = "insert into help_files values(help_files_seq.nextval,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getOrigin());
		ps.setString(2, dto.getUploadname());
		ps.setString(3, dto.getSavename());
		ps.setString(4, dto.getFiletype());
		ps.setLong(5, dto.getFilesize());
		ps.execute();
		con.close();
		
	}
	
	
	//매개변수 : 
	//메소드 기능 :파일 단일 조회
	//반환자 : 
	public HelpfilesDto filesInfo(int board_no) throws Exception{
		Connection con = this.getConnection();
		String sql = "select * from help_files where help_files_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, board_no);
		
		ResultSet rs = ps.executeQuery();
		HelpfilesDto dto = null;
		if(rs.next()) {
			dto = new HelpfilesDto();
			dto.setHelp_files_no(rs.getInt("help_files_no"));
			dto.setOrigin(rs.getInt("origin"));
			dto.setUploadname(rs.getString("uploadname"));
			dto.setSavename(rs.getString("savename"));
			dto.setFiletype(rs.getString("filetype"));
			dto.setFilesize(rs.getLong("filesize"));
		}
		con.close();
		return dto;	
	}
	
	public List<HelpfilesDto> getList(int origin) throws Exception{
		Connection con = this.getConnection();
		String sql = "select * from help_files where origin=? order by help_files_board_no";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, origin);
		ResultSet rs = ps.executeQuery();
		List<HelpfilesDto> list = new ArrayList<>();
		while(rs.next()) {
			HelpfilesDto dto = new HelpfilesDto();
			dto.setHelp_files_no(rs.getInt("help_files_no"));
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
	
	public int getfilesNo(int board_no) throws Exception{
		Connection con = this.getConnection();
		String sql = "select help_files_no from help_files where origin=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, board_no);
		ResultSet rs = ps.executeQuery();
		
		int help_files_no;
		if(rs.next()) {
			help_files_no = rs.getInt(1);
		}else {
			help_files_no=0;
		}		
		con.close();
		return help_files_no;
	}
}


