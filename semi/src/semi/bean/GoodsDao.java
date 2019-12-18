package semi.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



class GoodsDao {
private Connection getcConnection() throws Exception {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection(
			"jdbc:orecle:thin:@localhost:1521:xe","kh23","kh23");
	return con;
}
//상품 등록 기능
public void write(GoodsDto dto) throws Exception{
	Connection con =this.getcConnection();
	
	
	String sql="insert into goods (no,category,title,content,price)"
			+"value(?,?,?,?,?)";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1,dto.getNo());
	ps.setString(2,dto.getCategory());
	ps.setString(3,dto.getTitle());
	ps.setString(4,dto.getContent());
	ps.setInt(5,dto.getPrice());

	ps.execute();
	con.close();
			
}

//시퀀스 생성명령
//public int getSequence() throws Exception {
//	Connection con =getcConnection();
//	
//	String sqlString ="select goods_seq.nextval from dual";
//	PreparedStatement ps = con.prepareStatement(sql);
//	ResultSet rs =ps.executeQuery();
//	rs.next();
//	int seq = rs.getInt(1);
//	con.close();
//	return seq;
//}


//단일 조회
public GoodsDto get(int no)throws Exception{
	Connection con= getcConnection();
	
	String sql ="select *from where no=? ";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1,no);
	ResultSet rs = ps.executeQuery();
	
	GoodsDto dto;
	if(rs.next()) {
		dto =new GoodsDto();
	}
	else {
		dto =null; 
	}
			con.close();
			return dto;
}
//조회수 증가
public void readcountupdate() throws Exception{
	Connection con = getcConnection();
		
		String sql ="update goods set readcount = readcount+1 where no = ?";
	PreparedStatement ps = con.prepareStatement(sql);
//	ps.setInt(1,no);
	ps.execute();
	
	con.close();
}


}
