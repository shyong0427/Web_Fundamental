package kr.co.kic.dev1.member.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/member/join")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// request 객체를 사용하기 전에 코딩해야 한다. 파라미터 중 한글을 보내는 경우 반드시 코딩해야 한다.	
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		DataSource ds = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Context context = new InitialContext();
			// java:comp/env 고정
			// jdbc/kic -> context.xml의 name의 속성 값이다.
			ds = (DataSource)context.lookup("java:comp/env/jdbc/kic");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			// ds.getConnection()은 이미 생성된 Connection pool에 있는 Connection 객체를 가져온다.
			// 다시 말해서 Connection 객체를 생성하는 것이 아니라 이미 만들어진 Connectino 객체를 사용하는 것이다.
			con = ds.getConnection();
			System.out.println("성공");
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO member(m_id, m_email, m_pwd) ");
			sql.append("VALUES(?, ?, PASSWORD(?)) ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			pstmt.setString(3, password);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				// con객체를 종료하는 것이 아니라 Connection Pool에 Connection객체를 반납하는 것이다.
				if (con != null) con.close();
			} catch (SQLException e2) {
		}
		}
		response.sendRedirect("/member/join/success");
	}
}