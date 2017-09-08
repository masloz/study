-- EMOS계정

-- 기존 테이블이 있으면 삭제
drop table member cascade constraints ;
drop table store cascade constraints;
drop table customer cascade constraints;
drop table menu cascade constraints;
drop table order_menu cascade constraints;
drop table reply cascade constraints;
drop table good cascade constraints;

select * from member;
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
  verse number(1)
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

-- 업체정보저장
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
VALUES('user7', 'pass7', 7, '토끼정', '02-7777-9292', '일식', '전재영', '06123, 서울특별시 강남구 역삼동 812-5, ', 'QR7', '777-11-11111', 'http://www.youtube.com', '우리회사짱', '국내산', '공지사항', '14/01/02', '11:00 - 24:00', 15000);

SELECT * FROM (SELECT ROWNUM RNUM, T.* FROM (SELECT * FROM STORE) T);
select * from store;

--PICTURE TABLE
DROP TABLE IMAGE CASCADE CONSTRAINTS;

CREATE TABLE IMAGE(
  STORE_NUM NUMBER CONSTRAINT NN_IMG_STORENUM NOT NULL,
  IMG_MAIN VARCHAR2(50),
  IMG1 VARCHAR2(50),
  IMG2 VARCHAR2(50),
  IMG3 VARCHAR2(50),
  CONSTRAINT FK_IMG_STORENUM FOREIGN KEY(STORE_NUM) REFERENCES STORE(STORE_NUM)
);

select * from IMAGE;

select * 
from store, IMAGE
where store.store_num = image.store_num(+);

delete image where store_num = 1;

INSERT INTO IMAGE
VALUES(1, null, null, NULL, NULL);

INSERT INTO IMAGE
VALUES(2, null, null, NULL, NULL);

INSERT INTO IMAGE
VALUES(3, null, null, NULL, NULL);

INSERT INTO IMAGE
VALUES(4, null, null, NULL, NULL);

INSERT INTO IMAGE
VALUES(5, null, null, NULL, NULL);

INSERT INTO IMAGE
VALUES(6, null, null, NULL, NULL);

INSERT INTO IMAGE
VALUES(7, null, null, NULL, NULL);
select * from store;
-- 주문내역저장
create table customer(
  order_num number constraint pk_orderNum primary key,
  store_num number constraint nn_orderStoreNum not null,
  order_time date constraint nn_orderTime not null,
  order_type number constraint nn_orderType not null,
  order_way date constraint nn_orderWay not null,
  state number constraint nn_state not null,
  user_num number,
  constraint fk_storeNum foreign key(store_num) references store(store_num),
  constraint fk_userNum foreign key(user_num) references member(user_num)
);

-- 주문내역저장테이블 comment 처리
comment on table customer is '주문내역 저장';
comment on column customer.order_num is 'AUTO INCREMENT';
comment on column customer.store_num is '업체번호';
comment on column customer.order_time is '주문시간';
comment on column customer.order_type is '주문방법';
comment on column customer.order_way is '결제방법';
comment on column customer.state is '주문상태';
comment on column customer.user_num is '회원번호';


-- 모든 상품의 정보 저장
create table menu(
  menu_num number constraint pk_menuNum primary key,
  store_num number constraint nn_storeMenuNum not null,
  menu_name varchar2(30) constraint nn_menuName not null,
  price int constraint nn_menuPrice not null,
  menu_type varchar2(30) constraint nn_menuType not null,
  dpn number,
  constraint fk_storeMenuNum foreign key(store_num) references store(store_num)
);

comment on table menu is '모든 상품의 정보 저장';
comment on column menu.menu_num is '상품번호';
comment on column menu.store_num is '업체번호';
comment on column menu.menu_name is '상품명';
comment on column menu.price is '가격';
comment on column menu.menu_type is '메뉴분류';
comment on column menu.dpn is '';


-- 주문상품 내역 저장
create table order_menu(
  order_menu_num number constraint pk_orderMenuNum primary key,
  order_num number constraint nn_orderNum not null,
  menu_num number constraint nn_menuNum not null,
  ea int constraint nn_ea not null,
  price int constraint nn_orderPrice not null,
  constraint fk_orderNum foreign key(order_num) references customer(order_num),
  constraint fk_menuNum foreign key(menu_num) references menu(menu_num)
);

comment on table order_menu is '주문상품 내역 저장';
comment on column order_menu.order_menu_num is 'AUTO INCREMENT';
comment on column order_menu.order_num is '주문번호';
comment on column order_menu.menu_num is '상품번호';
comment on column order_menu.ea is '수량';
comment on column order_menu.price is '가격';

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

select * from (select rownum rnum, reply_num, store_num, user_id, content, point, reply_date, good from reply where store_num = 1 order by reply_num desc);

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

commit;

update image set img3 = null where store_num = 1;
select * from image;