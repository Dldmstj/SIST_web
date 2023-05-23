package frontWeb;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import frontWeb.vo.Emp;
import frontWeb.vo.Locations;

public class Z02_LocationDao {

		private Connection conn;
		private Statement stmt;
		private ResultSet rs;
		
		public List<Locations> getLocList(Locations sch){
			List<Locations> loclist = new ArrayList<Locations>();
			
			String sql = "SELECT * FROM LOCATIONS WHERE LOCATION_ID LIKE '%'||'"
					+sch.getLocation_id()+"'||'%' AND CITY LIKE '%'||'"+sch.getCity()+"'||'%'";
			try {
				conn = DB2.conn();
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) { // 한 번만 호출해도 됨
					//empno 키
					Locations loc = new Locations(
							// select * 의 순서대로 컬럼, 순서를 사용
							rs.getInt("location_id"),
							rs.getString("street_address"),
							rs.getString("postal_code"),
							rs.getString("city"),
							rs.getString("state_province")
							);
					loclist.add(loc);
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
			return loclist;
		}
	public static void main(String[] args) {
		Z02_LocationDao dao = new Z02_LocationDao();
		Locations loc = new Locations(1200,"Tokyo");
		List<Locations> loclist = dao.getLocList(new Locations(1200,"Tokyo"));
		for(Locations l:loclist) {
			System.out.print(l.getLocation_id() +"\t");
			System.out.print(l.getState_province() +"\t");
			System.out.print(l.getStreet_address() +"\t");
			System.out.print(l.getPostal_code() +"\t");
			System.out.print(l.getCity() +"\n");
		}
	}
}
