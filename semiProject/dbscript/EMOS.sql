-- EMOS계정

-- 기존 테이블이 있으면 삭제
drop table member cascade constraints ;
drop table store cascade constraints;
drop table ord_table cascade constraints;
drop table menu cascade constraints;
drop table ord_menu cascade constraints;
drop table reply cascade constraints;
drop table good cascade constraints;

-- 기존 시퀀스가 있으면 삭제
drop sequence seq_order_num;


-- 회원정보
create table member(
  user_num number constraint pk_userNum primary key,
  user_id varchar2(100) constraint uk_userId unique,
  user_phone varchar2(13) constraint nn_userPhone not null,
  user_name varchar2(40),
  user_pwd varchar2(100) constraint nn_userpwd not null,
  email varchar2(30),
  birth date constraint nn_birth not null,
  enroll_date date default sysdate,
  gender char(1) constraint chk_gen check (gender in ('m', 'f')),
  verse number(1) default 0
);

-- 회원정보테이블 comment 처리
comment on table member is '회원정보';
comment on column member.user_num is 'AUTO INCREMENT';
comment on column member.user_id is '아이디';
comment on column member.user_phone is '핸드폰번호';
comment on column member.user_name is '이름';
comment on column member.user_pwd is '비밀번호';
comment on column member.email is '이메일';
comment on column member.birth is '생년월일';
comment on column member.enroll_date is '가입날짜';
comment on column member.gender is '성별';
--comment on column member.type is '고객타입';
comment on column member.verse is '경고';

-- member 테이블 임시값
insert into member values(1, 'admin', '010-1234-5678', '관리자', 'admin', 'admin@kh.com', '940513', default, 'm', 1);
insert into member values(2, 'user', '010-1111-2222', '회원', 'user', 'user@kh.com', '981102', default, 'f', 0);
--select * from member;


-- 업체정보저장테이블 comment 처리
comment on table store is '업체정보 저장';
comment on column store.store_id is '업체아이디';
comment on column store.store_pwd is '업체비밀번호';
comment on column store.store_num is '';
comment on column store.store_name is '매장이름';
comment on column store.phone is '전화번호';
comment on column store.category is '';
comment on column store.ceo is '사업주';
comment on column store.address is '주소';
comment on column store.qr is 'QR코드';
comment on column store.store_serial is '사업자 번호';
comment on column store.homepage is '홈페이지 주소';
comment on column store.store_intro is '';
comment on column store.store_origin_info is '';
comment on column store.store_notice is '';
comment on column store.store_join_date is '';
comment on column store.store_business_time is '';
--comment on column store.store_min_price is '';


-- 주문내역저장
create table ord_table(
  order_num number constraint pk_orderNum primary key,
  store_num number constraint nn_orderStoreNum not null,
  order_time date constraint nn_orderTime not null,
  order_type number constraint nn_orderType not null,
  order_way number constraint nn_orderWay not null,
  user_num number,
  constraint fk_storeNum foreign key(store_num) references store(store_num),
  constraint fk_userNum foreign key(user_num) references member(user_num)
);
create sequence seq_order_num;

-- 주문내역저장테이블 comment 처리
comment on table ord_table is '주문내역 저장';
comment on column ord_table.order_num is 'AUTO INCREMENT';
comment on column ord_table.store_num is '업체번호';
comment on column ord_table.order_time is '주문시간';
comment on column ord_table.order_type is '주문방법';
comment on column ord_table.order_way is '결제방법';
comment on column ord_table.user_num is '회원번호';

-- 모든 상품의 정보 저장
create table menu(
  menu_num number constraint pk_menuNum primary key,
  store_num number constraint nn_storeMenuNum not null,
  menu_name varchar2(30) constraint nn_menuName not null,
  price int constraint nn_menuPrice not null,
  menu_type varchar2(30) constraint nn_menuType not null
  -- constraint fk_storeMenuNum foreign key(store_num) references store(store_num)
  -- 업체정보 없어서 임시로 빼놓음
);

