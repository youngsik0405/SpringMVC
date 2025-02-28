SELECT USER
FROM DUAL;
--==>> SCOTT

-- mvc06_scott.sql

--○ 기존 테이블 제거
DROP TABLE TBL_MEMBERLIST;
--==>> Table TBL_MEMBERLIST이(가) 삭제되었습니다.


--○ 실습 테이블 다시 생성
CREATE TABLE TBL_MEMBERLIST
( ID    VARCHAR(30)
, PW    VARCHAR(30)
, NAME  VARCHAR(50)
, TEL   VARCHAR(50)
, EMAIL VARCHAR(100)
, CONSTRAINT MEMBERLIST_ID_PK PRIMARY KEY(ID)
);
--==>> Table TBL_MEMBERLIST이(가) 생성되었습니다.

--○ 데이터 입력
INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL)
VALUES('admin', CRYPTPACK.ENCRYPT('java006$', 'java006$'), '박세진', '010-4197-6627', 'psj@test.com');
--> 한 줄 구성
INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL) VALUES('admin', CRYPTPACK.ENCRYPT('java006$', 'java006$'), '박세진', '010-4197-6627', 'psj@test.com')
;
--==>> 1 행 이(가) 삽입되었습니다.


--○ 확인
SELECT ID, PW, NAME, TEL, EMAIL
FROM TBL_MEMBERLIST;
--==>> admin	???^	박세진	010-4197-6627	psj@test.com


--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 리스트 조회 쿼리문 구성
SELECT ID, PW, NAME, TEL, EMAIL
FROM TBL_MEMBERLIST;
--> 한 줄 구성
SELECT ID, PW, NAME, TEL, EMAIL FROM TBL_MEMBERLIST
;
