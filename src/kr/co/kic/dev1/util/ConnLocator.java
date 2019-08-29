package kr.co.kic.dev1.util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnLocator {
	public static Connection getConnection() {
		DataSource ds = null;
		Connection con = null;
		
		try {
			Context context = new InitialContext();
			// java:comp/env 고정
			// jdbc/kic -> context.xml의 name의 속성 값이다.
			ds = (DataSource) context.lookup("java:comp/env/jdbc/kic");
			// ds.getConnection()은 이미 생성된 Connection pool에 있는 Connection 객체를 가져온다.
			// 다시 말해서 Connection 객체를 생성하는 것이 아니라 이미 만들어진 Connection 객체를 사용하는 것이다.
			con = ds.getConnection();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return con;
	}
}
