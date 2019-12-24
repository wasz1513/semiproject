package semi.bean;

public class OrdersDto {
		private int orders_no; 
		private String 	customer_id,
									    orders_date,
									    orders_goods_title,
									    orders_goods_seller,
									    orders_type	,
									    orders_post,
										orders_basic_address,
										orders_extra_address,
										orders_payment;
		
		
		public OrdersDto() {
			super();
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
