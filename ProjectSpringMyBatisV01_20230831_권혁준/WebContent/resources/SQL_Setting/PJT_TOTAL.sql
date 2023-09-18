drop table PJT_MEMBER;
drop table PJT_NOTICE;
drop table PJT_CART;
drop table PJT_EVENT;
drop table PJT_PRODUCT;
drop table PJT_REVIEW;
drop table PJT_QNA;

drop SEQUENCE QNA_SEQ;
drop SEQUENCE REVIEW_SEQ;
drop SEQUENCE EVENT_SEQ;
drop SEQUENCE NOTICE_SEQ;

purge recyclebin;

create table PJT_MEMBER (
	MEM_ID varchar2(50) NOT NULL,
	MEM_PW varchar2(50) NOT NULL,
	MEM_NAME varchar2(100) NOT NULL,
	MEM_BRITH DATE NOT NULL,
	MEM_HP varchar2(50) NOT NULL,
	MEM_EMAIL varchar2(100) NOT NULL,
	MEM_ADDR1 varchar2(500) NOT NULL,
	MEM_ADDR2 varchar2(500) NOT NULL
);

alter table PJT_MEMBER add primary key(MEM_ID);

create table PJT_Notice (
	NT_TITLE varchar2(200) NOT NULL,
	NT_DATE DATE default sysdate,
	NT_CONTENT varchar2(1000) NOT NULL,
	NT_WRITER varchar2(100) NOT NULL,
	NT_NO number not null
);

CREATE SEQUENCE NOTICE_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 1000;

create table PJT_CART (
	CR_NAME varchar2(200) NOT NULL,
	CR_IMG varchar2(100) NOT NULL,
	CR_PRICE VARCHAR2(100) NOT NULL
);

create table PJT_EVENT (
	EVT_NO NUMBER NOT NULL,
	EVT_TITLE varchar2(200) NOT NULL,
	EVT_CONTENT varchar2(200) NOT NULL,
	EVT_DATING varchar2(1000) NOT NULL,
	EVT_WRITER varchar2(100) NOT NULL,
	PRIMARY KEY (EVT_NO)
);

CREATE SEQUENCE EVENT_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 1000;

create table PJT_PRODUCT (
	PD_SNUM varchar2(30) NOT NULL primary key,
	PD_NAME varchar2(200) NOT NULL,
	PD_PRICE varchar2(50) NOT NULL,
	PD_MANY number NOT NULL,
	PD_IMG varchar2(100),
	PD_INFO_IMG varchar2(500),
	PD_CATEGORY varchar2(200) NOT NULL
);

create table PJT_QNA (
	QNA_NO NUMBER NOT NULL,
	QNA_TITLE varchar2(200) NOT NULL,
	QNA_CONTENT varchar2(1000) NOT NULL,
	QNA_WRITER varchar2(100) NOT NULL,
	QNA_PD_NAME varchar2(200) NOT NULL,
	QNA_PD_IMG varchar2(100),
	QNA_DATE DATE default sysdate,
	PRIMARY KEY (QNA_NO)
);

CREATE SEQUENCE QNA_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 1000;

create table PJT_REVIEW (
	RV_NO NUMBER NOT NULL,
	RV_PD_NAME varchar2(200) NOT NULL,
	RV_PD_IMG varchar2(100),
	RV_TITLE varchar2(200) NOT NULL,
	RV_DATE DATE default sysdate,
	RV_CONTENT varchar2(1000) NOT NULL,
	RV_WRITER varchar2(100) NOT NULL,
	PRIMARY KEY (RV_NO)
);

CREATE SEQUENCE REVIEW_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 1000;

insert into PJT_MEMBER values('admin', 'admin', 'admin', '1997-05-07', '010', 'admin@test.com', '대전', '동구');
insert into PJT_MEMBER values('tester001', 'tester001', 'tester001', '2023-03-06', '042-266', 'tester001@test.com', '대전', '서구');
insert into PJT_MEMBER values('tester002', 'tester002', 'tester002', '1923-09-04', '042-624', 'tester002@test.com', '대전', '유성구');

