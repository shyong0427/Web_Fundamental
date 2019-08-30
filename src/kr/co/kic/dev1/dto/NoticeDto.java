package kr.co.kic.dev1.dto;

public class NoticeDto {
	private int num;
	private String writer, title, content, regdate;

	public NoticeDto(int num, String writer, String title, String content, String regdate) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}

	public NoticeDto(int num, String writer, String title, String regdate) {
		// TODO Auto-generated constructor stub
		// 위에서 사용한 것을 재사용한다.
		this(num, writer, title, null, regdate);
		// 위에 생성된 생성자를 다시 선언하여서 사용하는 것으로 완벽하지 않다.
//		this.num = num;
//		this.writer = writer;
//		this.title = title;
//		this.regdate = regdate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
