package frontWeb;

import java.sql.*;
import java.util.Date;
import java.util.Scanner;

import frontWeb.vo.ShMember;

public class A05_MemberDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 로그인 처리 메서드 정의
	public ShMember login(String id, String pw) {
		ShMember mem = null;
		String sql = "select * from member02 where id= ? and pw =?";
		try {
			conn = DB2.conn();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mem = new ShMember(
					rs.getString("id"),
					rs.getString ("pw"), 
					rs.getString ("name"), 
					rs.getInt ("point"), 
					rs.getString ("auth"), 
					rs.getDate ("regdate")
				);
			}
			
			conn.commit();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			System.out.println("DB 예외: " + e.getMessage());
			try {
				conn.rollback();
			} catch (SQLException e1) {
				System.out.println("rollback 예외: " + e.getMessage());
			}
		}catch(Exception e) {
			System.out.println("기타 예외: " + e.getMessage());
		}finally {
			DB2.close(rs, pstmt, conn);
		}
		return mem;
	}
	
	public void insertMember(ShMember mem) {
		int isInsert = 0;
		String sql = "insert into member02 values(?,?,?,?,?,sysdate)";
		try {
			conn = DB2.conn();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mem.getId());
			pstmt.setString(2, mem.getPw());
			pstmt.setString(3, mem.getName());
			pstmt.setInt(4, mem.getPoint());
			pstmt.setString(5, mem.getAuth());
			isInsert = pstmt.executeUpdate();
			if (isInsert == 1) System.out.println("회원가입 완료!");
			
			conn.commit();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			System.out.println("db에러: " +e.getMessage());
			try {
				conn.rollback();
			} catch (SQLException e1) {
				System.out.println("rollback예외: " + e.getMessage());
			}
		}catch (Exception e) {
			System.out.println("기타에러: " +e.getMessage());
		}finally {
			DB2.close(rs, pstmt, conn);
		}
	}
	
	public static void main(String[] args) {

		A05_MemberDao dao = new A05_MemberDao();
		ShMember mem = new ShMember("higirl", "8888","홍리나",1000,"관리자");
		dao.insertMember(mem);
		
		
//		Scanner sc = new Scanner(System.in);
//		while(true) {
//			System.out.println("# 로그인 #");
//			System.out.print("아이디 입력: ");
//			String id = sc.nextLine();
//			System.out.print("패스워드 입력: ");
//			String pw = sc.nextLine();
//			ShMember shmem  = dao.login(id, pw);
//			if(shmem!= null) {
//				System.out.println("로그인 성공!");
//				System.out.println(shmem.getName()+"님 환영합니다.");
//				break;
//			}else {
//				System.out.println("로그인 실패");
//				System.out.println(id + "는 인증된 계정이 아닙니다.");
//				System.out.print("계속 하시겠습니까? Y/N ");
//				String isYN = sc.nextLine();
//				if(!isYN.equals("Y") || !isYN.equals("y")) {
//					break;
//				}
//				
//			}
//		}
//		System.out.println("로그인 프로그램 종료!");
	}

}
