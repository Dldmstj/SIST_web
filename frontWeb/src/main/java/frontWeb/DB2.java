package frontWeb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/*
	 1. 이 클래스는 무엇을 위한 클래스인가
			// db연결과, 자원해제 예외처리를 위한 클래스(객체로 사용하기 위해서 정의)
			 
	 2. db연결을 위해서 필요로 하는 순서는 무엇인가?
	 		드라이버 호출
	 		드라이버를 통해서 연결처리(java.sql.*)
	 		Statement 대화객체 : 처리 결과를 받는 객체(data)
	 		ResultSet 결과객체 : 
	 
			클래스 드라이버 메모리 로딩 Class.forName()
			Connection 객체 만들기 : DriverManager.getConnection()
			Statement 객체 만들기 : Connection 객체의 createStatement()
			ResultSet 객체 만들기 : Statement객체의 executeQuery(sql)
			
	 3. jdbc는 어떤 역할을 하는 클래스이고, 이것을 실제 객체화를 위해서 어떤 처리를 하는가?
	 		jdbc(각 밴드-서버회사 driver 공통된 코드를 만들어 컴파일시 압축 전달)
	 		이 클래스가 객체화된 내용을 통해서 서버에 접속하는데, 서버에 접속할 핸들링 도구가(java.sql.*)
	 		
	 4. db연결에 필요한 정보는 무엇이고, 이것은 어떤 클래스에 의해서 처리되는가?
	 		서버의 접속 정보: 어떤 jdbc드라이버를 이용해서 특정한 위치 (lp-localhost),
	 		구분되는 port, db명(db식별자), 계정, 비밀번호
	 		ex) jdbc 드라이버를 로봇이라고 하면 java.sql.* 이 로봇을 작동하는 도구
	 		
	 5. db 처리를 위해 예외처리는 무엇을 해야되는가?
	 		작은 범위 : SQLException
	 			순수하게 java.sql.*  패키지 사용을 하기 위한 예외처리
	 		중간 범위 : Class.for("")
	 			jdbc 드라이버를 사용하는 예외처리
	 		큰 범위
	 			db처리 코드를 통해서 발생하는 모든 예외처리
*/
public class DB2 {
	// 연결객체 선언	
	public static Connection conn() throws SQLException {
		Connection conn = null;
		// 1. 메모리 로딩(ClassNotFoundException 처리)
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("jdbc드라이버 예외" + e.getMessage());
		}
		// 2. 연결 정보 처리(Connection) DB처리를 포함해서  그 외 예외를 처리하기 위해 예외를 위임한다.
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		conn = DriverManager.getConnection(info,"scott","tiger");
		System.out.println("연결 성공!");
		return conn;
	}
	
	//자원해제 예외처리
	public static void close(ResultSet rs, Statement stmt, Connection conn) {
		// rs.close(), stmt.close(), con.close()
		// api에 지원하는 안정적인 자원해제 방법
		// rs.close()에 의하거나, 다른 예외로 예외가 나왔을 때는 아래에 내용을 강제 자원해제 한다.
		// 남은 자원해제시 처리하는 부분
		if(rs!=null) rs = null;		
		if(stmt!=null) stmt = null;		
		if(conn!=null) conn = null;		// 강제로 null처리
		/* try {
				if(rs!=null)
						rs.close();	
					// 위 rs.close()가 없이
					// close()가 작동문제로 예외가 발생했을 때는
					// rs의 자원은 영원히 예외가 발생하지 않으면
				}catch (SQLException e) {
					System.out.println(e.getMessage());
				}
				try {
					if(stmt!=null)
						rs.close();
				}catch (SQLException e) {
					System.out.println(e.getMessage());
				}
				try {
					if(conn!=null)
						rs.close();
				}catch (SQLException e) {
					System.out.println(e.getMessage());
				}
				System.out.println("자원해제 완료!");
		 */
	}
	public static void main(String[] args) {
		try {
			conn();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(null,null,null);
		}
	}

}
