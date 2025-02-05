SELECT USER
FROM DUAL;
--==>> SCOTT

--�� ���� ���̺� ������ �ڸ���
TRUNCATE TABLE TBL_SCORE;
--==>> Table TBL_MEMBER��(��) �߷Ƚ��ϴ�.

--�� ���� ������ ����
DROP SEQUENCE SCORESEQ;
--==>> Sequence SCORESEQ��(��) �����Ǿ����ϴ�.


--�� �ǽ� ���� ������ �ٽ� ����
CREATE SEQUENCE SCORESEQ
NOCACHE;
--==>> Sequence SCORESEQ��(��) �����Ǿ����ϴ�.

--�� �߰� ���� ������ �Է�
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '������', 80, 70, 60)
;
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '�ȼ�â', 70, 60, 50)
;
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '������', 50, 40, 30)
;

SELECT *
FROM TBL_SCORE;
--==>>
/*
1	���¹�	90	80	70
2	������	80	70	60
3	�ȼ�â	70	60	50
4	������	50	40	30
5	������	100	50	40
8	������2	65	78	100
9	������3	65	77	99
*/

DESC TBL_SCORE;

--�� �ο��� ��ȸ ����
SELECT COUNT(*) AS COUNT
FROM TBL_SCORE;
--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_SCORE
;
--==>> 7


--�� ��ü ��ȸ ����
SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, ROUND((KOR+ENG+MAT)/3, 1) AS AVG
FROM TBL_SCORE
ORDER BY SID;
--> �� �� ����
SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, ROUND((KOR+ENG+MAT)/3, 1) AS AVG FROM TBL_SCORE ORDER BY SID
;

--�� ������ �߰� ����
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '������', 100, 90, 80)
;

--��Ŀ��
COMMIT;

--�� ������ ���� ����
DELETE
FROM TBL_SCORE
WHERE SID=5;
-->�� �� ����
DELETE FROM TBL_SCORE WHERE SID=5
;
