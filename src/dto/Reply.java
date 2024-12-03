package dto;

public class Reply {
	int id;
	int ref;
	String writer;
	String writerId;
	String date;
	String content;
	public Reply() {

	}
	public Reply(int id, int ref, String writer, String writerId, String date, String content) {
		super();
		this.id = id;
		this.ref = ref;
		this.writer = writer;
		this.writerId = writerId;
		this.date = date;
		this.content = content;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
