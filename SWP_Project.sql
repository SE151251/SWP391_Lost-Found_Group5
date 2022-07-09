CREATE DATABASE FPTU_Lost_and_Found
GO

USE FPTU_Lost_and_Found
GO

CREATE TABLE Member
(
	MemberID varchar(30) PRIMARY KEY,	
	FullName nvarchar(50),
	Email varchar(50) NOT NULL,
	Picture varchar(200),
	ProfileInfo nvarchar(max),
	MemberRole decimal(1, 0) NOT NULL,
	MemberStatus decimal(1, 0) NOT NULL,
	CountTime int NOT NULL,	
);

CREATE TABLE ArticleType
(
	ArticleTypeID decimal(1, 0) PRIMARY KEY,
	ArticleTypeName nvarchar(30) NOT NULL,	
);

CREATE TABLE ItemType
(
	ItemID int IDENTITY(1,1) PRIMARY KEY,
	ItemName nvarchar(20) NOT NULL,	
);

CREATE TABLE Article
(
	ArticleID int IDENTITY(1,1) PRIMARY KEY,
	ArticleTitle nvarchar(50) NOT NULL,
	ArticleContent nvarchar(max) NOT NULL,
	ImgURL varchar(50),
	PostTime DateTime NOT NULL,
	ArticleStatus decimal(1, 0) NOT NULL,
	WarningStatus decimal(1, 0) NOT NULL,
	MemberID varchar(30) NOT NULL FOREIGN KEY REFERENCES Member(MemberID),
	ArticleTypeID decimal(1, 0) NOT NULL FOREIGN KEY REFERENCES ArticleType(ArticleTypeID),
	ItemID int FOREIGN KEY REFERENCES ItemType(ItemID),
);


CREATE TABLE Comment
(
	CommentID int IDENTITY(1,1) primary key,
	ArticleID int NOT NULL FOREIGN KEY REFERENCES Article(ArticleID),
	MemberID varchar(30) NOT NULL FOREIGN KEY REFERENCES Member(MemberID),	
	CommentContent nvarchar(500) NOT NULL,
	CommentTime DateTime NOT NULL,
	CommentStatus decimal(1, 0) NOT NULL
);
drop table Notification
CREATE TABLE Notification
(
	NotificationID int IDENTITY(1,1) primary key,
	SenderID varchar(30) NOT NULL FOREIGN KEY REFERENCES Member(MemberID),	
	ReceiverID varchar(30) NOT NULL FOREIGN KEY REFERENCES Member(MemberID),
	ArticleID int  NOT NULL FOREIGN KEY REFERENCES Article(ArticleID),
	NotificationContent nvarchar(100) NOT NULL,
	NotificationTime DateTime NOT NULL,
	NotificationStatus decimal(1, 0) NOT NULL
);

CREATE TABLE Report
(
	ReportID int IDENTITY(1,1) primary key,
	ReportContent nvarchar(200) NOT NULL,
	ReportTime DateTime NOT NULL,
	ConfirmTime DateTime,
	ReportStatus decimal(1, 0) NOT NULL,
	ArticleID int NOT NULL FOREIGN KEY REFERENCES Article(ArticleID),
	MemberID varchar(30) NOT NULL FOREIGN KEY REFERENCES Member(MemberID),
);

CREATE TABLE Hashtag
(
	HashtagID int IDENTITY(1,1) primary key,
	HashtagName varchar(31) NOT NULL ,	
);
CREATE TABLE ArticleHashtag
(
	ArticleID int  NOT NULL FOREIGN KEY REFERENCES Article(ArticleID),
	HashtagID int  NOT NULL FOREIGN KEY REFERENCES Hashtag(HashtagID),	
);


select * from Member
select * from ArticleType

delete from ArticleType
where ArticleTypeID = 3

order by PostTime DESC
delete from Hashtag
select * from Hashtag
select * from ArticleHashtag
Select count(*) from Article where ArticleTypeID = 2
Select * from Article
                        Where ArticleTypeID = 2
                        order by PostTime DESC						
                        OFFSET 0 ROWS
                        FETCH FIRST 3 ROWS ONLY
						
select * from Report
update Member
set MemberRole = 0
where MemberID = 107703834893877697636

Select * From Hashtag
insert into ItemType (ItemName)
values (N'Laptop');
insert into ItemType (ItemName)
values (N'Điện thoại');
insert into ItemType (ItemName)
values (N'Chìa khóa');
insert into ItemType (ItemName)
values (N'Thẻ sinh viên');
insert into ItemType (ItemName)
values (N'Ví/Bóp');
insert into ItemType (ItemName)
values (N'Giấy tờ/Tài liệu');
insert into ItemType (ItemName)
values (N'Tiền');
insert into ItemType (ItemName)
values (N'Cặp/Túi xách');
insert into ItemType (ItemName)
values (N'Trang phục');
insert into ItemType (ItemName)
values (N'Linh kiện điện tử');
insert into ItemType (ItemName)
values (N'Bình nước');



insert into ArticleType
values (01,N'Tìm đồ');
insert into ArticleType
values (02,N'Trả đồ nhặt được');
insert into ArticleType
values (03,N'Thông báo của ADMIN');

select A.ArticleID, A.ArticleContent, A.ImgURL, A.PostTime, A.ArticleStatus, A.MemberID, A.ArticleTypeID, A.ItemID 
from Article A inner join ArticleType AType on A.ArticleTypeID = AType.ArticleTypeID
Where A.ArticleTypeID = 2

