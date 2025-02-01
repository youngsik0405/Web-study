SELECT USER
FROM DUAL;
--==>> SCOTT

--�� ���� ���̺� ����
DROP TABLE TBL_SCORE PURGE;
--==>> Table TBL_SCORE��(��) �����Ǿ����ϴ�.


--�� �ǽ� ���̺� ����
-- ���̺�� : TBL_SCORE
CREATE TABLE TBL_SCORE
( SID   NUMBER
, NAME  VARCHAR2(30)
, KOR   NUMBER(3)
, ENG   NUMBER(3)
, MAT   NUMBER(3)
);
--==>> Table TBL_SCORE��(��) �����Ǿ����ϴ�.


--�� ������ ���̺� �������� �߰�
ALTER TABLE TBL_SCORE
ADD ( CONSTRAINT SOCRE_SID_PK PRIMARY KEY(SID)
    , CONSTRAINT SOCRE_KOR_CK CHECK(KOR BETWEEN 0 AND 100)
    , CONSTRAINT SOCRE_ENG_CK CHECK(ENG BETWEEN 0 AND 100)
    , CONSTRAINT SOCRE_MAT_CK CHECK(MAT BETWEEN 0 AND 100) );
    --==>> Table TBL_SCORE��(��) ����Ǿ����ϴ�.
    
    
--�� ���� ������ ����
DROP SEQUENCE SCORESEQ;
--==>> Sequence SCORESEQ��(��) �����Ǿ����ϴ�.


--�� ������ ����
CREATE SEQUENCE SCORESEQ
NOCACHE;
--==>> Sequence SCORESEQ��(��) �����Ǿ����ϴ�.


--�� ������ �Է� ������ ����
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)
VALUES(SCORESEQ.NEXTVAL, '���¹�', 90, 80, 70);
--> �� �� ����
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '���¹�', 90, 80, 70)
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� �߰� ���� ������ �Է�
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '������', 80, 70, 60)
;
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '�ȼ�â', 70, 60, 50)
;
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '������', 50, 40, 30)
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 3


--�� ����Ʈ ��ȸ ������ ����
-- �׸� : ��ȣ, �̸�, ��������, ��������, ��������, ����, ���
SELECT SID, NAME, KOR, ENG, MAT
      , (KOR+ENG+MAT) AS TOT
      , (KOR+ENG+MAT)/3 AS AVG
FROM TBL_SCORE
ORDER BY SID;
--> �� �� ����
SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3 AS AVG FROM TBL_SCORE ORDER BY SID
;
--==>>
/*
1	���¹�	90	80	70	240	80
2	������	80	70	60	210	70
3	�ȼ�â	70	60	50	180	60
4	������	50	40	30	120	40
*/


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.