comment on table menu is '모든 상품의 정보 저장';
comment on column menu.menu_num is '상품번호';
comment on column menu.store_num is '업체번호';
comment on column menu.menu_name is '상품명';
comment on column menu.price is '가격';
comment on column menu.menu_type is '메뉴분류';
-- 인서트문 내의 서브쿼리 발동을 위한 더미 로우
insert into MENU values (1, 1, '잡채밥', 7000, '메인메뉴');

-- 주문상품 내역 저장
create table ord_menu(
  order_menu_num number constraint pk_orderMenuNum primary key,
  order_num number constraint nn_orderNum not null,
  menu_num number constraint nn_menuNum not null,
  ea int constraint nn_ea not null,
  price int constraint nn_orderPrice not null,
  constraint fk_orderNum foreign key(order_num) references ord_table(order_num),
  constraint fk_menuNum foreign key(menu_num) references menu(menu_num)
);

comment on table order_menu is '주문상품 내역 저장';
comment on column ord_menu.order_menu_num is 'AUTO INCREMENT';
comment on column ord_menu.order_num is '주문번호';
comment on column ord_menu.menu_num is '상품번호';
comment on column ord_menu.ea is '수량';
comment on column ord_menu.price is '가격';
-- 인서트문 내의 서브쿼리 발동을 위한 더미 로우
--insert into ord_menu values (1, 4, 2 , 3, 7000);

-- 댓글, 상품명 평점 후기글 내역 저장
create table reply(
  reply_num number constraint pk_replyNum primary key,
  store_num number constraint nn_replyStoreNum not null,
  user_id varchar2(100) constraint nn_userId not null,
  content varchar2(2000) constraint nn_content not null,
  point number constraint nn_point not null,
  reply_date date constraint nn_replyDate not null,
  good number default '0',
  constraint fk_replyStoreNum foreign key(store_num) references store(store_num),
  constraint fk_replyUserId foreign key(user_id) references member(user_id)
);

insert into reply values(1, 1, 'admin', '너무너무 친절하고 맛있었어요ㅎㅎ11.', 1, '2015-07-01', 0);

insert into reply values(2, 1, 'user', '너무너무 친절하고 맛있었어요ㅎㅎ22.', 2, '2015-01-31', 0);

insert into reply values(3, 1, 'admin', '너무너무 친절하고 맛있었어요ㅎㅎ33.', 3, '2016-07-01', 0);

insert into reply values(4, 1, 'admin', '너무너무 친절하고 맛있었어요ㅎㅎ11.', 1, '2016-09-01', 0);

insert into reply values(5, 1, 'user', '너무너무 친절하고 맛있었어요ㅎㅎ22.', 2, '2016-12-31', 0);

insert into reply values(6, 1, 'user', '너무너무 친절하고 맛있었어요ㅎㅎ33.', 3, '2017-01-31', 0);

insert into reply values(7, 1, 'admin', '너무너무 친절하고 맛있었어요ㅎㅎ11.', 1, '2017-02-01', 0);

insert into reply values(8, 1, 'admin', '너무너무 친절하고 맛있었어요ㅎㅎ22.', 2, '2017-03-31', 0);

insert into reply values(9, 1, 'admin', '너무너무 친절하고 맛있었어요ㅎㅎ33.', 3, '2017-04-14', 0);

insert into reply values(10, 1, 'user', '너무너무 친절하고 맛있었어요ㅎㅎ11.', 1, '2017-05-01', 0);

insert into reply values(11, 1, 'admin', '너무너무 친절하고 맛있었어요ㅎㅎ22.', 2, '2017-06-30', 0);

insert into reply values(12, 1, 'user', '너무너무 친절하고 맛있었어요ㅎㅎ33.', 3, '2017-07-01', 0);

insert into reply values(13, 1, 'user', '너무너무 친절하고 맛있었어요ㅎㅎ11.', 1, '2017-07-02', 0);

insert into reply values(14, 1, 'admin', '너무너무 친절하고 맛있었어요ㅎㅎ22.', 2, '2017-07-03', 0);

insert into reply values(15, 1, 'admin', '너무너무 친절하고 맛있었어요ㅎㅎ33.', 3, '2017-07-04', 0);

insert into reply values(16, 1, 'user', '너무너무 친절하고 맛있었어요ㅎㅎ11.', 1, '2017-07-09', 0);

