SELECT USER
FROM DUAL;
--==>> SCOTT

-- PURGE는 휴지통에 버리는 게 아니라 완전히 삭제하는 옵션(위험하니 실무에서 잘 쓰지 않음)
--○ 기존 테이블 제거
DROP TABLE TBL_SCORE PURGE;
--==>> Table TBL_SCORE이(가) 삭제되었습니다.


--○ 실습 테이블 생성
-- 테이블명 : TBL_SCORE
CREATE TABLE TBL_SCORE
( SID   NUMBER
, NAME  VARCHAR2(30)
, KOR   NUMBER(3)
, ENG   NUMBER(3)
, MAT   NUMBER(3)
);
--==>> Table TBL_SCORE이(가) 생성되었습니다.


--○ 생성된 테이블에 제약조건 추가
ALTER TABLE TBL_SCORE
ADD ( CONSTRAINT SCORE_SID_PK PRIMARY KEY(SID)
    , CONSTRAINT SCORE_KOR_CK CHECK(KOR BETWEEN 0 AND 100)
    , CONSTRAINT SCORE_ENG_CK CHECK(ENG BETWEEN 0 AND 100)
    , CONSTRAINT SCORE_MAT_CK CHECK(MAT BETWEEN 0 AND 100) );
--==>> Table TBL_SCORE이(가) 변경되었습니다.


--○ 기존 시퀀스 제거
DROP SEQUENCE SCORESEQ;
--==>> Sequence SCORESEQ이(가) 삭제되었습니다.


--○ 실습 관련 시퀀스 다시 생성
CREATE SEQUENCE SCORESEQ
NOCACHE;
--==>> Sequence SCORESEQ이(가) 생성되었습니다.


--○ 데이터 입력 쿼리문 구성
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)
VALUES(SCORESEQ.NEXTVAL, '정승민', 90, 80, 70);
--> 한 줄 구성
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '정승민', 90, 80, 70)
;
--==>> 1 행 이(가) 삽입되었습니다.


--○ 추가 샘플 데이터 입력
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '박제훈', 80, 70, 60)
;
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '안석창', 70, 60, 50)
;
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '정영훈', 50, 40, 30)
;
--==>> 1 행 이(가) 삽입되었습니다. * 3


--○ 리스트 조회 쿼리문 구성
-- 항목 : 번호, 이름, 국어점수, 영어점수, 수학점수, 총점, 평균
SELECT SID, NAME, KOR, ENG, MAT
     , (KOR + ENG + MAT) AS TOT
     , (KOR + ENG + MAT)/3 AS AVG
FROM TBL_SCORE
ORDER BY SID;
--> 한 줄 구성
SELECT SID, NAME, KOR, ENG, MAT, (KOR + ENG + MAT) AS TOT, (KOR + ENG + MAT)/3 AS AVG FROM TBL_SCORE ORDER BY SID
;
--==>>
/*
1	정승민	90	80	70	240	80
2	박제훈	80	70	60	210	70
3	안석창	70	60	50	180	60
4	정영훈	50	40	30	120	40
*/


--○ 커밋
COMMIT;
--==>> 커밋 완료.
