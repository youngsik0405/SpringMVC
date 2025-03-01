SELECT USER
FROM DUAL; 
--==>> SCOTT


--○ 실습 테이블 생성
-- 테이블명 : REGION
CREATE TABLE REGION                             -- 지역 테이블
( REGIONID      NUMBER                          -- 지역 아이디 → PK
, REGIONNAME    VARCHAR2(30)                    -- 지역 명
, CONSTRAINT REGION_ID_PK PRIMARY KEY(REGIONID)
);
--==>> Table REGION이(가) 생성되었습니다.

--○ 시퀀스 생성
-- 시퀀스명 : REGIONSEQ
CREATE SEQUENCE REGIONSEQ
NOCACHE;
--==>> Sequence REGIONSEQ이(가) 생성되었습니다.


--○ 데이터 입력(지역 데이터)
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '서울');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '경기');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '인천');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '대전');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '광주');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '대구');
--==>> 1 행 이(가) 삽입되었습니다 * 6

--○ 지역 리스트 확인
SELECT REGIONID, REGIONNAME
FROM REGION;
--> 한 줄 구성
SELECT REGIONID, REGIONNAME FROM REGION
;
/*
1	서울
2	경기
3	인천
4	대전
5	광주
6	대구
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.


--○ 실습 테이블 생성
-- 테이블 명 : POSITION
CREATE TABLE POSITION
( POSITIONID    NUMBER          -- 직위 아이디   --  PK
, POSITIONNAME  VARCHAR2(30)    -- 직위 명
, MINBASICPAY   NUMBER          -- 최소 기본급
, CONSTRAINT POSITION_ID_PK PRIMARY KEY(POSITIONID)
);
--==>> Table POSITION이(가) 생성되었습니다.

--○ 시퀀스 생성
-- 시퀀스명 : POSITIONSEQ
CREATE SEQUENCE POSITIONSEQ
NOCACHE;
--==>> Sequence POSITIONSEQ이(가) 생성되었습니다.

--○ 직위 데이터 입력
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '사원', 1000000);
--> 한 줄 구성
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY) VALUES(POSITIONSEQ.NEXTVAL, '사원', 1000000);
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY) VALUES(POSITIONSEQ.NEXTVAL, '대리', 2000000);
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY) VALUES(POSITIONSEQ.NEXTVAL, '과장', 3000000);
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY) VALUES(POSITIONSEQ.NEXTVAL, '부장', 4000000);
--==>> 1 행 이(가) 삽입되었습니다 * 4


--○ 직위 리스트 확인
SELECT POSITIONID, POSITIONNAME, MINBASICPAY
FROM POSITION;
--> 한 줄 구성
SELECT POSITIONID, POSITIONNAME, MINBASICPAY FROM POSITION
;
--==>>
/*
1	사원	1000000
2	대리	2000000
3	과장	3000000
4	부장	4000000
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.


--○ 실습 데이터 생성
-- 테이블명 : DEPARTMENT
CREATE TABLE DEPARTMENT
( DEPARTMENTID      NUMBER              -- 부서 아이디   -- PK
, DEPARTMENTNAME    VARCHAR2(30)        -- 부서 명
, CONSTRAINT DEPARTMENT_ID_PK PRIMARY KEY(DEPARTMENTID)
);
--==>> Table DEPARTMENT이(가) 생성되었습니다.


--○ 시퀀스 생성
-- 시퀀스명 : DEPARTMENTSEQ
CREATE SEQUENCE DEPARTMENTSEQ
NOCACHE;
--==>> Sequence DEPARTMENTSEQ이(가) 생성되었습니다.


--○ 데이터 입력
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME)
VALUES(DEPARTMENTSEQ.NEXTVAL, '개발부');
--> 한 줄 구성
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '개발부');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '기획부');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '영업부');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '자재부');
--==>> 1 행 이(가) 삽입되었습니다.*4


--○ 부서 리스트 확인
SELECT DEPARTMENTID, DEPARTMENTNAME
FROM DEPARTMENT;
--> 한 줄 구성
SELECT DEPARTMENTID, DEPARTMENTNAME FROM DEPARTMENT
;
--==>>
/*
1	개발부
2	기획부
3	영업부
4	자재부
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 실습 테이블 생성
-- 테이블명 : 직원
-- 사원명, 주민번호, 생년월일, 양음력, 전화번호, 부서, 직위, 지역, 기본급, 수당
CREATE TABLE EMPLOYEE
( EMPLOYEEID    NUMBER                  -- 사원 번호        -- PK
, NAME          VARCHAR2(30)            -- 사원 명
, SSN           VARCHAR2(20)            -- 주민번호         -- 암호화 기능 적용(TYPE CHECK~!!!)
, BIRTHDAY      DATE                    -- 생년월일
, LUNAR         NUMBER(1) DEFAULT 0     -- 양음력           -- CK (양력0, 음력1)
, TELEPHONE     VARCHAR2(40)            -- 전화번호
, DEPARTMENTID  NUMBER                  -- 부서 아이디      -- FK
, POSITIONID    NUMBER                  -- 직위 아이디      -- FK
, REGIONID      NUMBER                  -- 지역 아이디      -- FK
, BASICPAY      NUMBER                  -- 기본급
, EXTRAPAY      NUMBER                  -- 수당
, CONSTRAINT EMPLOYEE_ID_PK PRIMARY KEY(EMPLOYEEID)
, CONSTRAINT EMPLOYEE_DEPARTMENTID_FK FOREIGN KEY(DEPARTMENTID)
             REFERENCES DEPARTMENT(DEPARTMENTID)
, CONSTRAINT EMPLOYEE_POSITIONID_FK FOREIGN KEY(POSITIONID)
             REFERENCES POSITION(POSITIONID)
, CONSTRAINT EMPLOYEE_REGIONID_FK FOREIGN KEY(REGIONID)
             REFERENCES REGION(REGIONID)
, CONSTRAINT EMPLOYEE_LUNAR_CK CHECK(LUNAR=0 OR LUNAR=1)
);
--==>> Table EMPLOYEE이(가) 생성되었습니다.


--○ 시퀀스 생성
-- 시퀀스명 : EMPLOYEESEQ
CREATE SEQUENCE EMPLOYEESEQ
NOCACHE;
--==>> Sequence EMPLOYEESEQ이(가) 생성되었습니다.


--○ 데이터 입력(직원 데이터)
INSERT INTO EMPLOYEE( EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR
                    , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                    , BASICPAY, EXTRAPAY)
VALUES(EMPLOYEESEQ.NEXTVAL, '곽유진', CRYPTPACK.ENCRYPT('9901192234567', '9901192234567')
      , TO_DATE('1999-01-19', 'YYYY-MM-DD'), 1, '010-2678-8029', 1, 2, 1
               , 2500000, 1000000);
--> 한 줄 구성
INSERT INTO EMPLOYEE( EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY) VALUES(EMPLOYEESEQ.NEXTVAL, '곽유진', CRYPTPACK.ENCRYPT('9901192234567', '9901192234567'), TO_DATE('1999-01-19', 'YYYY-MM-DD'), 1, '010-2678-8029', 1, 2, 1, 2500000, 1000000)
;
--==>> 1 행 이(가) 삽입되었습니다.

--○ 확인
SELECT *
FROM EMPLOYEE;
--==>> 1	곽유진	|????V?Zm	1999-01-19	1	010-2678-8029	1	2	1	2500000	1000000

--○ 커밋
COMMIT;
--==>> 커밋 완료.


DESC EMPLOYEE;
--==>>
/*
이름           널?       유형           
------------ -------- ------------ 
EMPLOYEEID   NOT NULL NUMBER       
NAME                  VARCHAR2(30) 
SSN                   VARCHAR2(20) 
BIRTHDAY              DATE         
LUNAR                 NUMBER(1)    
TELEPHONE             VARCHAR2(40) 
DEPARTMENTID          NUMBER       
POSITIONID            NUMBER       
REGIONID              NUMBER       
BASICPAY              NUMBER       
EXTRAPAY              NUMBER

*/


