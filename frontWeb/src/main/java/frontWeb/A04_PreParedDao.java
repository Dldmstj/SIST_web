package frontWeb;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import frontWeb.vo.Department;
import frontWeb.vo.Employee;

/*
	 # DAO(Database Access Object)
	 1. 프로그램은 기능별 모듈 분리화 정책을 하여야 추후 확장성이 뛰어나고,
	 	다른 코드에 영향력이 적어, 유지보수가 효과적으로 이루어짐
	 2. 기능적인 다른 내용을 분리시켜서 사용하세요
	 	1) console 처리: 객체를 생성해 매개변수를 데이터로 받고, 리턴값으로 결과를 리턴처리
	 	2) 웹 화면 처리: 요청값을 데이터로 받아서, 리턴할 VO객체를 받아 화면에 출력한다.
	 	
 */
public class A04_PreParedDao {
	// 필드
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	/*
	 select * from Employees
	WHERE FIRST_NAME || LAST_NAME LIKE '%'||?||'%' AND SALARY BETWEEN ? AND ?; 
	 */
	public List<Employee> getEmpList(Map<String, String> sch){
		List<Employee> elist = new ArrayList<Employee>();
		String sql = "select * from Employees WHERE FIRST_NAME || LAST_NAME LIKE '%'||?||'%' AND SALARY BETWEEN ? AND ?";
		try {
			conn = DB2.conn();
			// 초기에 sql을 넘기면서 pstmt 객체 생성
			pstmt = conn.prepareStatement(sql);
			// pstmt.set데이터유형(순서-1부터, 입력할 데이터)
			pstmt.setString(1, sch.get("name"));	// name 	minSal 	maxSal
			pstmt.setDouble(2, Double.parseDouble(sch.get("minSal")));
			pstmt.setDouble(3, Double.parseDouble(sch.get("maxSal")));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				elist.add(new Employee(
						rs.getInt("employee_id"),
						rs.getString("first_name"),
						rs.getString("last_name"),
						rs.getString("email"),
						rs.getString("phone_number"),
						rs.getDate("hire_date"),
						rs.getString("job_id"),
						rs.getDouble("salary"),
						rs.getDouble("commition_pct"),
						rs.getInt("manager_id"),
						rs.getInt("department_id")
						));
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		}catch(SQLException e) {
			System.out.println("DB에러: " + e.getMessage());
		}catch(Exception e) {
			System.out.println("기타예외: " + e.getMessage());
		}finally {
			DB2.close(rs, pstmt, conn);
		}
		return elist;
	}
	
	public List<Department> getDepartList(Map<String, String> sch){
		List<Department> dlist = new ArrayList<Department>();
		String sql = "SELECT * FROM JOB_HISTORY WHERE JOB_ID LIKE '%'||?||'%' "
					+ "AND DEPARTMENT_ID BETWEEN ? AND ?";
		try {
			conn = DB2.conn();
			// 초기에 sql을 넘기면서 pstmt 객체 생성
			pstmt = conn.prepareStatement(sql);
			// pstmt.set데이터유형(순서-1부터, 입력할 데이터)
			pstmt.setString(1, sch.get("job_id"));	// name 	minSal 	maxSal
			pstmt.setInt(2, Integer.parseInt(sch.get("min")));
			pstmt.setInt(3, Integer.parseInt(sch.get("max")));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dlist.add(new Department(
						rs.getInt("employee_id"),
						rs.getDate("start_date"),
						rs.getDate("end_date"),
						rs.getString("job_id"),
						rs.getInt("department_id")
						));
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		}catch(SQLException e) {
			System.out.println("DB에러: " + e.getMessage());
		}catch(Exception e) {
			System.out.println("기타예외: " + e.getMessage());
		}finally {
			DB2.close(rs, pstmt, conn);
		}
		
		return dlist;
	}
	
	
	public static void main(String[] args) {
		A04_PreParedDao dao = new A04_PreParedDao();
		Map<String, String> emp = new HashMap<String, String>();
		//  name 	minSal 	maxSal
		emp.put("name","A");
		emp.put("minSal","0");
		emp.put("maxSal","12000");
		
		for(Employee e: dao.getEmpList(emp)) {
			
			System.out.println(e.getEmployee_id()+"\t");
			System.out.println(e.getFirst_name()+"\t");
			System.out.println(e.getLast_name()+"\t");
			System.out.println(e.getEmail()+"\t");
			System.out.println(e.getPhone_number()+"\t");
			System.out.println(e.getHire_date()+"\t");
			System.out.println(e.getJob_id()+"\t");
			System.out.println(e.getSalary()+"\t");
			System.out.println(e.getCommition_pct()+"\t");
			System.out.println(e.getDepartment_id()+"\n");
		}
		
		Map<String, String> dpm = new HashMap<String, String>();
		dpm.put("job_id", "IT_PROG");
		dpm.put("min", "10");
		dpm.put("max", "120");
		
		for(Department d: dao.getDepartList(dpm)) {
			System.out.print(d.getEmployee_id()+"\t");
			System.out.print(d.getStart_date()+"\t");
			System.out.print(d.getEnd_date()+"\t");
			System.out.print(d.getJob_id()+"\t");
			System.out.print(d.getDepartment_id()+"\n");
		}
		
	}

}