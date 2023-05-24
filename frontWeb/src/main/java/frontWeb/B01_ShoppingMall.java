package frontWeb;

import java.sql.*;
import java.util.Scanner;

import frontWeb.vo.ShMember;

public class B01_ShoppingMall {
	private A05_MemberDao dao;
	public B01_ShoppingMall() {
		dao = new A05_MemberDao();
	}
	
	public void loginMenu() {
		Scanner sc = new Scanner(System.in);
		System.out.println("# 로그인 #");
		while(true) {
			System.out.print("아이디 입력: ");
			String id = sc.nextLine();
			System.out.print("패스워드 입력: ");
			String pw = sc.nextLine();
			ShMember shmem  = dao.login(id, pw);
			if(shmem!= null) {
				System.out.println("로그인 성공!");
				System.out.println(shmem.getName()+"님 환영합니다.");
				break;
			}else {
				System.out.println("로그인 실패");
				System.out.println(id + "는 인증된 계정이 아닙니다.");
				System.out.print("계속 하시겠습니까? Y/N ");
				String isYN = sc.nextLine();
				if(!isYN.equals("Y") || !isYN.equals("y")) {
					break;
				}
			}
		}
			System.out.println("로그인 프로그램 종료!");
	}
	
	public void join() {
		Scanner sc = new Scanner(System.in);
	}
	public void loginMenu(String id, String pw) {
		B01_ShoppingMall b = new B01_ShoppingMall();
		b.loginMenu();
	}

}