--○ 직원 데이터 조회 쿼리문 구성
SELECT E.EMPLOYEEID
     , E.NAME
     , E.SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR
     , DECODE(E.LUNAR, 0, '양력', 1, '음력') AS LUNARNAME
     , E.TELEPHONE
     , E.DEPARTMENTID
     , (SELECT DEPARTMENTNAME
        FROM DEPARTMENT
        WHERE DEPARTMENTID=E.DEPARTMENTID) AS DEPARTMENTNAME
    , E.POSITIONID
    , (SELECT POSITIONNAME
       FROM POSITION
       WHERE POSITIONID=E.POSITIONID) AS POSITIONNAME
    , E.REGIONID
    , (SELECT REGIONNAME
       FROM REGION
       WHERE REGIONID=E.REGIONID) AS REGIONNAME
    , E.BASICPAY
    , E.EXTRAPAY
    , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
FROM EMPLOYEE E;
--==>> 1	곽유진	|????V?Zm	1999-01-19	1	음력	010-2678-8029	1	개발부	2	대리	1	서울	2500000	1000000	3500000


--○ 뷰 생성
-- 뷰명 : EMPLOYEEVIEW
CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID
     , E.NAME
     , E.SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR
     , DECODE(E.LUNAR, 0, '양력', 1, '음력') AS LUNARNAME
     , E.TELEPHONE
     , E.DEPARTMENTID
     , (SELECT DEPARTMENTNAME
        FROM DEPARTMENT
        WHERE DEPARTMENTID=E.DEPARTMENTID) AS DEPARTMENTNAME
    , E.POSITIONID
    , (SELECT POSITIONNAME
       FROM POSITION
       WHERE POSITIONID=E.POSITIONID) AS POSITIONNAME
    , E.REGIONID
    , (SELECT REGIONNAME
       FROM REGION
       WHERE REGIONID=E.REGIONID) AS REGIONNAME
    , E.BASICPAY
    , E.EXTRAPAY
    , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