insert into PJT_PRODUCT values('OUTER_001', 'COMA Cotton Sports Jacket [Navy]', '239,000', '200', 'Outer_001.jpg', 'Outer_001_Detail.jpg', '1');
insert into PJT_PRODUCT values('OUTER_002', 'Gun Club Check Sports Jacket [Beige]', '369,000', '200', 'Outer_002.jpg', 'Outer_002_Detail.jpg', '1');
insert into PJT_PRODUCT values('OUTER_003', 'COMA Cotton Sports Jacket [Beige]', '239,000', '200', 'Outer_003.jpg', 'Outer_003_Detail.jpg', '1');
insert into PJT_PRODUCT values('OUTER_004', '[트래드클럽] canterbury 106 suit (6 colors)', '149,000', '200', 'Outer_004.jpeg', 'Outer_004_Detail.jpg', '1');
insert into PJT_PRODUCT values('OUTER_005', 'POCKETABLE IPFU JACKET (BLACK)', '179,000', '200', 'Outer_005.jpg', 'Outer_005_Detail.jpg', '1');
insert into PJT_PRODUCT values('OUTER_006', '[솔티] Q9-1 Herringbone Check Wool Jacket (Khaki)', '279,000', '200', 'Outer_006.jpg', 'Outer_006_Detail.jpg', '1');
insert into PJT_PRODUCT values('OUTER_007', '솔티 Wool Balmacaan Mac Coat (Charcoal)', '365,000', '200', 'Outer_007.jpg', 'Outer_007_Detail.jpg', '1');
insert into PJT_PRODUCT values('OUTER_008', '[솔티] Hound Check Double Coat (Beige)', '369,000', '200', 'Outer_008.jpg', 'Outer_008_Detail.jpg', '1');
insert into PJT_PRODUCT values('OUTER_009', '[솔티] Wool Single Chester Coat (Camel)', '349,000', '200', 'Outer_009.jpg', 'Outer_009_Detail.jpg', '1');
insert into PJT_PRODUCT values('OUTER_010', '[솔티] Wool Single Chester Coat (Dark Gray)', '349,000', '200', 'Outer_010.jpg', 'Outer_010_Detail.jpg', '1');

insert into PJT_PRODUCT values('TOP_001', '[올투스바스터즈] AIRFORCE LOGO T-SHIRT OFF VANILLA', '45,000', '200', 'Top_001.jpg', 'Top_001_Detail.jpg', '2');
insert into PJT_PRODUCT values('TOP_002', '[예일] (OVERSIZED) EMBROIDERY OXFORD SS SHIRT LIGHT BLUE', '53,100', '200', 'Top_002.jpg', 'Top_002_Detail.jpg', '2');
insert into PJT_PRODUCT values('TOP_003', '[예일] (OVERSIZED) EMBROIDERY OXFORD SS SHIRT WHITE', '53,100', '200', 'Top_003.jpg', 'Top_003_Detail.jpg', '2');
insert into PJT_PRODUCT values('TOP_004', '[예일] (OVERSIZED) HERITAGE DAN PK TEE WHITE', '44,100', '200', 'Top_004.jpg', 'Top_004_Detail.jpg', '2');
insert into PJT_PRODUCT values('TOP_005', '[예일] (OVERSIZED) HERITAGE DAN PK TEE BLACK', '44,100', '200', 'Top_005.jpg', 'Top_005_Detail.jpg', '2');
insert into PJT_PRODUCT values('TOP_006', 'SS RNCT Signature Crest SUPIMA Cotton Shirt [Pink]', '139,000', '200', 'Top_006.jpg', 'Top_006_Detail.jpg', '2');
insert into PJT_PRODUCT values('TOP_007', 'SS RNCT Signature Crest SUPIMA Cotton Shirt [Blue]', '139,000', '200', 'Top_007.jpg', 'Top_007_Detail.jpg', '2');
insert into PJT_PRODUCT values('TOP_008', 'RNCT Signature Crest Denim Shirt [D.Blue]', '129,000', '200', 'Top_008.jpg', 'Top_008_Detail.jpg', '2');
insert into PJT_PRODUCT values('TOP_009', 'COMA Cotton ATC Half Sleeve T Shirt [Orange]', '59,000', '200', 'Top_009.jpg', 'Top_009_Detail.jpg', '2');
insert into PJT_PRODUCT values('TOP_010', 'COMA Cotton ATC Half Sleeve T Shirt [Navy]', '59,000', '200', 'Top_010.jpg', 'Top_010_Detail.jpg', '2');

