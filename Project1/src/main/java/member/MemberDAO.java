package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

	//멤버변수 설정
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	
	//데이터베이스 연결 메서드 정의
	// 예외처리는 Exception 메서드를 호출하는 곳에서 하기 위해 throws 사용 
	
	public Connection getConnection() throws Exception{
		// Database Connection Pool : 미리 서버에서 연결하고 연결정보를 저장
		//					 필요할때 연결자원의 이름을 불러서 사용
		// 수정 1회 최소화, 
		
		//  context.xml 불러오기 위해 객체생성  import javax.naming.Context;
		Context init=new InitialContext();
		// 자원이름 찾아서 불러오기 javax.sql.DataSource
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		// 디비연결
		con=ds.getConnection();
		return con;
	}
	
	
	// 예외 상관없이 마무리 작업(sql 작업이 끝나면 기억장소 정리)
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
	
	
	// 회원가입 - insertMember 메서드 정의, 변수는 MemberDTO mDTO
	public void insertMember(MemberDTO mDTO) {
		try {
			// 드라이버 불러오기, 데이터베이스 연결
			con=getConnection();
			
			// sql 구문
			String sql="insert into member(id,pass,name,date,email,address,phone,mobile) values(?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mDTO.getId());
			pstmt.setString(2, mDTO.getPass());
			pstmt.setString(3, mDTO.getName());
			pstmt.setTimestamp(4, mDTO.getDate());
			pstmt.setString(5, mDTO.getEmail());
			pstmt.setString(6, mDTO.getAddress());
			pstmt.setString(7, mDTO.getPhone());
			pstmt.setString(8, mDTO.getMobile());
			
			//실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	
}
