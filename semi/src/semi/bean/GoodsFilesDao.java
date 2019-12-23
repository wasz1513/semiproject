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
public void insert(GoodsFilesDto gfdto )throws Exception{
	Connection con = this.getConnection();
	String sql = "insert into goods_files values(goods_files_seq.nextval,?,?,?,?,?)";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, gfdto.getOrigin());
	ps.setString(2, gfdto.getUploadname());
	ps.setString(3, gfdto.getSavename());
	ps.setString(4, gfdto.getFiletype());
	ps.setLong(5, gfdto.getFilesize());
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
		GoodsFilesDto gfdto = new GoodsFilesDto();
		gfdto.setGoods_files_no(rs.getInt("goods_files_no"));
		gfdto.setOrigin(rs.getInt("origin"));
		gfdto.setUploadname(rs.getString("uploadname"));
		gfdto.setSavename(rs.getString("savename"));
		gfdto.setFiletype(rs.getString("filetype"));
		gfdto.setFilesize(rs.getLong("filesize"));
		list.add(gfdto);
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
	
	GoodsFilesDto gfdto = null;
	if(rs.next()) {
		gfdto = new GoodsFilesDto();
		gfdto = new GoodsFilesDto();
		gfdto.setGoods_files_no(rs.getInt("goods_files_no"));
		gfdto.setOrigin(rs.getInt("origin"));
		gfdto.setUploadname(rs.getString("uploadname"));
		gfdto.setSavename(rs.getString("savename"));
		gfdto.setFiletype(rs.getString("filetype"));
		gfdto.setFilesize(rs.getLong("filesize"));
	}
con.close();
return gfdto;
	
}
public void update(GoodsFilesDto gfdto) throws Exception{
	Connection con = this.getConnection();
	String sql = "update Goods_files set uploadname=?, savename=?, filetype=?, filesize=? where origin=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, gfdto.getUploadname());
	ps.setString(2, gfdto.getSavename());
	ps.setString(3, gfdto.getFiletype());
	ps.setLong(4, gfdto.getFilesize());
	ps.setInt(5, gfdto.getOrigin());
	ps.execute();
	con.close();
}

public int get(int origin) throws Exception{
	Connection con = this.getConnection();
	String sql = "select * from goods_files where origin=? order by goods_files_no"; 
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, origin);
	ResultSet rs = ps.executeQuery();
	int customer_file_no;
	if(rs.next()) {
		customer_file_no = rs.getInt(1);
	}else {
		customer_file_no = 0;
	}
	con.close();
	return customer_file_no;
}

}