insert into PJT_PRODUCT values('BOTTOM_001', 'COMA Cotton Tailored Two Tuck Shorts [Beige]', '119,000', '200', 'Bottom_001.jpg', 'Bottom_001_Detail.jpg', '3');
insert into PJT_PRODUCT values('BOTTOM_002', 'COMA Cotton Tailored Two Tuck Shorts [Khaki]', '119,000', '200', 'Bottom_002.jpg', 'Bottom_002_Detail.jpg', '3');
insert into PJT_PRODUCT values('BOTTOM_003', 'COMA Cotton Tailored Two Tuck Shorts [Navy]', '119,000', '200', 'Bottom_003.jpg', 'Bottom_003_Detail.jpg', '3');
insert into PJT_PRODUCT values('BOTTOM_004', '[메버릭] Light Blue denim trousers', '103,600', '200', 'Bottom_004.jpg', 'Bottom_004_Detail.jpg', '3');
insert into PJT_PRODUCT values('BOTTOM_005', '[메버릭] Blue denim trousers', '103,600', '200', 'Bottom_005.jpg', 'Bottom_005_Detail.jpg', '3');
insert into PJT_PRODUCT values('BOTTOM_006', 'SUPIMA Cotton Tailored Regular Pants [Beige]', '149,000', '200', 'Bottom_006.jpg', 'Bottom_006_Detail.jpg', '3');
insert into PJT_PRODUCT values('BOTTOM_007', 'SUPIMA Cotton Tailored Regular Pants [Khaki]', '149,000', '200', 'Bottom_007.jpg', 'Bottom_007_Detail.jpg', '3');
insert into PJT_PRODUCT values('BOTTOM_008', 'SUPIMA Cotton Tailored Regular Pants [Black]', '149,000', '200', 'Bottom_008.jpg', 'Bottom_008_Detail.jpg', '3');
insert into PJT_PRODUCT values('BOTTOM_009', '[벨리프] [Easy line] Two tuck Easy Trousers (Black)', '89,000', '200', 'Bottom_009.jpg', 'Bottom_009_Detail.jpg', '3');
insert into PJT_PRODUCT values('BOTTOM_010', '[벨리프] [Easy line] Two tuck Easy Trousers (Navy)', '89,000', '200', 'Bottom_010.jpg', 'Bottom_010_Detail.jpg', '3');

insert into PJT_PRODUCT values('SHOES_001', '[조셉트] Daniel beige', '123,000', '200', 'Shoes_001.jpg', 'Shoes_001_Detail.jpg', '4');
insert into PJT_PRODUCT values('SHOES_002', '[조셉트] Daniel brown', '123,000', '200', 'Shoes_002.jpg', 'Shoes_002_Detail.jpg', '4');
insert into PJT_PRODUCT values('SHOES_003', '[조셉트] Daniel snuff', '123,000', '200', 'Shoes_003.jpg', 'Shoes_003_Detail.jpg', '4');
insert into PJT_PRODUCT values('SHOES_004', '[Josepht] Smith', '98,000', '200', 'Shoes_004.jpg', 'Shoes_004_Detail.jpg', '4');
insert into PJT_PRODUCT values('SHOES_005', '[조셉트] Liccio (여름샌들)', '115,000', '200', 'Shoes_005.jpg', 'Shoes_005_Detail.jpg', '4');
insert into PJT_PRODUCT values('SHOES_006', '[조셉트] SANDAL River (여름샌들)', '115,000', '200', 'Shoes_006.jpg', 'Shoes_006_Detail.jpg', '4');
insert into PJT_PRODUCT values('SHOES_007', '[조셉트] Ralph black(box calf)', '149,000', '200', 'Shoes_007.jpg', 'Shoes_007_Detail.jpg', '4');
insert into PJT_PRODUCT values('SHOES_008', '[조셉트] Josepht 104', '208,000', '200', 'Shoes_008.jpg', 'Shoes_008_Detail.jpg', '4');
insert into PJT_PRODUCT values('SHOES_009', '[조셉트] Jacob gray', '108,000', '200', 'Shoes_009.jpg', 'Shoes_009_Detail.jpg', '4');
insert into PJT_PRODUCT values('SHOES_010', '[조셉트] Jacob pink', '108,000', '200', 'Shoes_010.jpg', 'Shoes_010_Detail.jpg', '4');

