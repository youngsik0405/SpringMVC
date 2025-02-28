SELECT USER
FROM DUAL;
--==>> SCOTT

-- mvc06_scott.sql

--�� ���� ���̺� ����
DROP TABLE TBL_MEMBERLIST;
--==>> Table TBL_MEMBERLIST��(��) �����Ǿ����ϴ�.


--�� �ǽ� ���̺� �ٽ� ����
CREATE TABLE TBL_MEMBERLIST
( ID    VARCHAR(30)
, PW    VARCHAR(30)
, NAME  VARCHAR(50)
, TEL   VARCHAR(50)
, EMAIL VARCHAR(100)
, CONSTRAINT MEMBERLIST_ID_PK PRIMARY KEY(ID)
);
--==>> Table TBL_MEMBERLIST��(��) �����Ǿ����ϴ�.

--�� ������ �Է�
INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL)
VALUES('admin', CRYPTPACK.ENCRYPT('java006$', 'java006$'), '�ڼ���', '010-4197-6627', 'psj@test.com');
--> �� �� ����
INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL) VALUES('admin', CRYPTPACK.ENCRYPT('java006$', 'java006$'), '�ڼ���', '010-4197-6627', 'psj@test.com')
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� Ȯ��
SELECT ID, PW, NAME, TEL, EMAIL
FROM TBL_MEMBERLIST;
--==>> admin	???^	�ڼ���	010-4197-6627	psj@test.com


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� ����Ʈ ��ȸ ������ ����
SELECT ID, PW, NAME, TEL, EMAIL
FROM TBL_MEMBERLIST;
--> �� �� ����
SELECT ID, PW, NAME, TEL, EMAIL FROM TBL_MEMBERLIST
;