FROM EMPLOYEE E;
--==>> View EMPLOYEEVIEW이(가) 생성되었습니다.


--○ 지역 데이터 조회 쿼리문 구성
-- ※ 지역 데이터 삭제 가능여부 확인 속성(DELCHECK) 포함
SELECT R.REGIONID, R.REGIONNAME
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE REGIONID=R.REGIONID) AS DELCHECK
FROM REGION R;
--==>>
/*
1	서울	1   → 삭제 불가
2	경기	0   → 삭제 가능
3	인천	0   → 삭제 가능
4	대전	0   → 삭제 가능
5	광주	0   → 삭제 가능
6	대구	0   → 삭제 가능
*/
--> 『서울』의 지역 데이터는 삭제가 불가능한 상황이며
--  『경기』, 『인천』, 『대전』, 『광주』, 『대구』의 지역 데이터는
--  삭제가 가능한 상황임을 판별할 수 있는 쿼리문


--○ 뷰 생성
-- 뷰명 : REGIONVIEW
CREATE OR REPLACE VIEW REGIONVIEW
AS
SELECT R.REGIONID, R.REGIONNAME
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE REGIONID=R.REGIONID) AS DELCHECK
FROM REGION R;
--==>> View REGIONVIEW이(가) 생성되었습니다.


