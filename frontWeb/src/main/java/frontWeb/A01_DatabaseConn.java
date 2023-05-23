package frontWeb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class A01_DatabaseConn {
	private static Connection conn;
	public static void setConn() throws SQLException {
		// 1. jdbc 드라이버를 메모리에 로딩하는 메서드
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("class error");
			System.out.println(e.getMessage());
		}
		// 2. 메모리 로딩된 내용을 연결객체로 연결처리
		String info ="jdbc:oracle:thin:@localhost:1521:xe";	// 특정 서버 정보
		conn = DriverManager.getConnection(info,"scott","tiger");
		System.out.println("접속 성공");
	}
	// DB.java라는 클래스로 연동 처리하게 설정하셍
	public static void main(String[] args) {
		try {
			setConn();
			A01_DB.setConn();
		} catch (SQLException e) {
			System.out.println("SQL 예외 발생: " +e.getMessage());
		}
	}
}
