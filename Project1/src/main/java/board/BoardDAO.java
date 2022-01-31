package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	//멤버변수 
		private Connection con=null;
		private PreparedStatement pstmt=null;
		private ResultSet rs=null;
		
		public Connection getConnection() throws Exception{
			
			
			//  context.xml 불러오기 위해 객체생성  import javax.naming.Context;
			Context init=new InitialContext();
			// 자원이름 찾아서 불러오기 javax.sql.DataSource
			DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
			// 디비연결
			con=ds.getConnection();
			return con;

		}
		
		
		// 예외 상관없이 마무리 작업(insert작업이 끝나면 기억장소 정리) =>메서드 정의
		public void dbClose() {
			if(rs!=null) {
				try {
					rs.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		
		
		// 글 최대 번호 구하는 메서드
		public int getMaxnum() {
			int num = 0;
			
			try {
				con=getConnection();
				
				String sql = "select max(num) from board";
				pstmt=con.prepareStatement(sql);
				
				rs=pstmt.executeQuery();
				
				//데이터베이스에 있는 최대 num값 가져오기
				if(rs.next()) {
					num=rs.getInt("max(num)");			
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbClose();
			}
			
			return num;
		}
		
		
		//글 작성
		public void insertBoard(BoardDTO bDTO) {
			try {
				con=getConnection();
				
				String sql="insert into board(num, name, pass, subject, content, readcount, date) values(?,?,?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, bDTO.getNum());
				pstmt.setString(2, bDTO.getName());
				pstmt.setString(3, bDTO.getPass());
				pstmt.setString(4, bDTO.getSubject());
				pstmt.setString(5, bDTO.getContent());
				pstmt.setInt(6, bDTO.getReadcount());
				pstmt.setTimestamp(7, bDTO.getDate());
								
				
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbClose();
			}
		}
		
		
		//글 목록
		public List getBoardList(int startRow, int pageSize) {
					
			List boardList = new ArrayList();
			try {
				con=getConnection();
				
				//최근글이 제일 위에 보이게 가져오기 : num 기준으로 내림차순
				//String sql="select * from board order by num desc limit startRow-1, pageSize";
				//limit a,b : 시작점 a부터 b개 가져오기
				String sql = "select * from board order by num desc limit ?,?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startRow-1);
				pstmt.setInt(2, pageSize);
				
				rs=pstmt.executeQuery();
				
				//행접근=>데이터 있으면 BoardDTO 객체생성 열접근 => 멤버변수에 저장
				//BoardDTO 주소를 배열 한칸에 저장
				while(rs.next()) {
					//다음행 데이터 있으면 true => 열접근 => BoardDTO 멤버변수 저장
					BoardDTO bDTO = new BoardDTO();
					bDTO.setNum(rs.getInt("num"));
					bDTO.setPass(rs.getString("pass"));
					bDTO.setName(rs.getString("name"));
					bDTO.setSubject(rs.getString("subject"));
					bDTO.setContent(rs.getString("content"));
					bDTO.setReadcount(rs.getInt("readcount"));
					bDTO.setDate(rs.getTimestamp("date"));
					
					//배열한칸에 순서대로 저장
					//BoardDTO형을 모든형(Object)으로 잠시 변경해서 저장 => 업캐스팅
					boardList.add(bDTO);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbClose();
			}
			return boardList;
		}
		
		
		//글 내용 불러오기
		public BoardDTO getBoard(int num) {
			BoardDTO bDTO = null;
			try {
				con=getConnection();
				
				String sql = "select * from board where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					bDTO = new BoardDTO();
					bDTO.setNum(rs.getInt("num"));
					bDTO.setName(rs.getString("name"));
					bDTO.setPass(rs.getString("pass"));
					bDTO.setSubject(rs.getString("subject"));
					bDTO.setContent(rs.getString("content"));
					bDTO.setReadcount(rs.getInt("readcount"));
					bDTO.setDate(rs.getTimestamp("date"));
					
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbClose();
			}
			return bDTO;
		}
		
		
		//조회수
		public void updateReadcount(int num) {
			try {
				con = getConnection();
				
				String sql = "update board set readcount=readcount+1 where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				pstmt.executeUpdate();
						
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbClose();
			}
		}
		
		
		//글번호, 비밀번호 체크하는 메서드
		public BoardDTO numCheck(int num, String pass) {
			BoardDTO bDTO=null;
			try {
				
				con=getConnection();
				
				String sql = "select * from board where num=? and pass=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, pass);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					bDTO = new BoardDTO();
					bDTO.setNum(rs.getInt("num"));
					bDTO.setName(rs.getString("name"));
					bDTO.setPass(rs.getString("pass"));
					bDTO.setSubject(rs.getString("subject"));
					bDTO.setContent(rs.getString("content"));
					bDTO.setReadcount(rs.getInt("readcount"));
					bDTO.setDate(rs.getTimestamp("date"));
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbClose();
			}
			
			return bDTO;
		}
		
		
		//글 수정
		public void updateBoard(BoardDTO updateDTO) {
			try {
				con=getConnection();
				
				String sql = "update board set subject=?, content=? where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, updateDTO.getSubject());
				pstmt.setString(2, updateDTO.getContent());
				pstmt.setInt(3, updateDTO.getNum());
				
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
}
