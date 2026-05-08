CREATE DATABASE BookStoreDB;
USE BookStoreDB;

CREATE TABLE Category(
	category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE Book(
	book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    status INT DEFAULT 1,
    publish_date DATE,
    price DECIMAL(12,2) CHECK(PRICE > 0),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id),
    author_name VARCHAR(100) NOT NULL
);

CREATE TABLE BookOrders(
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(200) NOT NULL,
    book_id INT,
    FOREIGN KEY (book_id) REFERENCES Category(book_id),
    order_date DATE DEFAULT (CURRENT_DATE),
    delivery_date DATE 
);

INSERT INTO Category(BOid, category_name , description)
VALUES (1,' IT&Tech' ,  'Sách lập trình'),
		(2,'Business','Sách kinh doanh'),
        (3,'Novel' , 'Tiểu thuyết');

INSERT INTO Book(id , title , status , publish_date , price ,category_id,author_name)
VALUES (1 , 'Clean Code' , 1, '2020-05-10',500000,1, 'Robert C. Martin'),
		(2,'Đắc Nhân Tâm', 0 , '2018-08-20' ,150000 , 2 , 'Dale Carnegie' ),
        (3, 'JavaScript Nâng cao', 1 , '2023-01-15', 350000, 1 , 'Kyle Simpson'),
        (4, 'Nhà Giả Kim' , 0 , '2015-11-25', 120000, 3 , 'Paulo Coelho');

INSERT INTO BookOrder(id , customer_name , book_id , order_date , delivery_date)
VALUES (101, 'Nguyen Hai Nam' , 1 , '2025-01-10' , '2025-01-15'),
		(102, 'Tran Bao Ngoc' ,  3 , '2025-02-05' , '2025-02-10' ),
        (103, ' Le Hoang Yen' , 4 , '2025-03-12' , NULL);
        

UPDATE Book SET price = price + 50000 WHERE category_id = 1; 
 
-- Cập nhật delivery_date thành '2025-12-31' cho các đơn hàng đang có ngày giao bằng NULL.
UPDATE BookOrder SET delivery_date = '2025-12-31' WHERE delivery_date = NULL;
-- Xóa các đơn hàng có ngày đặt (order_date) trước ngày '2025-02-01'.
DELETE FROM BookOrders WHERE order_date = '2025-02-01';


