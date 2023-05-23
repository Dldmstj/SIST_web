package frontWeb;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import frontWeb.vo.Emp;

public class A02_EmpDao {
	// 1. 필드 선언
	// 	1) 연결
	private Connection conn;
	//	2) 대화 - 명령/입력
	private Statement stmt;
	//	3) 결과 - 데이터를 가져오는 것
	private ResultSet rs;
	
	// 2. 기능 메서드 선언
	//		1) 사원 전체 정보 출력
	public void empListAll() {
//		# 전체적으로 예외처리
		// 연결
		try {
		conn = A01_DB.setConn();
		// 대화할 내용
		String sql = "SELECT * FROM EMP01";
		// 대화할 수 있는 객체는 연결(conn)에 의해 생성
		stmt = conn.createStatement();
		// 결과 (resultSet)
		rs = stmt.executeQuery(sql);
		int row = 1;
		while(rs.next()) {	// 행 단위로 이동. 다음 행이 없을 때까지
			System.out.print("행번호: " + row++ + " / ");
			System.out.print(rs.getInt("empno") + " / ");
			System.out.print(rs.getString("ename") + " / ");
			System.out.print(rs.getInt("mgr") + " / ");
			System.out.print(rs.getDouble("sal") + " \n ");
			// ex) 사원명과 관리자번호, 급여 호출
		}
		/*
		 	rs.next() : 반복을 통해서 행단위로 커서를 위치시키는
		 		while(rs.next()){
		 			System.out.println(cnt++)
		 		}
		 	rs.get데이터유형("컬럼명")
		 */
		rs.close();
		stmt.close();
		conn.close();
		
		}catch(SQLException e) {
			System.out.println("DB 처리 ㅇㅖ외: " + e.getMessage());
		}catch(Exception e) {
			System.out.println("공통 예외: " + e.getMessage());
		}finally {
			// 해제 전에 발생한 예외 처리
			A01_DB.close(rs,stmt,conn);
			}
	}
	
	public void paramEmp(String ename ) {
		String sql = "SELECT * FROM emp02 WHERE ename LIKE '%'||'"+ename+"'||'%'";
		try {
			// 1. 연결(예외처리)
			conn = DB2.conn();
			// 2. 대화
			stmt = conn.createStatement();
			// 3. 결과
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				// 행 단위 이동 커서
				// 열 단위 호출 rs.get데이터유형("컬럼명");
				System.out.print(rs.getString("empno")+"\t");
				System.out.print(rs.getString("ename")+"\t");
				System.out.print(rs.getDouble("sal")+"\n");
			}
			// 4. 자원해제
			DB2.close(rs, stmt, conn);
		} catch (SQLException e) {
			System.out.println("일반예외: " + e.getMessage());
		}finally {
			DB2.close(rs, stmt, conn);
		}
	}
	
	// 입력값을 부서번호, 리턴값은 해당 부서의 사원 수
	public int getDeptCount() {
		Scanner sc = new Scanner(System.in);
		System.out.print("검색할 부서 번호를 입력하세요: ");
		int deptno = sc.nextInt();
		int count = 0;
		String sql = "SELECT COUNT(*) cnt FROM emp02 where deptno =" +deptno;
		try {
			conn = DB2.conn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {count = rs.getInt("cnt"); }
			rs.close();
			stmt.close();
			conn.close();
			// 데이터가 한 개만 나오는 경우(row단위)
		} catch (SQLException e) {
			System.out.println("db예외 발생:" + e.getMessage());
		} finally {
			DB2.close(rs, stmt, conn);
		}
		return count;
		
	}
	
	// 사원 번호의 급여를 리턴하는 메서드
	public int getSal() {
	Scanner sc = new Scanner(System.in);
	System.out.print("검색할 사원 번호를 입력하세요: ");
	int empno = sc.nextInt();
	int sal = 0;
	String sql = "SELECT sal FROM emp02 where empno =" +empno;
	try {
		conn = DB2.conn();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		if(rs.next()) {sal = rs.getInt("sal"); }
		rs.close();
		stmt.close();
		conn.close();
		// 데이터가 한 개만 나오는 경우(row단위)
	} catch (SQLException e) {
		System.out.println("db예외 발생:" + e.getMessage());
	} finally {
		DB2.close(rs, stmt, conn);
	}
	return sal;
}
	
	public Emp getEmp() {
		Emp emp = null;
		Scanner sc = new Scanner(System.in);
		System.out.print("검색할 사원 번호를 입력하세요: ");
		int empno = sc.nextInt();
//		int sal = 0;
		String sql = "SELECT * FROM emp WHERE EMPNO = " + empno;
//		String sql = "SELECT sal FROM emp02 where empno =" +empno;
		try {
			conn = DB2.conn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) { // 한 번만 호출해도 됨
				//empno 키
				emp = new Emp(
						// select * 의 순서대로 컬럼, 순서를 사용
						rs.getInt("empno"),
						rs.getString("ename"),
						rs.getString("job"),
						rs.getInt(4),
						rs.getDate("hiredate"),
						rs.getDouble("sal"),
						rs.getDouble("comm"),
						rs.getInt(8)
						);
			}
			rs.close();
			stmt.close();
			conn.close();
			// 데이터가 한 개만 나오는 경우(row단위)
		} catch (SQLException e) {
			System.out.println("db예외 발생:" + e.getMessage());
		} finally {
			DB2.close(rs, stmt, conn);
		}
		return emp;
	}
	
	public List<Emp> getEmpList(Emp sch){
		List<Emp> elist = new ArrayList<Emp>();
		String sql = "select * from emp02 where job like '%'||'"+ sch.getEname()+"'||'%' and ename like '%'||'"+sch.getJob()+"'||'%";
		try {
			conn = DB2.conn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) { // 한 번만 호출해도 됨
				//empno 키
				Emp emp = new Emp(
						// select * 의 순서대로 컬럼, 순서를 사용
						rs.getInt("empno"),
						rs.getString("ename"),
						rs.getString("job"),
						rs.getInt(4),
						rs.getDate("hiredate"),
						rs.getDouble("sal"),
						rs.getDouble("comm"),
						rs.getInt(8)
						);
				elist.add(emp);
			}
			rs.close();
			stmt.close();
			conn.close();
			// 데이터가 한 개만 나오는 경우(row단위)
		} catch (SQLException e) {
			System.out.println("db예외 발생:" + e.getMessage());
		} finally {
			DB2.close(rs, stmt, conn);
		}
		return elist;
	}

	public static void main(String[] args) {
		A02_EmpDao dao = new A02_EmpDao();
//		dao.getEmpList(null);
		

		
//		dao.empListAll();
//		System.out.println("10번 부서 사원 건수: " + dao.getDeptCount());
//		System.out.println("급여: " + dao.getSal());
		Emp e = dao.getEmp();
//		System.out.println(dao.getEmp());
		System.out.print(e.getEmpno() + "\t");
		System.out.print(e.getEname() + "\t");
		System.out.print(e.getMgr() + "\t");
		System.out.print(e.getJob() + "\t");
		System.out.print(e.getHiredate() + "\t");
		System.out.print(e.getDeptno() + "\n");
	}
}
