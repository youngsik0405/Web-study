SELECT USER
FROM DUAL;
--==>> SCOTT


--�� ���� ���̺� ����
DROP TABLE TBL_BOARD PURGE;
--==>> Table TBL_BOARD��(��) �����Ǿ����ϴ�.


--�� �ǽ� ���̺� ����(�Խ��� ���� ���̺�)
-- ���̺�� : TBL_BOARD
CREATE TABLE TBL_BOARD
( NUM       NUMBER(9)                           NOT NULL    -- �Խù� ��ȣ
, NAME      VARCHAR2(30)                        NOT NULL    -- �Խù� �ۼ���
, PWD       VARCHAR2(20)                        NOT NULL    -- �Խù� ��ȣ
, EMAIL     VARCHAR2(50)                                    -- �ۼ��� �̸���
, SUBJECT   VARCHAR2(100)                       NOT NULL    -- �Խù� ����
, CONTENT   VARCHAR2(4000)                      NOT NULL    -- �Խù� ����
, IPADDR    VARCHAR2(20)                                    -- ������ Ŭ���̾�Ʈ ip �ּ�
, HITCOUNT  NUMBER          DEFAULT 0           NOT NULL    -- �Խù� ��ȸ��
, CREATED   DATE            DEFAULT SYSDATE     NOT NULL    -- �Խù� �ۼ���
, CONSTRAINT BOARD_NUM_PK PRIMARY KEY(NUM)
);
--==>> Table TBL_BOARD��(��) �����Ǿ����ϴ�.


--�� �Խù� ��ȣ�� �ִ밪�� ���� ������ ����(~15:36)
SELECT NVL(MAX(NUM), 0) AS MAXNUM
FROM TBL_BOARD;
--> �� �� ����
SELECT NVL(MAX(NUM), 0) AS MAXNUM FROM TBL_BOARD
;
--==>> 0


--�� �Խù� �ۼ� ������ ����
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
VALUES(1, '������', '1234', 'kcm@test.com', '�ۼ��׽�Ʈ', '�Խù� ���� �ۼ�', '211.238.142.163', 0, SYSDATE);
--> �� �� ����
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED) VALUES(1, '������', '1234', 'kcm@test.com', '�ۼ��׽�Ʈ', '�Խù� ���� �ۼ�', '211.238.142.163', 0, SYSDATE)
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

-- Ȯ��
SELECT *
FROM TBL_BOARD;
--==>> 1	������	1234	kcm@test.com	�ۼ��׽�Ʈ	�Խù� ���� �ۼ�	211.238.142.163	0	25/01/16

-- �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.


--�� DB ���ڵ��� ������ �������� ������ ����
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD;
--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_BOARD
;
--==>> 0


--               11       20
--�� Ư�� ����(���۹�ȣ~����ȣ)�� �Խù� ����� �о���� ������ ����
--   ��ȣ, �ۼ���, ����, ��ȸ��, �ۼ���
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED
FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (
        SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
        FROM TBL_BOARD
        ORDER BY NUM DESC
    ) DATA
)
WHERE RNUM>=1 AND RNUM<=10;
--> �� �� ����
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED FROM ( SELECT ROWNUM RNUM, DATA.* FROM ( SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD ORDER BY NUM DESC ) DATA ) WHERE RNUM>=1 AND RNUM<=10
;



--�� Ư�� �Խù� ��ȸ�� ���� ��ȸ Ƚ�� ���� ������ ����
UPDATE TBL_BOARD
SET HITCOUNT = HITCOUNT + 1     -- HITCOUNT += 1    -- HITCOUNT++
WHERE NUM=1;
--> �� �� ����
UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT + 1 WHERE NUM=1
;

-- �ǹ��� �� �α�ȭ~!!!
-- ��ȸ���� ���� ����� �޶����� ���, ���� ���� � �Խù��� ��ȸ�ߴ��� �αױ���� ������ ���̺��� ���� ����,
-- �����ι��� ����� �ð��뿡 ��ȸ�ϴ� ��� �ش� ���̺� �μ�Ʈ���� ���ϰ� ���´ٰų�, �μ�Ʈ�� �� ������ ��ȸ���� �ѷ��� �� ī�������� �ʴ� ���� ó���� �����ϴ�


--�� Ư�� �Խù��� ������ �о���� ������ ����
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT
     , TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
FROM TBL_BOARD
WHERE NUM=1;
--> �� �� ����
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD WHERE NUM=1
;


--�� Ư�� �Խù��� �����ϴ� ������ ����
DELETE
FROM TBL_BOARD
WHERE NUM=1;
--> �� �� ����
DELETE FROM TBL_BOARD WHERE NUM=1
;


COMMIT;


--�� Ư�� �Խù��� �����ϴ� ������ ����
--   (�Խù� �󼼺��� ������ �� Article.jsp �������� ó��)
--   ���� ���� �׸� : �ۼ���, �н�����, �̸���, ����, ����
UPDATE TBL_BOARD
SET NAME='������', PWD='9987', EMAIL='kyj@test.com', SUBJECT='������ ����', CONTENT='������ ����'
WHERE NUM=1;
--> �� �� ����
UPDATE TBL_BOARD SET NAME='������', PWD='9987', EMAIL='kyj@test.com', SUBJECT='������ ����', CONTENT='������ ����' WHERE NUM=1
;

-- Ȯ��
SELECT *
FROM TBL_BOARD;
--==>> 1	������	9987	kyj@test.com	������ ����	������ ����	211.238.142.163	0	25/01/16

-- Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� Ư�� �Խù�(50)�� ���� ��ȣ �о���� ������ ����
SELECT NVL(MIN(NUM), -1) NEXTNUM
FROM TBL_BOARD
WHERE NUM>50;
--> �� �� ����
SELECT NVL(MIN(NUM), -1) NEXTNUM FROM TBL_BOARD WHERE NUM>50
;


--�� Ư�� �Խù�(50)�� ���� ��ȣ �о���� ������ ����
SELECT NVL(MAX(NUM), -1) BEFORENUM
FROM TBL_BOARD
WHERE NUM<50;
--> �� �� ����
SELECT NVL(MAX(NUM), -1) BEFORENUM FROM TBL_BOARD WHERE NUM<50
;





--------------------------------------------------------------------------------
--���� �ǽ� ���ణ �׽�Ʈ �� ó�� ����--

--�� ���� �Խù� ����
DELETE
FROM TBL_BOARD;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� ���ν��� ���� ���� ���̺� ��ȸ
SELECT *
FROM TBL_BOARD;
--> ������ �Է� Ȯ��

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.