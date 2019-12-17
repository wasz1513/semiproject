package semi;

	public class GoodsDto{

		private int GOODS_no;
		private String GOODS_title;
		private String GOODS_category;
		private String GOODS_content;
		private String GOODS_state;
		private int GOODS_price;
		private int GOODS_readcount;
		private int GOODS_replycount;
		private String GOODS_writetime;
		
		public GoodsDto(int gOODS_no, String gOODS_title, String gOODS_category, String gOODS_content,
				String gOODS_state, int gOODS_price, int gOODS_readcount, int gOODS_replycount,
				String gOODS_writetime) {
			super();
			GOODS_no = gOODS_no;
			GOODS_title = gOODS_title;
			GOODS_category = gOODS_category;
			GOODS_content = gOODS_content;
			GOODS_state = gOODS_state;
			GOODS_price = gOODS_price;
			GOODS_readcount = gOODS_readcount;
			GOODS_replycount = gOODS_replycount;
			GOODS_writetime = gOODS_writetime;
			
			
		}

		public int getGOODS_no() {
			return GOODS_no;
		}

		public void setGOODS_no(int gOODS_no) {
			GOODS_no = gOODS_no;
		}

		public String getGOODS_title() {
			return GOODS_title;
		}

		public void setGOODS_title(String gOODS_title) {
			GOODS_title = gOODS_title;
		}

		public String getGOODS_category() {
			return GOODS_category;
		}

		public void setGOODS_category(String gOODS_category) {
			GOODS_category = gOODS_category;
		}

		public String getGOODS_content() {
			return GOODS_content;
		}

		public void setGOODS_content(String gOODS_content) {
			GOODS_content = gOODS_content;
		}

		public String getGOODS_state() {
			return GOODS_state;
		}

		public void setGOODS_state(String gOODS_state) {
			GOODS_state = gOODS_state;
		}

		public int getGOODS_price() {
			return GOODS_price;
		}

		public void setGOODS_price(int gOODS_price) {
			GOODS_price = gOODS_price;
		}

		public int getGOODS_readcount() {
			return GOODS_readcount;
		}

		public void setGOODS_readcount(int gOODS_readcount) {
			GOODS_readcount = gOODS_readcount;
		}

		public int getGOODS_replycount() {
			return GOODS_replycount;
		}

		public void setGOODS_replycount(int gOODS_replycount) {
			GOODS_replycount = gOODS_replycount;
		}

		public String getGOODS_writetime() {
			return GOODS_writetime;
		}

		public void setGOODS_writetime(String gOODS_writetime) {
			GOODS_writetime = gOODS_writetime;
		}

		public GoodsDto() {
			super();
		}
		
	}
		
		