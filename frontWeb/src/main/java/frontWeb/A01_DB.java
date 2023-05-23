package frontWeb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class A01_DB {
	
	// 자원 연결
	public static Connection setConn() throws SQLException {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");		
					// 클래스를 호출해주는 역할. jdbc에 있는 클래스들을 메모리에 올려야함
		} catch (ClassNotFoundException e) {
			System.out.println("db 연동 실패");
			System.out.println(e.getMessage());
		}
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		conn = DriverManager.getConnection(info,"scott","tiger");
		// jdbc 드라이버의 클래스 중 메모리에 로딩된 특정한 객체를
		// DriverManager가 접속 정보를 매개변수로 그 계정과 비밀번호를 받아서 특정 서버에 접속하고,
		// 그 접속한 객체를 호출하는 곳에 리턴 처리
		System.out.println("접속 성공!");
		return conn;
	}
	
	// 자원해제
	public static void close(ResultSet rs, Statement stmt, Connection conn) {
		// 해제 전에 발생한 예외를 처리
		try {
			if(rs!=null)
				rs.close();
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
	}
	public static void main(String[] args) {
		try {
			setConn();
		} catch (SQLException e) {
			System.out.println("접속실패: " + e.getMessage());
		}
	}

}
