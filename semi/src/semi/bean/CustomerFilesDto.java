package semi.bean;

public class CustomerFilesDto {
	private int Customer_files_no;
	private int origin;
	private String uploadname;
	private String savename;
	private String filetype;
	private long filesize;
	
	public CustomerFilesDto() {
		super();
	}

	public CustomerFilesDto(int customer_files_no, int origin, String uploadname, String savename, String filetype,
			long filesize) {
		super();
		Customer_files_no = customer_files_no;
		this.origin = origin;
		this.uploadname = uploadname;
		this.savename = savename;
		this.filetype = filetype;
		this.filesize = filesize;
	}

	public int getCustomer_files_no() {
		return Customer_files_no;
	}

	public void setCustomer_files_no(int customer_files_no) {
		Customer_files_no = customer_files_no;
	}

	public int getOrigin() {
		return origin;
	}

	public void setOrigin(int origin) {
		this.origin = origin;
	}

	public String getUploadname() {
		return uploadname;
	}

	public void setUploadname(String uploadname) {
		this.uploadname = uploadname;
	}

	public String getSavename() {
		return savename;
	}

	public void setSavename(String savename) {
		this.savename = savename;
	}

	public String getFiletype() {
		return filetype;
	}

	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}

	public long getFilesize() {
		return filesize;
	}

	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}
	
	
}