insert into PJT_PRODUCT values('ACC_001', 'Two Tone Regimental Silk Rep Tie [Red Navy]', '65,000', '200', 'Acc_001.jpg', 'Acc_001_Detail.jpg', '5');
insert into PJT_PRODUCT values('ACC_002', 'Two Tone Regimental Silk Rep Tie [Green Navy]', '65,000', '200', 'Acc_002.jpg', 'Acc_002_Detail.jpg', '5');
insert into PJT_PRODUCT values('ACC_003', 'Regimental Silk Rep Tie [Green Navy]', '65,000', '200', 'Acc_003.jpg', 'Acc_003_Detail.jpg', '5');
insert into PJT_PRODUCT values('ACC_004', 'Regimental Silk Rep Tie [Yellow Navy]', '65,000', '200', 'Acc_004.jpg', 'Acc_004_Detail.jpg', '5');
insert into PJT_PRODUCT values('ACC_005', 'Regimental Silk Rep Tie [Red Navy]', '65,000', '200', 'Acc_005.jpg', 'Acc_005_Detail.jpg', '5');
insert into PJT_PRODUCT values('ACC_006', '[예일] 예일백팩 SQUARE PACK(+ 여행파우치 증정) 30L', '89,000', '200', 'Acc_006.jpg', 'Acc_006_Detail.jpg', '5');
insert into PJT_PRODUCT values('ACC_007', '[예일] 예일백팩 THINK PACK (+ 여행파우치 증정)', '119,000', '200', 'Acc_007.jpg', 'Acc_007_Detail.jpg', '5');
insert into PJT_PRODUCT values('ACC_008', 'RNCT Signature Crest Cap [Red]', '52,000', '200', 'Acc_008.jpg', 'Acc_008_Detail.jpg', '5');
insert into PJT_PRODUCT values('ACC_009', 'RNCT Signature Crest Cap [Navy]', '52,000', '200', 'Acc_009.jpg', 'Acc_009_Detail.jpg', '5');
insert into PJT_PRODUCT values('ACC_010', 'RNCT Signature Crest Cap [Green]', '52,000', '200', 'Acc_010.jpg', 'Acc_010_Detail.jpg', '5');

insert into PJT_NOTICE values('테스트001', sysdate, '테스트001', 'admin', 1);
insert into PJT_NOTICE values('테스트002', sysdate, '테스트002', 'admin', 2);
insert into PJT_NOTICE values('테스트003', sysdate, '테스트003', 'admin', 3);
insert into PJT_NOTICE values('테스트004', sysdate, '테스트004', 'admin', 4);
insert into PJT_NOTICE values('테스트005', sysdate, '테스트005', 'admin', 5);
insert into PJT_NOTICE values('테스트006', sysdate, '테스트006', 'admin', 6);
insert into PJT_NOTICE values('테스트007', sysdate, '테스트007', 'admin', 7);
insert into PJT_NOTICE values('테스트008', sysdate, '테스트008', 'admin', 8);
insert into PJT_NOTICE values('테스트009', sysdate, '테스트009', 'admin', 9);
insert into PJT_NOTICE values('테스트010', sysdate, '테스트010', 'admin', 10);
insert into PJT_NOTICE values('테스트011', sysdate, '테스트011', 'admin', 11);
insert into PJT_NOTICE values('테스트012', sysdate, '테스트012', 'admin', 12);

