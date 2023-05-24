package frontWeb.vo;

import java.util.Date;

public class ShMember {
	private String id;
 	private String pw;
 	private String name;
 	private int point;
 	private String auth;
 	private Date regdate;
 	
 	public ShMember() {}
 	
	public ShMember(String id, String pw, String name, int point, String auth) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.point = point;
		this.auth = auth;
	}

	public ShMember(String id, String pw, String name, int point, String auth, Date regdate) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.point = point;
		this.auth = auth;
		this.regdate = regdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
 	
 	
}