--○ 직위 데이터 조회 쿼리문 구성
-- ※ 직위 데이터 삭제 가능여부 확인 속성(DELCHECK) 포함
SELECT P.POSITIONID, P.POSITIONNAME, P.MINBASICPAY
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE POSITIONID=P.POSITIONID) AS DELCHECK
FROM POSITION P;
--==>>
/*
POSITIONID POSITIONNAME                   MINBASICPAY   DELCHECK
---------- ------------------------------ ----------- ----------
         1 사원                               1000000          0  → 삭제 가능
         2 대리                               2000000          1  → 삭제 불가
         3 과장                               3000000          0  → 삭제 가능
         4 부장                               4000000          0  → 삭제 가능 
*/


--○ 뷰 생성
-- 뷰명 : POSITIONVIEW
CREATE OR REPLACE VIEW POSITIONVIEW
AS
SELECT P.POSITIONID, P.POSITIONNAME, P.MINBASICPAY
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE POSITIONID=P.POSITIONID) AS DELCHECK
FROM POSITION P;
--==>> View POSITIONVIEW이(가) 생성되었습니다.


--○ 부서 데이터 조회 쿼리문 구성
-- ※ 부서 데이터 삭제 가능여부 확인 속성(DELCHECK) 포함
SELECT D.DEPARTMENTID, D.DEPARTMENTNAME
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE DEPARTMENTID=D.DEPARTMENTID) AS DELCHECK
FROM DEPARTMENT D;
--==>>
/*
DEPARTMENTID DEPARTMENTNAME                   DELCHECK
------------ ------------------------------ ----------
           1 개발부                                  1     → 삭제 불가
           2 기획부                                  0
           3 영업부                                  0
           4 자재부                                  0
*/


--○ 뷰 생성
-- 뷰명 : DEPARTMENTVIEW
CREATE OR REPLACE VIEW DEPARTMENTVIEW
AS
SELECT D.DEPARTMENTID, D.DEPARTMENTNAME
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE DEPARTMENTID=D.DEPARTMENTID) AS DELCHECK
FROM DEPARTMENT D;
--==>> View DEPARTMENTVIEW이(가) 생성되었습니다.


--○ 직위별 최소 기본급 조회 쿼리문 구성
SELECT MINBASICPAY
FROM POSITION
WHERE POSITIONID=1;     -- 사원
--> 한 줄 구성
SELECT MINBASICPAY FROM POSITION WHERE POSITIONID=1
;
--==>> 1000000



--------------------------------------------------------------------------------

--○ 로그인, 로그아웃 과정 추가

-- ID 와 PW 컬럼 데이터를 담고있는 별도의 테이블이 존재하지 않는 상황이다.
-- 이와 관련하여 EMPLOYEEID(사원아이디)와 SSN(주민번호) 뒤 7자리의 숫자를
-- 활용할 수 있도록 구성한다.

--※ 기존 테이블 구조 변경
--①
-- EMPLOYEE(직원 테이블)의 SSN(주민번호) 컬럼을 분리한다.
-- SSN ----------------------→ SSN1, SSN2
-- SSN1 : 주민번호 앞 6자리
-- SSN2 : 주민번호 뒷 7자리 → 암호화 적용 → 패스워드 활용

--②
-- EMPLOYEE(직원 테이블)의 GRADE(등급) 컬럼을 추가한다.
-- GRADE → 0:관리자, 1:일반사원

--①-1. 컬럼 추가
ALTER TABLE EMPLOYEE
ADD(SSN1 CHAR(6), SSN2 VARCHAR2(50));
--==>> Table EMPLOYEE이(가) 변경되었습니다.

SELECT *
FROM EMPLOYEE;

-- SSN → 암호화('9901192234567', '9901192234567')

-- SSN1 → SUBSTR(복호화(대상, '9901192234567'), 1, 6) → '990119'
-- SSN2 → 암호화(SUBSTR(복호화(대상, '9901192234567'), 7, 7)
--               , SUBSTR(복호화(대상, '9901192234567'), 7, 7)); → 암호화된 '2234567' 

