create table geoloc (
	geolocation_zip_code_prefix int primary key,
	geolocation_lat float,
	geolocation_lng float,
	geolocation_city varchar(50),
	geolocation_state varchar(50)
)

create table customer (
	customer_id varchar(50) primary key,
	customer_unique_id varchar(50),
	customer_zip_code_prefix int,
	customer_city varchar(50),
	customer_state varchar(50),
	
	constraint fkCodePrefix foreign key (customer_zip_code_prefix) references geoloc(geolocation_zip_code_prefix) 
)

create table seller (
	seller_id varchar(50) primary key,
	seller_zip_code_prefix int,
	seller_city varchar(50),
	seller_state varchar(50),
	
	constraint fkCodePrefix foreign key (seller_zip_code_prefix) references geoloc (geolocation_zip_code_prefix)
)

create table product (
	product_id varchar(50) primary key,
	product_category_name varchar(50),
	product_name_lenght float,
	product_description_lenght float,
	product_photos_qty float, 
	product_weight_g float,
	product_length_cm float,
	product_height_cm float,
	product_width_cm float
)

create table orders (
	order_id varchar(50) primary key,
	customer_id varchar(50), --FK
	order_status varchar(50),
	order_purchase_timestamp varchar (50),
	order_approved_at varchar(50),
	order_delivered_carrier_date varchar(50),
	order_delivered_customer_date varchar(50),
	order_estimated_delivery_date varchar(50),
	
	constraint fkCustomer foreign key (customer_id) references customer (customer_id)
)

create table order_item (
	order_id varchar(50), --PK FK
	order_item_id int, 
	product_id varchar(50), --PK FK
	seller_id varchar(50), --FK
	shipping_limit_date varchar(50),
	price float,
	freight_value float,
	
	primary key (order_id, product_id),
	constraint fkSeller foreign key (seller_id) references seller (seller_id),
	constraint fkOrder foreign key (order_id) references orders (order_id),
	constraint fkProduct foreign key (product_id) references product (product_id)
)

create table order_payment (
	order_id varchar(50) primary key,
	payment_sequential int,
	payment_taype varchar(50),
	payment_installments int,
	payment_value float,
	
	constraint fkOrder foreign key (order_id) references orders(order_id)
)

create table order_review (
	review_id varchar(50) primary key,
	order_id varchar(50),
	review_score int,
	review_comment_title varchar(200),
	review_comment_message text,
	review_creation_date timestamp,
	review_answer_timestamp timestamp,
	
	constraint fkOrder foreign key (order_id) references orders(order_id)
)

