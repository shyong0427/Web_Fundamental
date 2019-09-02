package kr.co.kic.dev1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.kic.dev1.dto.EmpDto;
import kr.co.kic.dev1.util.ConnLocator;

public class EmpDao {
	private static EmpDao single;

	private EmpDao() {
	}

	public static EmpDao getInstance() {
		if (single == null) {
			single = new EmpDao();
		}

		return single;
	}
	
	public boolean insert(EmpDto obj) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("INSERT INTO EMP(empno, ename, job, mgr, hiredate, sal, comm, deptno) ");
			sql.append("VALUES (null, ?, ?, ?, SYSDATE(), ?, ?, ?) ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(index++, obj.getName());
			pstmt.setString(index++, obj.getPosition());
			pstmt.setInt(index++, obj.getManager());
			pstmt.setInt(index++, obj.getSal());
			pstmt.setInt(index++, obj.getComm());
			pstmt.setInt(index++, obj.getDeptno());
			pstmt.executeUpdate();
			
			isSuccess = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		return isSuccess;
	}
	
	public boolean update(EmpDto obj) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("UPDATE emp ");
			sql.append("SET ename = ?, job = ?, mgr = ?, hiredate = SYSDATE(), sal = ?, comm = ?, deptno= ? ");
			sql.append("WHERE empno = ? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(index++, obj.getName());
			pstmt.setString(index++, obj.getPosition());
			pstmt.setInt(index++, obj.getManager());
			pstmt.setInt(index++, obj.getSal());
			pstmt.setInt(index++, obj.getComm());
			pstmt.setInt(index++, obj.getDeptno());
			pstmt.setInt(index++, obj.getNum());
			pstmt.executeUpdate();
			
			isSuccess = true;			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		return isSuccess;
	}
	
	public boolean delete(int num) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("DELETE FROM emp ");
			sql.append("WHERE empno = ? ");
			
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setInt(index++, num);
			pstmt.executeUpdate();			
			
			isSuccess = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		return isSuccess;
	}
	
	public EmpDto select(int num) {
		EmpDto obj = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("SELECT empno, ename, job, mgr, DATE_FORMAT(hiredate, '%Y/%m/%d') ");
			sql.append("FROM emp ");
			sql.append("WHERE empno = ? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(index++, num);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				index = 1;
				int _num = rs.getInt(index++);
				String name = rs.getString(index++);
				String position = rs.getString(index++);
				int manager = rs.getInt(index++);
				String hiredate = rs.getString(index++);
				
				obj = new EmpDto(_num, name, position, manager, hiredate);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		return obj;
	}
	
	public ArrayList<EmpDto> select(int start, int length) {
		ArrayList<EmpDto> list = new ArrayList<EmpDto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("SELECT empno, ename, job, mgr, DATE_FORMAT(hiredate, '%Y/%m/%d') ");
			sql.append("FROM emp ");
			sql.append("ORDER BY empno ASC ");
			sql.append("LIMIT ?, ? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(index++, start);
			pstmt.setInt(index++, length);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				index = 1;
				int num = rs.getInt(index++);
				String name = rs.getString(index++);
				String position = rs.getString(index++);
				int manager = rs.getInt(index++);
				String hiredate = rs.getString(index++);
				
				list.add(new EmpDto(num, name, position, manager, hiredate));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		return list;
	}
}