UPDATE EMPLOYEE
SET SSN1 = SUBSTR(복호화(대상, '9901192234567'), 1, 6)
  , SSN2 = 암호화(SUBSTR(복호화(대상, '9901192234567'), 7, 7)
                 , SUBSTR(복호화(대상, '9901192234567'), 7, 7));


UPDATE EMPLOYEE
SET SSN1 = SUBSTR(CRYPTPACK.DECRYPT(SSN, '9901192234567'), 1, 6)
  , SSN2 = CRYPTPACK.ENCRYPT(SUBSTR(CRYPTPACK.DECRYPT(SSN, '9901192234567'), 7, 7)
                 , SUBSTR(CRYPTPACK.DECRYPT(SSN, '9901192234567'), 7, 7));
--==>> 1 행 이(가) 업데이트되었습니다.

SELECT *
FROM EMPLOYEE;
--==>> 1	곽유진	|????V?Zm	1999-01-19	1	010-2678-8029	1	2	1	2500000	1000000	990119	Y{?7?


-- 기존의 주민번호 컬럼(SSN) 제거
ALTER TABLE EMPLOYEE
DROP COLUMN SSN;
--==>> Table EMPLOYEE이(가) 변경되었습니다.

SELECT *
FROM EMPLOYEE;
--==>> 1	곽유진	1999-01-19	1	010-2678-8029	1	2	1	2500000	1000000	990119	Y{?7?

DESC EMPLOYEE;
--==>>
/*
이름           널?       유형           
------------ -------- ------------ 
EMPLOYEEID   NOT NULL NUMBER       
NAME                  VARCHAR2(30) 
BIRTHDAY              DATE         
LUNAR                 NUMBER(1)    
TELEPHONE             VARCHAR2(40) 
DEPARTMENTID          NUMBER       
POSITIONID            NUMBER       
REGIONID              NUMBER       
BASICPAY              NUMBER       
EXTRAPAY              NUMBER       
SSN1                  CHAR(6)      
SSN2                  VARCHAR2(50) 
*/

-- 컬럼 추가 : GRADE → 기본값 1을 일반사원으로 구성
--                             0은 관리자로 구성

ALTER TABLE EMPLOYEE
ADD GRADE NUMBER(1) DEFAULT 1;
--==>> Table EMPLOYEE이(가) 변경되었습니다.


SELECT *
FROM EMPLOYEE;
--==>> 1	곽유진	1999-01-19	1	010-2678-8029	1	2	1	2500000	1000000	990119	Y{?7?	1


-- 곽유진 사원을 관리자로 임명
UPDATE EMPLOYEE
SET GRADE=0
WHERE EMPLOYEEID=1;
--==>> 1 행 이(가) 업데이트되었습니다.


SELECT *
FROM EMPLOYEE;
--==>> 1	곽유진	1999-01-19	1	010-2678-8029	1	2	1	2500000	1000000	990119	Y{?7?	0


COMMIT;
--==>> 커밋 완료.


SELECT *
FROM EMPLOYEEVIEW;
--==>> 에러발생


--※ 테이블의 구조를 변경했기 때문에
--   이를 기반으로 생성한 뷰(VIEW)의 내용을 새로 작성(수정)
CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID AS EMPLOYEEID
     , E.NAME AS NAME
     , E.SSN1 AS SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR AS LUNAR
     , DECODE(E.LUNAR, 0, '양력', 1, '음력') AS LUNARNAME
     , E.TELEPHONE AS TELEPHONE
     , E.DEPARTMENTID AS DEPARTMENTID
     , (SELECT DEPARTMENTNAME
        FROM DEPARTMENT
        WHERE DEPARTMENTID=E.DEPARTMENTID) AS DEPARTMENTNAME
    , E.POSITIONID AS POSITIONID
    , (SELECT POSITIONNAME
       FROM POSITION
       WHERE POSITIONID=E.POSITIONID) AS POSITIONNAME
    , E.REGIONID AS REGIONID
    , (SELECT REGIONNAME 
       FROM REGION
       WHERE REGIONID=E.REGIONID) AS REGIONNAME
    , E.BASICPAY AS BASICPAY
    , E.EXTRAPAY AS EXTRAPAY
    , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
    , E.GRADE AS GRADE
FROM EMPLOYEE E;
--==>> View EMPLOYEEVIEW이(가) 생성되었습니다.


SELECT *
FROM EMPLOYEEVIEW;
--==>> 1	곽유진	990119	1999-01-19	1	음력	010-2678-8029	1	개발부	2	대리	1	서울	2500000	1000000	3500000	0

SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR, LUNARNAME, TELEPHONE, DEPARTMENTID, DEPARTMENTNAME, POSITIONID, POSITIONNAME, REGIONID, REGIONNAME, BASICPAY, EXTRAPAY, PAY, GRADE FROM EMPLOYEEVIEW
;

DESC EMPLOYEEVIEW;
--==>>
/*
이름             널?       유형           
-------------- -------- ------------ 
EMPLOYEEID     NOT NULL NUMBER       
NAME                    VARCHAR2(30) 
SSN                     CHAR(6)      
BIRTHDAY                VARCHAR2(10) 
LUNAR                   NUMBER(1)    
LUNARNAME               VARCHAR2(6)  
TELEPHONE               VARCHAR2(40) 
DEPARTMENTID            NUMBER       
DEPARTMENTNAME          VARCHAR2(30) 
POSITIONID              NUMBER       
POSITIONNAME            VARCHAR2(30) 
REGIONID                NUMBER       
REGIONNAME              VARCHAR2(30) 
BASICPAY                NUMBER       
EXTRAPAY                NUMBER       
PAY                     NUMBER       
GRADE                   NUMBER(1)    
*/


--○ 직원 데이터 입력 쿼리문 수정
INSERT INTO EMPLOYEE( EMPLOYEEID, NAME, SSN1, SSN2, BIRTHDAY, LUNAR
                    , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                    , BASICPAY, EXTRAPAY)
VALUES(EMPLOYEESEQ.NEXTVAL, '윤영식', '920405', CRYPTPACK.ENCRYPT('1234567', '1234567')
      , TO_DATE('1992-04-05', 'YYYY-MM-DD'), 0, '010-9565-6512', 1, 1, 1
               , 1500000, 1500000);
--> 한 줄 구성
INSERT INTO EMPLOYEE( EMPLOYEEID, NAME, SSN1, SSN2, BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY) VALUES(EMPLOYEESEQ.NEXTVAL, '윤영식', '920405', CRYPTPACK.ENCRYPT('1234567', '1234567'), TO_DATE('1992-04-05', 'YYYY-MM-DD'), 0, '010-9565-6512', 1, 1, 1, 1500000, 1500000)
;
--==>> 1 행 이(가) 삽입되었습니다.


SELECT *
FROM EMPLOYEE;
--==>>
/*
1	곽유진	1999-01-19	1	010-2678-8029	1	2	1	2500000	1000000	990119	Y{?7?	0
2	윤영식	1992-04-05	0	010-9565-6512	1	1	1	1500000	1500000	920405	=o???	1
*/


COMMIT;
--==>> 커밋 완료.


--○ 로그인 쿼리문 구성
-- 일반 사원 → ID:EMPLOYEEID, PW:SSN2
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID='입력아이디'
  AND SSN2='암호화된입력패스워드';

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2=CRYPTPACK.ENCRYPT('1234567', '1234567');
--> 한 줄 구성
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=2 AND SSN2=CRYPTPACK.ENCRYPT('1234567', '1234567')
;
--==>> 윤영식
--> 치환
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=입력아이디 AND SSN2=CRYPTPACK.ENCRYPT(입력패스워드, 입력패스워드)
;

--○ 로그인 쿼리문 구성
-- 관리자 → ID:EMPLOYEEID, PW:SSN2, GRADE:0
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2=CRYPTPACK.ENCRYPT('1234567', '1234567')
  AND GRADE=0;
--==>> 조회 결과 없음 → 관리자 로그인 실패

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=1
  AND SSN2=CRYPTPACK.ENCRYPT('2234567', '2234567')
  AND GRADE=0;
--==>> 곽유진 → 관리자 로그인 성공
--> 한 줄 구성
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=1 AND SSN2=CRYPTPACK.ENCRYPT('2234567', '2234567') AND GRADE=0
;
--> 치환
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=입력아이디 AND SSN2=CRYPTPACK.ENCRYPT(입력패스워드, 입력패스워드) AND GRADE=0
;


--○ 직원 데이터 삭제 쿼리문 구성
DELETE
FROM EMPLOYEE
WHERE EMPLOYEEID=2;
--> 한 줄 구성
DELETE FROM EMPLOYEE WHERE EMPLOYEEID=2
;
--==>> 1 행 이(가) 삭제되었습니다.

ROLLBACK;
--==>> 롤백 완료.

--○ 직원 데이터 수정 쿼리문 구성
UPDATE EMPLOYEE
SET NAME='윤영식'
  , BIRTHDAY=TO_DATE('1992-04-05', 'YYYY-MM-DD')
  , LUNAR=0
  , TELEPHONE='010-9565-6512'
  , DEPARTMENTID=2
  , POSITIONID=1
  , REGIONID=2
  , BASICPAY=1500000
  , EXTRAPAY=1500000
  , SSN1='920405'
  , SSN2=CRYPTPACK.ENCRYPT('1234567','1234567')
WHERE EMPLOYEEID=2;
--> 한 줄 구성
UPDATE EMPLOYEE SET NAME='윤영식', BIRTHDAY=TO_DATE('1992-04-05', 'YYYY-MM-DD'), LUNAR=0, TELEPHONE='010-9565-6512', DEPARTMENTID=2, POSITIONID=1, REGIONID=2, BASICPAY=1500000, EXTRAPAY=1500000, SSN1='920405', SSN2=CRYPTPACK.ENCRYPT('1234567','1234567') WHERE EMPLOYEEID=2
;
--==>> 1 행 이(가) 업데이트되었습니다.

COMMIT;
--==>> 커밋 완료.


--○ 부서 리스트 조회 쿼리문 구성(DEPARTMENTVIEW)
SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK
FROM DEPARTMENTVIEW
ORDER BY DEPARTMENTID;
--> 한 줄 구성
SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK FROM DEPARTMENTVIEW ORDER BY DEPARTMENTID
;
--==>>
/*
1	개발부	1
2	기획부	1
3	영업부	0
4	자재부	0
*/


--○ 부서 데이터 입력 쿼리문 구성(DEPARTMENT)
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '총무부')
;
--==>> 1 행 이(가) 삽입되었습니다.


COMMIT;
--==>> 커밋 완료.


DELETE
FROM DEPARTMENT
WHERE DEPARTMENTID=3;
--> 한 줄 구성
DELETE FROM DEPARTMENT WHERE DEPARTMENTID=3
;
--==>> 1 행 이(가) 삭제되었습니다.

ROLLBACK;
--==>> 롤백 완료.


--○ 부서 데이터 수정 쿼리문 구성(DEPARTMENT)
UPDATE DEPARTMENT
SET DEPARTMENTNAME='인사부'
WHERE DEPARTMENTID=2;
--> 한 줄 구성
UPDATE DEPARTMENT SET DEPARTMENTNAME='인사부' WHERE DEPARTMENTID=2
;
--==>> 1 행 이(가) 업데이트되었습니다.

ROLLBACK;
--==>> 롤백 완료.


--○ 지역 리스트 조회 쿼리문 구성(REGIONVIEW)
SELECT REGIONID, REGIONNAME, DELCHECK
FROM REGIONVIEW
ORDER BY REGIONID;
--> 한 줄 구성
SELECT REGIONID, REGIONNAME, DELCHECK FROM REGIONVIEW ORDER BY REGIONID
;
--==>> 
/*
1	서울	2
2	경기	0
3	인천	0
4	대전	0
5	광주	0
6	대구	0
*/


--○ 지역 데이터 등록 쿼리문 구성(REGION)
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '강원')
;
--==>> 1 행 이(가) 삽입되었습니다.

COMMIT;
--==>> 커밋 완료.


--○ 지역 데이터 삭제 쿼리문 구성(REGION)
DELETE
FROM REGION
WHERE REGIONID=2;
--> 한 줄 구성
DELETE FROM REGION WHERE REGIONID=2
;
--==>> 1 행 이(가) 삭제되었습니다.

ROLLBACK;
--==>> 롤백 완료.


--○ 지역 데이터 수정 쿼리문 구성(REGION)
UPDATE REGION
SET REGIONNAME='제주'
WHERE REGIONID=4;
--> 한 줄 구성
UPDATE REGION SET REGIONNAME='제주' WHERE REGIONID=4
;
--==>> 1 행 이(가) 업데이트되었습니다.

ROLLBACK;
--==>> 롤백 완료.


--○ 직위 리스트 조회 쿼리문 구성(POSITIONVIEW)
SELECT POSITIONID, POSITIONNAME, DELCHECK
FROM POSITIONVIEW
ORDER BY POSITIONID;
--> 한 줄 구성
SELECT POSITIONID, POSITIONNAME, DELCHECK FROM POSITIONVIEW ORDER BY POSITIONID
;
--==>>
/*
1	사원	1
2	대리	1
3	과장	0
4	부장	0
*/


--○ 직위 데이터 등록 쿼리문 구성(POSITION)
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY) VALUES(POSITIONSEQ.NEXTVAL, '상무', 5000000)
;
--==>> 1 행 이(가) 삽입되었습니다.

COMMIT;
--==>> 커밋 완료.


--○ 직위 데이터 삭제 쿼리문 구성(POSITION)
DELETE
FROM POSITION
WHERE POSITIONID=5;
--> 한 줄 구성
DELETE FROM POSITION WHERE POSITIONID=5
;
--==>> 1 행 이(가) 삭제되었습니다.

ROLLBACK;
--==>> 롤백 완료.


--○ 직위 데이터 수정 쿼리문 구성(POSITION)
UPDATE POSITION
SET POSITIONNAME='주임', MINBASICPAY=123456
WHERE POSITIONID=2;
--> 한 줄 구성
UPDATE POSITION SET POSITIONNAME='주임', MINBASICPAY=123456 WHERE POSITIONID=2
;
--==>> 1 행 이(가) 업데이트되었습니다.

ROLLBACK;
--==>> 롤백 완료.


--○ 아이디로 직원 검색 쿼리문 구성(EMPLOYEE)
SELECT EMPLOYEEID, NAME, SSN1
     , TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID 
     , BASICPAY, EXTRAPAY
FROM EMPLOYEE
WHERE EMPLOYEEID=2;
--> 한 줄 구성
SELECT EMPLOYEEID, NAME, SSN1, TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY FROM EMPLOYEE WHERE EMPLOYEEID=2
;
--==>> 2	윤영식	920405	1992-04-05	0	010-9565-6512	2	1	1	1500000	1500000


DESC EMPLOYEEVIEW;


EMPLOYEEID            
NAME                    
SSN                        
BIRTHDAY                 
LUNAR                      
LUNARNAME               
TELEPHONE              
DEPARTMENTID                 
DEPARTMENTNAME          
POSITIONID                 
POSITIONNAME             
REGIONID                     
REGIONNAME               
BASICPAY                      
EXTRAPAY                       
PAY                            
GRADE                   


