package semi.bean;

public class GoodsReplyDto {
private int goods_reply_no,goods_no;
private String goods_reply_content, goods_reply_writer,goods_reply_writetime;
public GoodsReplyDto() {
	super();
}
public int getGoods_reply_no() {
	return goods_reply_no;
}
public void setGoods_reply_no(int goods_reply_no) {
	this.goods_reply_no = goods_reply_no;
}
public int getGoods_no() {
	return goods_no;
}
public void setGoods_no(int goods_no) {
	this.goods_no = goods_no;
}
public String getGoods_reply_content() {
	return goods_reply_content;
}
public void setGoods_reply_content(String goods_reply_content) {
	this.goods_reply_content = goods_reply_content;
}
public String getGoods_reply_writer() {
	return goods_reply_writer;
}
public void setGoods_reply_writer(String goods_reply_writer) {
	this.goods_reply_writer = goods_reply_writer;
}
public String getGoods_reply_writetime() {
	return goods_reply_writetime;
}
public void setGoods_reply_writetime(String goods_reply_writetime) {
	this.goods_reply_writetime = goods_reply_writetime;
}
@Override
public String toString() {
	return "GoodsReplyDto [goods_reply_no=" + goods_reply_no + ", goods_no=" + goods_no + ", goods_reply_content="
			+ goods_reply_content + ", goods_reply_writer=" + goods_reply_writer + ", goods_reply_writetime="
			+ goods_reply_writetime + "]";
}



}
