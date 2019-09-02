package kr.co.kic.dev1.dto;

public class DeptDto {
	private int num;
	private String name, local;

	public DeptDto(int num, String name, String local) {
		super();
		this.num = num;
		this.name = name;
		this.local = local;
	}
	
	public DeptDto(String name, String local) {
		this(0, name, local);
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}
}