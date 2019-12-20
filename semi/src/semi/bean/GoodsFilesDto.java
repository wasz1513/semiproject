package semi.bean;

public class GoodsFilesDto {
private int goods_files_no;
private int origin;
private String uploadname;
private String savename;
private String filetype;
private long filesize;
public GoodsFilesDto() {
	super();
}
public int getGoods_files_no() {
	return goods_files_no;
}
public void setGoods_files_no(int goods_files_no) {
	this.goods_files_no = goods_files_no;
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