select A.ArticleID, A.ArticleContent, A.ImgURL, A.PostTime, A.ArticleStatus, A.MemberID, A.ArticleTypeID, A.ItemID 
from Article A inner join Member M on M.MemberID = A.MemberID
Where A.ArticleTypeID = 1 and A.ArticleStatus not like -1 and M.MemberID Like 109377370807180139934

select A.ArticleID, A.ArticleContent, A.ImgURL, A.PostTime, A.ArticleStatus, A.MemberID, A.ArticleTypeID, A.ItemID 
from Article A inner join ArticleType AType on A.ArticleTypeID = AType.ArticleTypeID
				inner join ItemType I on I.ItemID = A.ItemID
Where A.ArticleTypeID = 1 and A.ItemID = 11
Order By PostTime DESC

select H.HashtagID, H.HashtagName
from Article A inner join ArticleHashtag AH on A.ArticleID = AH.ArticleID
				inner join Hashtag H on AH.HashtagID = H.HashtagID
where A.ArticleID = 7122053279
Order By PostTime DESC
select * from Article
select * from Hashtag
select * from Member
select * from comment
select * from report
update report set ReportContent = 'abcdeaasas' where ReportID = 5277208749
update Article
set ArticleStatus = 1
where MemberID = 109377370807180139934

----------------------------------------------------------------------------
--Query lấy ra các member đã từng bị report và số lần bị report
select M.FullName, A.MemberID, A.ArticleID, count(A.MemberID) as total
from Article A inner join Report R on A.ArticleID = R.ArticleID
inner join Member M on M.MemberID = A.MemberID
group by M.FullName,A.MemberID,A.ArticleID


-------------------------------------------------------
update Member
set MemberRole = 0
where MemberID = 107703834893877697636
-------------------------------------------------------


----------------------------------------------------------------------------
-- Lấy ra các bài viết đăng trong hôm nay
select count(*) As total from Article A
where DAY(A.PostTime) = DAY(GETDATE()) and A.ArticleTypeID = 1
----------------------------------------------------------------------------

-- Đếm số bài viết
select count(*) As total from Article A
where A.ArticleTypeID = 3
----------------------------------------------------------------------------


-- Đếm số bài report
select count(*) As total from Report R
where R.ReportStatus = 1


----------------------------------------------------------------------------


-- Lấy ra danh sách các member có bài viết bị cảnh cáo
select m.FullName, m.MemberID, m.MemberRole,m.Picture, m.Email, m.CountTime, m.MemberStatus, m.ProfileInfo
from Member M inner join Article A on m.MemberID = a.MemberID
where a.WarningStatus = 1

----------------------------------------------------------------------------

-- Lấy ra tổng số bài viết bị cảnh cáo bởi admin của 1 member
select count(A.ArticleID) as total
from Member M inner join Article A on m.MemberID = a.MemberID
where M.MemberID = 107703834893877697636 and A.WarningStatus = 1
group by A.MemberID


----------------------------------------------------------------------------
-- Lấy ra các bài viết bị tố cáo bởi các member khác của 1 member
select R.ReportID, R.ReportContent, R.ArticleID, R.MemberID, R.ReportStatus, R.ReportTime, R.ConfirmTime
from Article A inner join Report R on A.ArticleID = R.ArticleID
inner join Member M on M.MemberID = A.MemberID
where A.MemberID = 107703834893877697636
group by R.ReportID, R.ReportContent, R.ArticleID, R.MemberID, R.ReportStatus, R.ReportTime, R.ConfirmTime, M.FullName,A.MemberID,A.ArticleID
----------------------------------------------------------------------------
select * from Member

-- Lấy ra các bài viết bị cảnh cáo của 1 member
select A.ArticleID,A.ArticleContent,A.ArticleTitle,A.ArticleTypeID, A.ArticleStatus, A.ImgURL, A.ItemID, A.PostTime, A.WarningStatus, A.MemberID
from Member M inner join Article A on m.MemberID = a.MemberID
where M.MemberID = 107703834893877697636 and A.WarningStatus = 1
group by A.ArticleID,A.ArticleContent,A.ArticleTitle,A.ArticleTypeID, A.ArticleStatus, A.ImgURL, A.ItemID, A.PostTime, A.WarningStatus, A.MemberID

----------------------------------------------------------------------------

-- Lấy ra tổng số bài viết Lost đã đăng của 1 member
select count(A.ArticleID) as total
from Member M inner join Article A on m.MemberID = a.MemberID
where M.MemberID = 114512282810993535016 and A.ArticleTypeID = 1
group by A.MemberID

----------------------------------------------------------------------------

-- Lấy ra tổng số bài viết Found đã đăng của 1 member
select count(A.ArticleID) as total
from Member M inner join Article A on m.MemberID = a.MemberID
where M.MemberID = 114512282810993535016 and A.ArticleTypeID = 2
group by A.MemberID
----------------------------------------------------------------------------

-- Lấy ra tổng số bài viết đã đăng của 1 member
select count(A.ArticleID) as total
from Member M inner join Article A on m.MemberID = a.MemberID
where M.MemberID = 114512282810993535016
group by A.MemberID

----------------------------------------------------------------------------

-- Lấy ra các id bài viết của member bị Ban có trong bảng report
select A.ArticleID
from Article A inner join Report R on A.ArticleID = R.ArticleID
inner join Member M on M.MemberID = A.MemberID
where A.MemberID = 107703834893877697636
group by M.FullName,A.MemberID,A.ArticleID

select * from Article
select * from Member
select * from report
