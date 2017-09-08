DROP TABLE STORE CASCADE CONSTRAINTS;

CREATE TABLE STORE(
  STORE_ID VARCHAR2(50) CONSTRAINT UQ_STOREID UNIQUE,
  STORE_PWD VARCHAR2(50) CONSTRAINT NN_STOREPWD NOT NULL,
  STORE_NUM NUMBER CONSTRAINT PK_STORENUM PRIMARY KEY,
  STORE_NAME VARCHAR2(50) CONSTRAINT NN_STORENAME NOT NULL,
  PHONE VARCHAR2(30) CONSTRAINT NN_COMPPHONE NOT NULL,
  CATEGORY VARCHAR2(50) CONSTRAINT FK_CATEGORY NOT NULL,
  CEO VARCHAR2(20) CONSTRAINT NN_CEO NOT NULL,
  ADDRESS VARCHAR2(200) CONSTRAINT NN_ADDRESS NOT NULL,
  QR VARCHAR2(50),
  STORE_SERIAL VARCHAR2(20) CONSTRAINT NN_STORESERIAL NOT NULL,
  HOMEPAGE VARCHAR2(100),
  STORE_INTRO VARCHAR2(500),
  STORE_ORIGIN_INFO VARCHAR2(500),
  STORE_NOTICE VARCHAR2(100),
  STORE_JOIN_DATE DATE,
  STORE_BUSINESS_TIME VARCHAR2(50),
  STORE_MIN_PRICE VARCHAR2(50)
);

INSERT INTO STORE
VALUES('user1', 'pass1', 1, '미즈컨테이너', '02-1111-2222', '피자', '유재영', '서울특별시 서초구 서초동 1316-29 타임빌딩 1층', 'QR1', '123.75', '111-11-11111', 'http://www.naver.com', '우리회사짱', '국내산', '공지사항', '14/01/02', '11:00 - 24:00', 15000);

INSERT INTO STORE
VALUES('user2', 'pass2', 2, '브라더후드키친', '02-2222-1582', '치킨', '윤재영', '서울특별시 강남구 역삼동 810-13', 'QR2', '222-11-11111', 'http://www.daum.net', '우리회사짱', '국내산', '공지사항', '14/03/22', '11:00 - 24:00', 15000);

INSERT INTO STORE
VALUES('user3', 'pass3', 3, '쉑쉑버거', '02-3333-2468', '햄버거', '박재영', '서울특별시 강남구 역삼동 809-13 1층', 'QR3', '333-11-11111', 'http://www.google.com', '우리회사짱', '국내산', '공지사항', '13/07/14', '11:00 - 24:00', 15000);

INSERT INTO STORE
VALUES('user4', 'pass4', 4, '맛이차이나', '02-4444-8421', '중국집', '김재영', '서울특별시 마포구 상수동 321-1 2층', 'QR4', '444-11-11111', 'http://www.dcinside.com', '우리회사짱', '국내산', '공지사항', '11/08/02', '11:00 - 24:00', 15000);

INSERT INTO STORE
VALUES('user5', 'pass5', 5, '윤씨밀방', '02-5555-5552', '양식', '어재영', '서울특별시 마포구 서교동 411-6', 'QR5', '555-11-11111', 'http://www.twitch.com', '우리회사짱', '국내산', '공지사항', '10/11/27', '11:00 - 24:00', 15000);

INSERT INTO STORE
VALUES('user6', 'pass6', 6, '삼청동 수제비', '02-6666-4578', '한식', '구재영', '서울특별시 종로구 삼청동 102', 'QR6', '666-11-11111', 'http://www.afreeca.com', '우리회사짱', '국내산', '공지사항', '17/07/31', '11:00 - 24:00', 15000);

INSERT INTO STORE
VALUES('user7', 'pass7', 7, '토끼정', '02-7777-9292', '일식', '전재영', '서울특별시 강남구 역삼동 812-5', 'QR7', '777-11-11111', 'http://www.youtube.com', '우리회사짱', '국내산', '공지사항', '14/01/02', '11:00 - 24:00', 15000);
