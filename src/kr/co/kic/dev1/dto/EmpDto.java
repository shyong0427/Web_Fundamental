package kr.co.kic.dev1.dto;

public class EmpDto {
	private int num, manager, sal, comm, deptno;
	private String name, position, hiredate;

	public EmpDto(int num, String name, String position, int manager,  String hiredate, int sal, int comm, int deptno) {
		super();
		this.num = num;
		this.name = name;
		this.position = position;
		this.manager = manager;
		this.hiredate = hiredate;
		this.sal = sal;
		this.comm = comm;
		this.deptno = deptno;
	}

	public EmpDto(int num, String name, String position, int manager, String hiredate) {
		this(num, name, position, manager, hiredate, 0, 0, 0);
	}
	
	public EmpDto(String name, String position, int manager, String hiredate, int sal, int comm, int deptno) {
		this(0, name, position, manager, hiredate, sal, comm, deptno);
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getManager() {
		return manager;
	}

	public void setManager(int manager) {
		this.manager = manager;
	}

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		this.sal = sal;
	}

	public int getComm() {
		return comm;
	}

	public void setComm(int comm) {
		this.comm = comm;
	}

	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getHiredate() {
		return hiredate;
	}

	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}
}