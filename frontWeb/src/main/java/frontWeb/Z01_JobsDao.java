package frontWeb;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import frontWeb.vo.Jobs;

public class Z01_JobsDao {
		
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
		public Jobs getJobs() {
			Jobs jobs = null;
			Scanner sc = new Scanner(System.in);
			System.out.print("검색할 jobsId를 입력하세요: ");
			String jobsId = sc.nextLine();
			String sql = "select * from jobs01 where job_id like '%'||'"+ jobsId +"'||'%'";
			System.out.println(sql);
			try {
				conn = DB2.conn();
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()) {
					// 행 단위 이동 커서
					// 열 단위 호출 rs.get데이터유형("컬럼명");
					jobs = new Jobs(
							// select * 의 순서대로 컬럼, 순서를 사용
							rs.getString("job_id"),
							rs.getString("job_title"),
							rs.getInt("min_salary"),
							rs.getInt("max_salary")
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
			return jobs;
		}
		public static void main(String[] args) {
			Z01_JobsDao dao = new Z01_JobsDao();
			Jobs j = dao.getJobs();
			System.out.println(j.getJobId() +"\t" + j.getJobTitle() + "\t" + j.getMinSal() +"\t" + j.getMaxSal());
	}

}