insert into PJT_QNA values (1, '재고 질문', '32사이즈 재고 있나요?', 'tester001', 'COMA Cotton Tailored Two Tuck Shorts [Beige]', 'Bottom_001.jpg', sysdate);
insert into PJT_QNA values (2, '재입고 질문', '105 사이즈 언제 재입고될까요?', 'tester002', 'COMA Cotton Sports Jacket [Navy]', 'Outer_001.jpg', sysdate);
insert into PJT_QNA values (3, '사이즈 질문', '32사이즈 재고 있나요?', 'tester003', 'COMA Cotton Tailored Two Tuck Shorts [Beige]', 'Bottom_001.jpg', sysdate);
insert into PJT_QNA values (4, '사이즈 질문', '30사이즈 허리사이즈가 어떻게 되나요?', 'tester002', 'COMA Cotton Tailored Two Tuck Shorts [Navy]', 'Bottom_003.jpg', sysdate);
insert into PJT_QNA values (5, '색상 추가 입고', '나중에 다른 색상도 입고될까요?', 'tester001', '[올투스바스터즈] AIRFORCE LOGO T-SHIRT OFF VANILLA', 'Top_001.jpg', sysdate);
insert into PJT_QNA values (6, '사이즈 질문이요', '175 70 몇 사이즈 입으면 될까요?', 'tester002', '[벨리프] [Easy line] Two tuck Easy Trousers (Navy)', 'Bottom010.jpg', sysdate);
insert into PJT_QNA values (7, '발볼 사이즈 질문', '나이키 에어포스 기준 275신는데 몇 사이즈로 신으면 될까요?', 'tester001', '[조셉트] Josepht 104', 'Shoes_008.jpg', sysdate);
insert into PJT_QNA values (8, '사이즈 질문', '32사이즈 재고 있나요?', 'tester002', 'COMA Cotton Tailored Two Tuck Shorts [Beige]', 'Bottom_001.jpg', sysdate);
insert into PJT_QNA values (9, '사이즈 질문', '32사이즈 재고 있나요?', 'tester002', 'COMA Cotton Tailored Two Tuck Shorts [Beige]', 'Bottom_001.jpg', sysdate);
insert into PJT_QNA values (10, '사이즈 질문', '32사이즈 재고 있나요?', 'tester001', 'COMA Cotton Tailored Two Tuck Shorts [Beige]', 'Bottom_001.jpg', sysdate);
insert into PJT_QNA values (11, '사이즈 질문', '32사이즈 재고 있나요?', 'tester001', 'COMA Cotton Tailored Two Tuck Shorts [Beige]', 'Bottom_001.jpg', sysdate);
insert into PJT_QNA values (12, '사이즈 질문', '32사이즈 재고 있나요?', 'tester002', 'COMA Cotton Tailored Two Tuck Shorts [Beige]', 'Bottom_001.jpg', sysdate);
insert into PJT_QNA values (13, '사이즈 질문', '32사이즈 재고 있나요?', 'tester001', 'COMA Cotton Tailored Two Tuck Shorts [Beige]', 'Bottom_001.jpg', sysdate);
insert into PJT_QNA values (14, '사이즈 질문', '32사이즈 재고 있나요?', 'tester002', 'COMA Cotton Tailored Two Tuck Shorts [Beige]', 'Bottom_001.jpg', sysdate);
insert into PJT_QNA values (15, '사이즈 질문', '32사이즈 재고 있나요?', 'tester001', 'COMA Cotton Tailored Two Tuck Shorts [Beige]', 'Bottom_001.jpg', sysdate);

insert into PJT_EVENT values (1, '테스트 이벤트 001', '테스트 이벤트 001', '2023.08.06 - 2023.08.17', 'admin');
insert into PJT_EVENT values (2, '테스트 이벤트 002', '테스트 이벤트 002', '2023.08.06 - 2023.08.17', 'admin');
insert into PJT_EVENT values (3, '테스트 이벤트 003', '테스트 이벤트 003', '2023.08.06 - 2023.08.17', 'admin');
insert into PJT_EVENT values (4, '테스트 이벤트 004', '테스트 이벤트 004', '2023.08.06 - 2023.08.17', 'admin');
insert into PJT_EVENT values (5, '테스트 이벤트 005', '테스트 이벤트 005', '2023.08.06 - 2023.08.17', 'admin');
insert into PJT_EVENT values (6, '테스트 이벤트 006', '테스트 이벤트 006', '2023.08.06 - 2023.08.17', 'admin');
insert into PJT_EVENT values (7, '테스트 이벤트 007', '테스트 이벤트 007', '2023.08.06 - 2023.08.17', 'admin');
insert into PJT_EVENT values (8, '테스트 이벤트 008', '테스트 이벤트 008', '2023.08.06 - 2023.08.17', 'admin');
insert into PJT_EVENT values (9, '테스트 이벤트 009', '테스트 이벤트 009', '2023.08.06 - 2023.08.17', 'admin');
insert into PJT_EVENT values (10, '테스트 이벤트 010', '테스트 이벤트 010', '2023.08.06 - 2023.08.17', 'admin');
insert into PJT_EVENT values (11, '테스트 이벤트 011', '테스트 이벤트 011', '2023.08.06 - 2023.08.17', 'admin');
insert into PJT_EVENT values (12, '테스트 이벤트 012', '테스트 이벤트 012', '2023.08.06 - 2023.08.17', 'admin');
insert into PJT_EVENT values (13, '테스트 이벤트 013', '테스트 이벤트 013', '2023.08.06 - 2023.08.17', 'admin');
insert into PJT_EVENT values (14, '테스트 이벤트 014', '테스트 이벤트 014', '2023.08.06 - 2023.08.17', 'admin');
insert into PJT_EVENT values (15, '테스트 이벤트 015', '테스트 이벤트 015', '2023.08.06 - 2023.08.17', 'admin');
insert into PJT_EVENT values (16, '테스트 이벤트 016', '테스트 이벤트 016', '2023.08.06 - 2023.08.17', 'admin');

