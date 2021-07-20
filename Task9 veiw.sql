CREATE TABLE Customer
(
    CustomerID int PRIMARY KEY AUTO_INCREMENT,
    CustomerName varchar(50),
    Address varchar(100),
    Phone varchar(12) 
  
  INSERT INTO `Customer` (`CustomerID`, `CustomerName`, `Address`, `Phone`) VALUES
(1, 'Nguyen van A', 'hoai duc ha noi', '0968659073'),
(2, 'Nguyen van B', 'Dan Phuong ha noi', '0384608249'),
(3, 'Nguyen van C', 'Ba Vi ha noi', '0968200258'),
(4, 'Tran Thi D', 'Ba Vi ha noi', '0974615465'),
(5, 'Phi Huu T', 'Son Dong ha noi', '0984841994');
);


CREATE TABLE `Book` (
  `BookCode` int(11) Primary key
  `Category` varchar(50) DEFAULT NULL,
  `Author` varchar(50) DEFAULT NULL,
  `Publisher` varchar(50) DEFAULT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `InStore` int(11) DEFAULT NULL
  
  
  INSERT INTO `Book` (`BookCode`, `Category`, `Author`, `Publisher`, `Title`, `price`, `InStore`) VALUES
(1001, 'Văn học', 'Nam Cao', 'nhà xuất bản văn học', 'Chí Phèo', 35900, 399),
(1002, 'Toán học  ', 'Phạm Thành Nam', 'Nhà Xuất Bản Dân Trí', 'Vẻ Đẹp Toán Học', 88500, 199),
(1003, 'Tin Học', 'Phạm Quang Huy', 'Nhà Xuất Bản Thanh Niên ', 'Excel Dành Cho Người Bắt Đầu', 129500, 299),
(1004, 'Tâm lý hoc', 'Dan Ariely', 'Nhà Xuất Bản Lao Động ', 'Tu Duy Song Song', 79500, 99),
(1005, 'Sách tự lực', 'T. Harv Eker', 'Nhà Xuất Bản TP HCM ', 'Bí mật tư duy triệu phú', 99900, 139);


CREATE TABLE `BookSold` (
  `BookSoldID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `BookCode` int(11) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL,
  `MONEY` int(11) DEFAULT NULL
  CONSTRAINT `pk1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`),
  CONSTRAINT `pk2` FOREIGN KEY (`BookCode`) REFERENCES `Book` (`BookCode`);
  
  INSERT INTO `BookSold` (`BookSoldID`, `CustomerID`, `BookCode`, `Date`, `Price`, `Amount`, `MONEY`) VALUES
(2001, 1, 1002, '2022-07-19 00:00:00', 129500, 2, 259000),
(2002, 1, 1004, '2022-07-19 00:00:00', 75900, 1, 75900),
(2003, 3, 1003, '2022-07-19 00:00:00', 129500, 1, 129500),
(2004, 3, 1005, '2022-07-19 00:00:00', 999900, 1, 999900),
(2005, 2, 1001, '2022-07-21 00:00:00', 35900, 3, 105000),
(2006, 2, 1004, '2022-07-21 00:00:00', 75900, 1, 75900),
(2007, 4, 1002, '2022-07-20 00:00:00', 88500, 1, 88500),
(2008, 4, 1005, '2022-07-20 00:00:00', 99900, 2, 88900),
(2009, 5, 1004, '2022-07-22 00:00:00', 79500, 1, 79500),
(2010, 5, 1003, '2022-07-22 00:00:00', 129500, 1, 129500);


~~~~~Tạo một khung nhìn chứa danh sách các cuốn sách (BookCode, Title, Price) kèm theo số lượng đã
bán được của mỗi cuốn sách.

CREATE VIEW Book_View AS
SELECT Book.BookCode,Book.Title,Book.price,BookSold.Amount
FROM Book INNER JOIN BookSold
ON Book.BookCode = BookSold.BookCode


~~~~~Tạo một khung nhìn chứa danh sách các khách hàng (CustomerID, CustomerName, Address) kèm
theo số lượng các cuốn sách mà khách hàng đó đã mua.

CREATE VIEW Customer_View AS
SELECT Customer.CustomerID,Customer.CustomerName,Customer.Address,BookSold.Amount
FROM Customer INNER JOIN BookSold
ON Customer.CustomerID = BookSold.CustomerID


~~~Tạo một khung nhìn chứa danh sách các khách hàng (CustomerID, CustomerName, Address) đã
mua sách vào tháng trước, kèm theo tên các cuốn sách mà khách hàng đã mua.

CREATE VIEW Customer02_View AS
SELECT Customer.CustomerID,Customer.CustomerName,Customer.Address,BookSold.Date,
Book.Title
FROM ((Customer 
INNER JOIN BookSold ON Customer.CustomerID = BookSold.CustomerID)
INNER JOIN Book ON BookSold.BookCode = Book.BookCode)

~~~Tạo một khung nhìn chứa danh sách các khách hàng kèm theo tổng tiền mà mỗi khách hàng đã chi
cho việc mua sách.

CREATE VIEW Customer_View AS
SELECT Customer.CustomerID,Customer.CustomerName,Customer.Address,BookSold.MONEY
FROM Customer INNER JOIN BookSold
ON Customer.CustomerID = BookSold.CustomerID