insert into reply values(17, 1, 'admin', '너무너무 친절하고 맛있었어요ㅎㅎ22.', 2, '2017-07-11', 0);

insert into reply values(18, 1, 'admin', '너무너무 친절하고 맛있었어요ㅎㅎ33.', 3, '2017-07-31', 0);


-- reply 테이블 임시 값
--insert into reply values(1, 1, 'admin', '너무너무 친절하고 맛있었어요ㅎㅎ11.', 1, '2015-07-01', 0);
--
--insert into reply values(2, 1, 'user', '너무너무 친절하고 맛있었어요ㅎㅎ22.', 2, '2015-01-31', 0);
--
--insert into reply values(3, 2, 'admin', '너무너무 친절하고 맛있었어요ㅎㅎ33.', 3, '2016-07-01', 0);
--
--insert into reply values(4, 1, 'admin', '너무너무 친절하고 맛있었어요ㅎㅎ11.', 1, '2016-09-01', 0);
--
--insert into reply values(5, 1, 'user', '너무너무 친절하고 맛있었어요ㅎㅎ22.', 2, '2016-12-31', 0);
--
--insert into reply values(6, 2, 'user', '너무너무 친절하고 맛있었어요ㅎㅎ33.', 3, '2017-01-31', 0);
--
--insert into reply values(7, 1, 'admin', '너무너무 친절하고 맛있었어요ㅎㅎ11.', 1, '2017-02-01', 0);
--
--insert into reply values(8, 1, 'admin', '너무너무 친절하고 맛있었어요ㅎㅎ22.', 2, '2017-03-31', 0);
--
--insert into reply values(9, 2, 'admin', '너무너무 친절하고 맛있었어요ㅎㅎ33.', 3, '2017-04-31', 0);
--
--insert into reply values(10, 1, 'user', '너무너무 친절하고 맛있었어요ㅎㅎ11.', 1, '2017-05-01', 0);
--
--insert into reply values(11, 1, 'admin', '너무너무 친절하고 맛있었어요ㅎㅎ22.', 2, '2017-06-31', 0);
--
--insert into reply values(12, 2, 'user', '너무너무 친절하고 맛있었어요ㅎㅎ33.', 3, '2017-07-01', 0);
--
--insert into reply values(13, 1, 'user', '너무너무 친절하고 맛있었어요ㅎㅎ11.', 1, '2017-07-02', 0);
--
--insert into reply values(14, 1, 'admin', '너무너무 친절하고 맛있었어요ㅎㅎ22.', 2, '2017-07-03', 0);
--
--insert into reply values(15, 2, 'admin', '너무너무 친절하고 맛있었어요ㅎㅎ33.', 3, '2017-07-04', 0);
--
--insert into reply values(16, 1, 'user', '너무너무 친절하고 맛있었어요ㅎㅎ11.', 1, '2017-07-09', 0);
--
--insert into reply values(17, 1, 'admin', '너무너무 친절하고 맛있었어요ㅎㅎ22.', 2, '2017-07-11', 0);
--
--insert into reply values(18, 2, 'admin', '너무너무 친절하고 맛있었어요ㅎㅎ33.', 3, '2017-07-31', 0);

-- 댓글 테이블 comment 처리
comment on table reply is '댓글, 상품명 평점 후기글 내역 저장';
comment on column reply.reply_num is '댓글번호';
comment on column reply.store_num is '매장번호';
comment on column reply.user_id is '회원아이디';
comment on column reply.content is '글 내용';
comment on column reply.point is '평점';
comment on column reply.reply_date is '댓글 등록일';
--select * from reply where store_num = 1 order by reply_num desc;

-- 좋아요 저장
create table good(
  reply_num number constraint nn_goodReplyNum not null constraint un_goodReplyNum unique,
  user_num number constraint nn_goodUserNum not null,
  constraint fk_goodReplyNum foreign key(reply_num) references reply(reply_num)  on delete cascade,
  constraint fk_goodReplyUserNum foreign key(user_num) references member(user_num)
);

comment on column reply.good is '좋아요';

-- 좋아요저장테이블 comment 처리
comment on table good is '좋아요 저장';
comment on column good.reply_num is '좋아요댓글번호';
comment on column good.user_num is '좋아요고객번호';


