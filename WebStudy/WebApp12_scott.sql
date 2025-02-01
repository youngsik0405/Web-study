SELECT USER
FROM DUAL;
--==>> SCOTT


--�� ���� ���̺� ����
DROP TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.


--�� �ǽ� ���̺� ����
-- ���̺�� : TBL_MEMBER
CREATE TABLE TBL_MEMBER
( SID   NUMBER
, NAME  VARCHAR(30)     NOT NULL
, TEL   VARCHAR(40)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.


--�� ���� ������ ����
DROP SEQUENCE MEMBERSEQ;
--==>> Sequence MEMBERSEQ��(��) �����Ǿ����ϴ�.


--�� ������ �ٽ� ����
CREATE SEQUENCE MEMBERSEQ
NOCACHE;
--==>> Sequence MEMBERSEQ��(��) �����Ǿ����ϴ�.


--�� ���� ������ �Է�
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '�ڼ���', '010-1111-1111')
;
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '�ȼ�â', '010-2222-2222');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '������', '010-3333-3333');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '������', '010-4444-4444');
--==>>  1 �� ��(��) ���ԵǾ����ϴ�. * 4


--�� ����Ʈ Ȯ��
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--> �� �� ����
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;
--==>>
/*
1	�ڼ���	010-1111-1111
2	�ȼ�â	010-2222-2222
3	������	010-3333-3333
4	������	010-4444-4444
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� �ο��� Ȯ��
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBER;
--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER
;
--==>> 4


--�� SID �� Ȱ���� ȸ�� ���� �˻� ������ ����
SELECT SID, NAME, TEL
FROM TBL_MEMBER
WHERE SID = 1;
--> �� �� ����
SELECT SID, NAME, TEL FROM TBL_MEMBER WHERE SID = 1
;
--==>> 1	�ڼ���	010-1111-1111


--�� ȸ�� ���� ����
UPDATE TBL_MEMBER
SET NAME='������', TEL='010-1414-1414'
WHERE SID = 1;
--> �� �� ����
UPDATE TBL_MEMBER SET NAME='������', TEL='010-1414-1414' WHERE SID = 1
;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.


--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.


--�� ȸ�� ���� ���� ������ ����
DELETE
FROM TBL_MEMBER
WHERE SID=1;
--> �� �� ����
DELETE FROM TBL_MEMBER WHERE SID=1
;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.


--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.


--�� ���� ���̺� ����
DROP TABLE TBL_SCORE;
--==>> Table TBL_SCORE��(��) �����Ǿ����ϴ�.


--�� �ǽ� ���̺� ����
-- ���̺�� : TBL_MEMBERSCORE
CREATE TABLE TBL_MEMBERSCORE
( SID   NUMBER
, KOR   NUMBER(3)
, ENG   NUMBER(3)
, MAT   NUMBER(3)
, CONSTRAINT MEMBERSCORE_SID_PK PRIMARY KEY(SID)
, CONSTRAINT MEMBERSCORE_KOR_FK CHECK(KOR BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_ENG_FK CHECK(ENG BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_MAT_FK CHECK(MAT BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_SID_FK FOREIGN KEY(SID)
             REFERENCES TBL_MEMBER(SID)
);
--==>> Table TBL_MEMBERSCORE��(��) �����Ǿ����ϴ�.

--�� ���� ������ �Է�
INSERT INTO TBL_MEMBERSCORE(SID, KOR, ENG, MAT) VALUES(1, 90, 80, 70)
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_MEMBERSCORE(SID, KOR, ENG, MAT) VALUES(2, 80, 70, 60)
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� Ȯ��
SELECT SID, KOR, ENG, MAT
FROM TBL_MEMBERSCORE
ORDER BY SID;
--> �� �� ����
SELECT SID, KOR, ENG, MAT FROM TBL_MEMBERSCORE ORDER BY SID
;
--==>>
/*
1	90	80	70
2	80	70	60
*/


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� �Էµ� ���� ������ ���� Ȯ�� ������ ����
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBERSCORE;
--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_MEMBERSCORE
;

--==>> 2


--�� ���� ������ ���� ������ ����
UPDATE TBL_MEMBERSCORE
SET KOR=91, ENG=81, MAT=71
WHERE SID=1;
--> �� �� ����
UPDATE TBL_MEMBERSCORE SET KOR=91, ENG=81, MAT=71 WHERE SID=1
;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.


