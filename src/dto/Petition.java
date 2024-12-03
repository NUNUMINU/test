package dto;

public class Petition {
	private int id;
	private int agree;
	private int isAns;
	private String writer;
	private String writerId;
	private String problem;
	private String solution;
	private String effect;
	private String date;
	private String title;
	private String category;
	
	
	public Petition() {
		
	}


	public Petition(int id, int agree,int isAns, String writer, String writerId, String problem, String solution, String effect,
			String date, String title, String category) {
		super();
		this.id = id;
		this.agree = agree;
		this.isAns = isAns;
		this.writer = writer;
		this.writerId = writerId;
		this.problem = problem;
		this.solution = solution;
		this.effect = effect;
		this.date = date;
		this.title = title;
		this.category = category;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getAgree() {
		return agree;
	}


	public void setAgree(int agree) {
		this.agree = agree;
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


	public String getProblem() {
		return problem;
	}


	public void setProblem(String problem) {
		this.problem = problem;
	}


	public String getSolution() {
		return solution;
	}


	public void setSolution(String solution) {
		this.solution = solution;
	}


	public String getEffect() {
		return effect;
	}


	public void setEffect(String effect) {
		this.effect = effect;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}

	public int getisAns() {
		return isAns;
	}
}
