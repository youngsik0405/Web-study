SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TBL_MEMBER
ORDER BY SID;
--==>>
/*
1	������	010-1111-1111
2	������	010-2222-2222
3	������	010-3333-3333
4	������	010-4444-4444
5	�����	010-5555-5555
6	�ȿ���	010-6666-6666
*/


DESC TBL_MEMBER;
--==>>
/*
�̸�   ��?       ����           
---- -------- ------------ 
SID  NOT NULL NUMBER       
NAME          VARCHAR2(30) 
TEL           VARCHAR2(40) 
*/


TRUNCATE TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER��(��) �߷Ƚ��ϴ�.


DROP SEQUENCE MEMBERSEQ;
--==>> Sequence MEMBERSEQ��(��) �����Ǿ����ϴ�.


CREATE SEQUENCE MEMBERSEQ
NOCACHE;
--==>> Sequence MEMBERSEQ��(��) �����Ǿ����ϴ�.


INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '��ν�', '010-1111-1111');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '������', '010-2222-2222');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '�Ӽ���', '010-3333-3333');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '������', '010-4444-4444');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 4


SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--> �� �� ����
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;
--==>>
/*
1	��ν�	010-1111-1111
2	������	010-2222-2222
3	�Ӽ���	010-3333-3333
4	������	010-4444-4444
*/

SELECT COUNT(*) AS COUNT
FROM TBL_MEMBER;
--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER
;
--==>> 4


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.