--�� Ȯ��
SELECT SID, KOR, ENG, MAT
FROM TBL_MEMBERSCORE
ORDER BY SID;
--> �� �� ����
SELECT SID, KOR, ENG, MAT FROM TBL_MEMBERSCORE ORDER BY SID
;
--==>> 
/*
1	91	81	71
2	80	70	60
*/


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� ���� ������ ���� ������ ����
DELETE
FROM TBL_MEMBERSCORE
WHERE SID=1;
--> �� �� ����
DELETE FROM TBL_MEMBERSCORE WHERE SID=1
;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.


--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.


--�� ��ü ����Ʈ ��ȸ ������ ����
-- SID, NAME, TEL, KOR, ENG, MAT
SELECT M.SID, M.NAME, M.TEL
     , S.KOR, S.ENG, S.MAT
FROM TBL_MEMBER M JOIN TBL_MEMBERSCORE S
ON M.SID = S.SID
ORDER BY M.SID;
--==>> 
/*
1	�ڼ���	010-1111-1111	91	81	71
2	�ȼ�â	010-2222-2222	80	70	60
*/

--�� ��ü ����Ʈ ��ȸ ������ ����
-- SID, NAME, TEL, KOR, ENG, MAT
SELECT M.SID, M.NAME, M.TEL
     , S.KOR, S.ENG, S.MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID(+);
--==>>
/*
1	�ڼ���	010-1111-1111	91	81	71
2	�ȼ�â	010-2222-2222	80	70	60
3	������	010-3333-3333  (n)	(n) (n)		
4	������	010-4444-4444  (n)	(n)	(n)	
*/

--�� ��ü ����Ʈ ��ȸ ������ ���� �� ���� �� LEFT JOIN �� ���� �� NVL()
-- SID, NAME, TEL, KOR, ENG, MAT
SELECT M.SID, M.NAME, M.TEL
     , NVL(S.KOR, -1) AS KOR, NVL(S.ENG, -1) AS ENG, NVL(S.MAT,-1) AS MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID(+);
--==>>
/*
1	�ڼ���	010-1111-1111	91	81	71
2	�ȼ�â	010-2222-2222	80	70	60
3	������	010-3333-3333	-1	-1	-1
4	������	010-4444-4444	-1	-1	-1
*/


--�� ��ü ����Ʈ ��ȸ ���� �� ����
-- �� �̸� : VIEW_MEMBERSCORE
CREATE OR REPLACE VIEW VIEW_MEMBERSCORE
AS
SELECT M.SID, M.NAME, M.TEL
     , NVL(S.KOR, -1) AS KOR, NVL(S.ENG, -1) AS ENG, NVL(S.MAT,-1) AS MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID(+);
--==>> View VIEW_MEMBERSCORE��(��) �����Ǿ����ϴ�.


--�� ������ ��(VIEW_MEMBERSCORE)�� Ȱ���� ����Ʈ ��ȸ ������ ����
-- SID, NAME, KOR, ENG, MAT, TOT, AVG, RANK
SELECT SID, NAME, KOR, ENG, MAT
     , (KOR+ENG+MAT) AS TOT
     , (KOR+ENG+MAT)/3 AS AVG
     , RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK
FROM VIEW_MEMBERSCORE
ORDER BY SID;
--> �� �� ����
SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3 AS AVG, RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK FROM VIEW_MEMBERSCORE ORDER BY SID
;
--==>>
/*
1	�ڼ���	91	81	71	243	81	1
2	�ȼ�â	80	70	60	210	70	2
3	������	-1	-1	-1	-3	-1	3
4	������	-1	-1	-1	-3	-1	3
*/

--�� ������ ��(VIEW_MEMBERSCORE)�� Ȱ���� ��ȣ �˻� ������ ����
SELECT SID, NAME, KOR, ENG, MAT
FROM VIEW_MEMBERSCORE
WHERE SID=1;
--> �� �� ����
SELECT SID, NAME, KOR, ENG, MAT FROM VIEW_MEMBERSCORE WHERE SID=1
;
--==>> 1	�ڼ���	91	81	71


--�� ���� ������ ���ڵ� �� Ȯ�� ������ ����
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBERSCORE
WHERE SID=1;
--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_MEMBERSCORE WHERE SID=1
;
--==>> 1