-- STORE TABLE & DUMMY

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
VALUES('user1', 'pass1', 1, '미즈컨테이너', '02-1111-2222', '피자', '유재영', '06616, 서울특별시 서초구 서초동 1316-29, 타임빌딩 1층', 'QR1', '111-11-11111', 'http://www.naver.com', '우리회사짱', '국내산', '공지사항', '14/01/02', '11:00 - 24:00', 15000);

INSERT INTO STORE
VALUES('user2', 'pass2', 2, '브라더후드키친', '02-2222-1582', '치킨', '윤재영', '06123, 서울특별시 강남구 역삼동 810-13, ', 'QR2', '222-11-11111', 'http://www.daum.net', '우리회사짱', '국내산', '공지사항', '14/03/22', '11:00 - 24:00', 15000);

INSERT INTO STORE
VALUES('user3', 'pass3', 3, '쉑쉑버거', '02-3333-2468', '햄버거', '박재영', '06123, 서울특별시 강남구 역삼동 809-13, 1층', 'QR3', '333-11-11111', 'http://www.google.com', '우리회사짱', '국내산', '공지사항', '13/07/14', '11:00 - 24:00', 15000);

INSERT INTO STORE
VALUES('user4', 'pass4', 4, '맛이차이나', '02-4444-8421', '중국집', '김재영', '04074, 서울특별시 마포구 상수동 321-1, 2층', 'QR4', '444-11-11111', 'http://www.dcinside.com', '우리회사짱', '국내산', '공지사항', '11/08/02', '11:00 - 24:00', 15000);

INSERT INTO STORE
VALUES('user5', 'pass5', 5, '윤씨밀방', '02-5555-5552', '양식', '어재영', '04049, 서울특별시 마포구 서교동 411-6, ', 'QR5', '555-11-11111', 'http://www.twitch.com', '우리회사짱', '국내산', '공지사항', '10/11/27', '11:00 - 24:00', 15000);

INSERT INTO STORE
VALUES('user6', 'pass6', 6, '삼청동 수제비', '02-6666-4578', '한식', '구재영', '03049, 서울특별시 종로구 삼청동 102, ', 'QR6', '666-11-11111', 'http://www.afreeca.com', '우리회사짱', '국내산', '공지사항', '17/07/31', '11:00 - 24:00', 15000);

INSERT INTO STORE
VALUES('user7', 'pass7', 7, '아웃백 코엑스점', '02-7777-9292', '양식', '왕재영', '06164, 서울 강남구 영동대로 513 코엑스, ', 'QR7', '777-11-11111', 'http://www.youtube.com', '우리회사짱', '국내산', '공지사항', '14/01/02', '11:00 - 24:00', 15000);

INSERT INTO STORE
VALUES('user8', 'pass8', 8, '빕스 청담점', '02-8888-8888', '양식', '도재영', '06074, 서울 강남구 학동로 519, ', 'QR7', '888-11-8888', 'http://www.kfda.go.kr', '우리회사짱', '국내산', '공지사항', '14/01/02', '11:00 - 24:00', 15000);

INSERT INTO STORE
VALUES('user9', 'pass9', 9, '타코벨', '02-9999-9999', '양식', '방재영', '05065, 서울 광진구 아차산로 262, 지하1층 72호', 'QR7', '999-99-11111', 'http://www.foodsafety.go.kr', '우리회사짱', '국내산', '공지사항', '14/01/02', '11:00 - 24:00', 15000);

INSERT INTO STORE
VALUES('user10', 'pass10', 10, '버거킹 강남대로점', '02-1010-1010', '햄버거', '라재영', '06134, 서울 강남구 강남대로 406, ', 'QR7', '100-01-10101', 'http://www.foodnara.go.kr', '우리회사짱', '국내산', '공지사항', '14/01/02', '11:00 - 24:00', 15000);

INSERT INTO STORE
VALUES('user11', 'pass11', 11, '맥도날드 강남점', '02-1111-1100', '햄버거', '설재영', '06134, 서울 강남구 테헤란로 107, ', 'QR7', '453-87-78612', 'http://www.kfda.go.kr/fa/index.do', '우리회사짱', '국내산', '공지사항', '14/01/02', '11:00 - 24:00', 15000);

