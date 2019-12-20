package semi.bean;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDao {
	private static DataSource source;
	static {
		try {
			Context ctx = new InitialContext();
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		}
		catch(NamingException e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws Exception{
		return source.getConnection();
	}
	
	//목록
	public List<BoardDto> getList() throws Exception{
		Connection con = getConnection();
				
		String sql = "select * from board order by no";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
						
			BoardDto dto = new BoardDto();
			dto.setNo(rs.getInt("no"));
			dto.setHead(rs.getString("head"));
			dto.setTitle(rs.getString("title"));
			dto.setReplycount(rs.getInt("replycount"));
			dto.setWdate(rs.getString("wdate"));
			dto.setReadcount(rs.getInt("readcount"));
			dto.setContent(rs.getString("content"));
			dto.setWriter(rs.getInt("writer"));
			list.add(dto);
		}
		con.close();
		return list;
		
	}

	//검색
	public List<BoardDto> search(String type, String keyword, int start, int finish) throws Exception{
		Connection con = getConnection();
		
		String sql = "select * from board order by board_no";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto dto = new BoardDto();
			list.add(dto);
		}
		con.close();
		return list;
		
	}

	//등록
	public void write(BoardDto dto) throws Exception{
		Connection con = getConnection();
		
		String sql = "insert into board"
							+ "(no, head, title,content,writer,readcount,replycount,wdate) "
							+ "values(?, ?, ?, ?, ?, 0,0,'20191216')";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getNo());
		ps.setString(2, dto.getHead());
		ps.setString(3, dto.getTitle());
		ps.setString(4, dto.getContent());
		ps.setInt(5, dto.getWriter());
		
		
		ps.execute();
		
		con.close();
	}
//단일조회
	public BoardDto get(int no) throws Exception{
		Connection con = getConnection();
		
		
		String sql = "select * from board where no = ?";
						
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		ResultSet rs = ps.executeQuery();
		
		BoardDto dto;
		if(rs.next()) {
		   int no2 =rs.getInt("no");
		   String head = rs.getString("head");
		   String title = rs.getString("title");
		   int replycount = rs.getInt("replycount");
		   String wdate = rs.getString("wdate");
		   int readcount = rs.getInt("readcount");
		   String content = rs.getString("content");
		   int writer = rs.getInt("writer");
		  			
			dto = new BoardDto(
					no2, head, title, replycount, wdate, 
					readcount, content, writer);
		}
		else {
			dto = null;
		}
		
		con.close();
		return dto;
		   
		}

	


	//수정
	public void boardEdit(BoardDto dto) throws Exception{
		Connection con = getConnection();
		
		String sql = "update board set head=?, title=?, content=? where no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getHead());
		ps.setString(2, dto.getTitle());
		ps.setString(3, dto.getContent());
		ps.setInt(4, dto.getNo());
		
		ps.execute();
		
		con.close();
	}

// 시퀀스 생성명령
	public int getSequence() throws Exception{
		Connection con = getConnection();
		
		String sql = "select board_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		
		int seq = rs.getInt(1);
		con.close();
		
		return seq;
  }

 //삭제
public void delete(int no)throws Exception{
 Connection con = getConnection();
 
 String sql = "delete board where no=?";
 PreparedStatement ps = con.prepareStatement(sql);
 ps.setInt(1, no);
 ps.execute();
 
 con.close();
}

//검색
public List<BoardDto> search(String type,String keyword) throws Exception{
	Connection con = getConnection();
	
	String sql = "select*from board "
			+ "where"+type+"like ? order by no desc";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, keyword);
	ResultSet rs = ps.executeQuery();
	
	//변환
    List<BoardDto> list = new ArrayList<>();
    
    while(rs.next()) {
    	int no = rs.getInt("no");
    	String head = rs.getString("head");
    	String title = rs.getString("title");
    	int replycount = rs.getInt("replycount");
    	String wdate = rs.getString("wdate");
    	int readcount = rs.getInt("readcount");
	   	String content = rs.getString("content");
    	int writer = rs.getInt("writer");
    	
    	BoardDto dto = new BoardDto(no,head,title,replycount,wdate,readcount,content,writer);
    	list.add(dto);
    }
	
	con.close();
	return list;
}

//조회수 증가
 public void cu(int no) throws Exception{
	Connection con = getConnection();
	
	String sql = "update board set readcount = readcount + 1 where no = ?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1,no);
	ps.execute();
	
	con.close();
 }

	
}



