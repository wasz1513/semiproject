package semi.bean;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class GoodsFilesDao {
	
	private static DataSource source;
	static {
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
//등록
public void edit(GoodsFilesDto dto )throws Exception{
	Connection con = this.getConnection();
	String sql = "insert into goods_files values(goods_files_seq.nextval,?,?,?,?,?)";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, dto.getOrigin());
	ps.setString(2, dto.getUploadname());
	ps.setString(3, dto.getSavename());
	ps.setString(4, dto.getFiletype());
	ps.setLong(5, dto.getFilesize());
	ps.execute();
	con.close();
}
public List<GoodsFilesDto> getList(int origin) throws Exception{
	Connection con = this.getConnection();
	String sql = "select * from goods_files where origin=? order by goods_files_no";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, origin);
	ResultSet rs = ps.executeQuery();
	List<GoodsFilesDto> list = new ArrayList<>();
	while(rs.next()) {
		GoodsFilesDto dto = new GoodsFilesDto();
		
		dto.setGoods_files_no(rs.getInt("goods_files_no"));
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
public GoodsFilesDto filesInfo(int no) throws Exception{
	Connection con = this.getConnection();
	String sql = "select * from goods_files where goods_files_no=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, no);
	ResultSet rs = ps.executeQuery();
	GoodsFilesDto dto = null;
	if(rs.next()) {
		dto = new GoodsFilesDto();
		dto.setGoods_files_no(rs.getInt("goods_files_no"));
		dto.setOrigin(rs.getInt("origin"));
		dto.setUploadname(rs.getString("uploadname"));
		dto.setSavename(rs.getString("savename"));
		dto.setFiletype(rs.getString("filetype"));
		dto.setFilesize(rs.getLong("filesize"));
	}
con.close();
return dto;
	
}
public void update(GoodsFilesDto dto) throws Exception{
	Connection con = this.getConnection();
	String sql = "update Goods_files set uploadname=?, savename=?, filetype=?, filesize=? where origin=?";
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