package semi.bean;

public class helpfilesDto {

	private int help_files_no,origin,filesize;
	private String uploadname,savename,filetype;
	public helpfilesDto() {
		super();
	}
	public helpfilesDto(int help_files_no, int origin, int filesize, String uploadname, String savename,
			String filetype) {
		super();
		this.help_files_no = help_files_no;
		this.origin = origin;
		this.filesize = filesize;
		this.uploadname = uploadname;
		this.savename = savename;
		this.filetype = filetype;
	}
	public int getHelp_files_no() {
		return help_files_no;
	}
	public void setHelp_files_no(int help_files_no) {
		this.help_files_no = help_files_no;
	}
	public int getOrigin() {
		return origin;
	}
	public void setOrigin(int origin) {
		this.origin = origin;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
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
	
	
}