INSERT INTO STORE
VALUES('user12', 'pass12', 12, 'T.G.I. Fridays', '02-1212-1212', '양식', '탁재영', '05030, 서울 광진구 능동로 110, ', 'QR7', '121-21-21212', 'http:/www.openoffice.org', '우리회사짱', '국내산', '공지사항', '14/01/02', '11:00 - 24:00', 15000);

INSERT INTO STORE
VALUES('user13', 'pass13', 13, '개미집', '02-1313-1313', '한식', '남궁재영', '06028, 서울 강남구 압구정로 110, ', 'QR7', '131-31-31313', 'http://www.thenounproject.com', '우리회사짱', '국내산', '공지사항', '14/01/02', '11:00 - 24:00', 15000);

INSERT INTO STORE
VALUES('user14', 'pass14', 14, '대성밀면', '02-1414-1414', '한식', '대재영', '48975, 부산 중구 보수대로44번길 6, ', 'QR7', '777-11-41414', 'http://www.hri.co.kr', '우리회사짱', '국내산', '공지사항', '14/01/02', '11:00 - 24:00', 15000);
INSERT INTO STORE
VALUES('user15', 'pass15', 15, '네네치킨', '02-1515-1515', '치킨', '나까무라재영', '06031, 서울 강남구 논현로161길 14, ', 'QR7', '171-71-51515', 'https://pixabay.com/', '우리회사짱', '국내산', '공지사항', '14/01/02', '11:00 - 24:00', 15000);

INSERT INTO STORE
VALUES('user16', 'pass16', 16, '토끼정', '02-1616-1616', '일식', '전재영', '06123, 서울특별시 강남구 역삼동 812-5, ', 'QR7', '161-81-61616', 'http://www.riss.kr', '우리회사짱', '국내산', '공지사항', '14/01/02', '11:00 - 24:00', 15000);









-- IMAGE TABLE & DUMMY

DROP TABLE IMAGE CASCADE CONSTRAINTS;

CREATE TABLE IMAGE(
  STORE_NUM NUMBER CONSTRAINT NN_IMG_STORENUM NOT NULL,
  IMG_MAIN VARCHAR2(50),
  IMG1 VARCHAR2(50),
  IMG2 VARCHAR2(50),
  IMG3 VARCHAR2(50),
  CONSTRAINT FK_IMG_STORENUM FOREIGN KEY(STORE_NUM) REFERENCES STORE(STORE_NUM)
);


INSERT INTO IMAGE
VALUES(1, 'main.jpg', 'img1.jpg', 'img2.jpg', 'img3.jpg');

INSERT INTO IMAGE
VALUES(2, 'main.jpg', 'img1.jpg', 'img2.jpg', NULL);

INSERT INTO IMAGE
VALUES(3, 'main.jpg', 'img1.jpg', NULL, NULL);

INSERT INTO IMAGE
VALUES(4, 'main.jpg', null, NULL, NULL);

INSERT INTO IMAGE
VALUES(5, null, null, NULL, NULL);

INSERT INTO IMAGE
VALUES(6, 'main.jpg', 'img1.jpg', 'img2.jpg', 'img3.jpg');

INSERT INTO IMAGE
VALUES(7, null, null, NULL, NULL);

INSERT INTO IMAGE
VALUES(8, 'main.jpg', 'img1.jpg', 'img2.jpg', NULL);

INSERT INTO IMAGE
VALUES(9, 'main.jpg', 'img1.jpg', NULL, NULL);

INSERT INTO IMAGE
VALUES(10, null, null, NULL, NULL);

INSERT INTO IMAGE
VALUES(11, 'main.jpg', 'img1.jpg', 'img2.jpg', 'img3.jpg');

INSERT INTO IMAGE
VALUES(12, 'main.jpg', 'img1.jpg', 'img2.jpg', NULL);

INSERT INTO IMAGE
VALUES(13, 'main.jpg', 'img1.jpg', NULL, NULL);

INSERT INTO IMAGE
VALUES(14, 'main.jpg', null, NULL, NULL);

INSERT INTO IMAGE
VALUES(15, null, null, NULL, NULL);

INSERT INTO IMAGE
VALUES(16, null, null, NULL, NULL);


commit;