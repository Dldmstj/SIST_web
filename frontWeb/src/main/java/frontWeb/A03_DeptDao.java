package frontWeb;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import frontWeb.vo.Dept;
import frontWeb.vo.Emp;

public class A03_DeptDao {
	// 부서정보 처리 dao
	// 1. 공통 필드 선언
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	public void showDeptList() {
		// 2. 연결(예외처리)
		try {
			
			conn = DB2.conn();
			// 3. 대화처리
			String sql = "select * from dept01";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int row = 1;
			while(rs.next()) {
				row++;
				System.out.print(rs.getInt("deptno") +"\t");
				System.out.print(rs.getString("dname") +"\t");
				System.out.print(rs.getString("loc") +"\n");
				
				rs.close();
				stmt.close();
				conn.close();
			}
		} catch (SQLException e) {
			System.out.println("DB 처리 예외: " + e.getMessage());
		} catch(Exception e) {
			System.out.println("공통 예외: " + e.getMessage());
		} finally {
			DB2.close(rs, stmt, conn);
		}
		
		// 4. 실행결과
		// 5. 자원해제
		
	}
	public Dept getDept() {
		Dept dept = null;
		Scanner sc = new Scanner(System.in);
		System.out.print("검색할 부서번호를 입력하세요: ");
		String deptno = sc.nextLine();
		String sql = "select * from dept01 where deptno like '%'||'"+ deptno +"'||'%'";
		try {
			conn = DB2.conn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				// 행 단위 이동 커서
				// 열 단위 호출 rs.get데이터유형("컬럼명");
				dept = new Dept(
						// select * 의 순서대로 컬럼, 순서를 사용
						rs.getInt("deptno"),
						rs.getString("dname"),
						rs.getString("loc")
						);
				
				rs.close();
				stmt.close();
				conn.close();
			}
		} catch (SQLException e) {
			System.out.println("db예외 발생:" + e.getMessage());
		} finally {
			DB2.close(rs, stmt, conn);
		}
		return dept;
	}
	
	public void paramDept() {
		Scanner sc = new Scanner(System.in);
		System.out.print("검색할 부서번호를 입력하세요: ");
		String deptno = sc.nextLine();
		Dept dept = null;
		String sql = "select * from dept01 where deptno like '%'||'"+ deptno +"'||'%'";
		try {
			conn = DB2.conn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				// 행 단위 이동 커서
				// 열 단위 호출 rs.get데이터유형("컬럼명");
				System.out.print(rs.getInt("deptno")+"\t");
				System.out.print(rs.getString("dname")+"\t");
				System.out.print(rs.getString("loc")+"\n");
				
				rs.close();
				stmt.close();
				conn.close();
			}
		} catch (SQLException e) {
			System.out.println("db예외 발생:" + e.getMessage());
		} finally {
			DB2.close(rs, stmt, conn);
		}
	}
	
	public static void main(String[] args) {
		A03_DeptDao dao = new A03_DeptDao();
//		dao.showDeptList();
//		dao.paramDept();
		Dept d = dao.getDept();
		System.out.print(d + "\t" + d.getDeptno() +"\t" + d.getDname() +"\t" + d.getLoc());
	}

}
