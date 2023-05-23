package frontWeb.vo;

public class Jobs {
	private String jobId;
	private String jobTitle;
	private int minSal;
	private int maxSal;
	
	public Jobs() {}
	
	public Jobs(String jobId, String jobTitle, int minSal, int maxSal) {
		super();
		this.jobId = jobId;
		this.jobTitle = jobTitle;
		this.minSal = minSal;
		this.maxSal = maxSal;
	}
	public String getJobId() {
		return jobId;
	}
	public void setJobId(String jobId) {
		this.jobId = jobId;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public int getMinSal() {
		return minSal;
	}
	public void setMinSal(int minSal) {
		this.minSal = minSal;
	}
	public int getMaxSal() {
		return maxSal;
	}
	public void setMaxSal(int maxSal) {
		this.maxSal = maxSal;
	}
	
	
}
