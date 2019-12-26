package semi.bean;

public class OrdersDto {
		private int orders_no; //주문번호(주문일자_주문자번호_상품번호)
		private int goods_no;
		private int customer_no;
		private int customer_point;
		private String customer_id;//구매자
		private String orders_date;//구매일
		private String orders_goods_title;//구매 상품명
		private String orders_goods_seller;//판매자
		private String orders_type;//구매 방법(배송/직거래)
		private String orders_post;//구매자 우편번호
		private String orders_basic_address;//구매자 기본주소
		private String orders_extra_address;//구매자 상세주소
		private String orders_payment;//구매 방법('신용카드','실시간 계좌이체','무통장 입금','만나서 결제')
		private int orders_amount;//구매금액
		private String orders_goods_buyer;
		
		
		
		public String getOrders_goods_buyer() {
			return orders_goods_buyer;
		}


		public void setOrders_goods_buyer(String orders_goods_buyer) {
			this.orders_goods_buyer = orders_goods_buyer;
		}


		public int getGoods_no() {
			return goods_no;
		}


		public void setGoods_no(int goods_no) {
			this.goods_no = goods_no;
		}


		public int getCustomer_point() {
			return customer_point;
		}


		public void setCustomer_point(int customer_point) {
			this.customer_point = customer_point;
		}


		public int getCustomer_no() {
			return customer_no;
		}


		public void setCustomer_no(int customer_no) {
			this.customer_no = customer_no;
		}


		public int getOrders_amount() {
			return orders_amount;
		}


		public void setOrders_amount(int orders_amount) {
			this.orders_amount = orders_amount;
		}


		public int getOrders_no() {
			return orders_no;
		}


		public void setOrders_no(int orders_no) {
			this.orders_no = orders_no;
		}


		public String getCustomer_id() {
			return customer_id;
		}


		public void setCustomer_id(String customer_id) {
			this.customer_id = customer_id;
		}


		public String getOrders_date() {
			return orders_date;
		}


		public void setOrders_date(String orders_date) {
			this.orders_date = orders_date;
		}


		public String getOrders_goods_title() {
			return orders_goods_title;
		}


		public void setOrders_goods_title(String orders_goods_title) {
			this.orders_goods_title = orders_goods_title;
		}


		public String getOrders_goods_seller() {
			return orders_goods_seller;
		}


		public void setOrders_goods_seller(String orders_goods_seller) {
			this.orders_goods_seller = orders_goods_seller;
		}


		public String getOrders_type() {
			return orders_type;
		}


		public void setOrders_type(String orders_type) {
			this.orders_type = orders_type;
		}


		public String getOrders_post() {
			return orders_post;
		}


		public void setOrders_post(String orders_post) {
			this.orders_post = orders_post;
		}


		public String getOrders_basic_address() {
			return orders_basic_address;
		}


		public void setOrders_basic_address(String orders_basic_address) {
			this.orders_basic_address = orders_basic_address;
		}


		public String getOrders_extra_address() {
			return orders_extra_address;
		}


		public void setOrders_extra_address(String orders_extra_address) {
			this.orders_extra_address = orders_extra_address;
		}


		public String getOrders_payment() {
			return orders_payment;
		}


		public void setOrders_payment(String orders_payment) {
			this.orders_payment = orders_payment;
		}
	
		
		
		
		
		
		
		
		
}