insert into PJT_REVIEW values (1, '[트래드클럽] canterbury 106 suit (6 colors)', 'Outer_004.jpeg', '테스트 리뷰 001', sysdate, '테스트 리뷰 001', 'tester001');
insert into PJT_REVIEW values (2, '[트래드클럽] canterbury 106 suit (6 colors)', 'Outer_004.jpeg', '테스트 리뷰 002', sysdate, '테스트 리뷰 002', 'tester002');
insert into PJT_REVIEW values (3, '[트래드클럽] canterbury 106 suit (6 colors)', 'Outer_004.jpeg', '테스트 리뷰 003', sysdate, '테스트 리뷰 003', 'tester002');
insert into PJT_REVIEW values (4, '[트래드클럽] canterbury 106 suit (6 colors)', 'Outer_004.jpeg', '테스트 리뷰 004', sysdate, '테스트 리뷰 004', 'tester001');
insert into PJT_REVIEW values (5, '[트래드클럽] canterbury 106 suit (6 colors)', 'Outer_004.jpeg', '테스트 리뷰 005', sysdate, '테스트 리뷰 005', 'tester002');
insert into PJT_REVIEW values (6, '[트래드클럽] canterbury 106 suit (6 colors)', 'Outer_004.jpeg', '테스트 리뷰 006', sysdate, '테스트 리뷰 006', 'tester001');
insert into PJT_REVIEW values (7, '[트래드클럽] canterbury 106 suit (6 colors)', 'Outer_004.jpeg', '테스트 리뷰 007', sysdate, '테스트 리뷰 007', 'tester001');
insert into PJT_REVIEW values (8, '[트래드클럽] canterbury 106 suit (6 colors)', 'Outer_004.jpeg', '테스트 리뷰 008', sysdate, '테스트 리뷰 008', 'tester003');
insert into PJT_REVIEW values (9, '[트래드클럽] canterbury 106 suit (6 colors)', 'Outer_004.jpeg', '테스트 리뷰 009', sysdate, '테스트 리뷰 009', 'tester006');
insert into PJT_REVIEW values (10, '[트래드클럽] canterbury 106 suit (6 colors)', 'Outer_004.jpeg', '테스트 리뷰 010', sysdate, '테스트 리뷰 010', 'tester005');
insert into PJT_REVIEW values (11, '[트래드클럽] canterbury 106 suit (6 colors)', 'Outer_004.jpeg', '테스트 리뷰 011', sysdate, '테스트 리뷰 011', 'tester001');
insert into PJT_REVIEW values (12, '[트래드클럽] canterbury 106 suit (6 colors)', 'Outer_004.jpeg', '테스트 리뷰 012', sysdate, '테스트 리뷰 012', 'tester002');
insert into PJT_REVIEW values (13, '[트래드클럽] canterbury 106 suit (6 colors)', 'Outer_004.jpeg', '테스트 리뷰 013', sysdate, '테스트 리뷰 013', 'tester002');
insert into PJT_REVIEW values (14, '[트래드클럽] canterbury 106 suit (6 colors)', 'Outer_004.jpeg', '테스트 리뷰 014', sysdate, '테스트 리뷰 014', 'tester001');
insert into PJT_REVIEW values (15, '[트래드클럽] canterbury 106 suit (6 colors)', 'Outer_004.jpeg', '테스트 리뷰 015', sysdate, '테스트 리뷰 015', 'tester002');
insert into PJT_REVIEW values (16, '[트래드클럽] canterbury 106 suit (6 colors)', 'Outer_004.jpeg', '테스트 리뷰 016', sysdate, '테스트 리뷰 016', 'tester001');

commit;