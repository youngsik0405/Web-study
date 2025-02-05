SELECT USER
FROM DUAL;
--==>> SCOTT


--○ 기존 테이블 제거
DROP TABLE TBL_BOARD PURGE;
--==>> Table TBL_BOARD이(가) 삭제되었습니다.


--○ 실습 테이블 생성(게시판 전용 테이블)
-- 테이블명 : TBL_BOARD
CREATE TABLE TBL_BOARD
( NUM       NUMBER(9)                           NOT NULL    -- 게시물 번호
, NAME      VARCHAR2(30)                        NOT NULL    -- 게시물 작성자
, PWD       VARCHAR2(20)                        NOT NULL    -- 게시물 암호
, EMAIL     VARCHAR2(50)                                    -- 작성자 이메일
, SUBJECT   VARCHAR2(100)                       NOT NULL    -- 게시물 제목
, CONTENT   VARCHAR2(4000)                      NOT NULL    -- 게시물 내용
, IPADDR    VARCHAR2(20)                                    -- 접속한 클라이언트 ip 주소
, HITCOUNT  NUMBER          DEFAULT 0           NOT NULL    -- 게시물 조회수
, CREATED   DATE            DEFAULT SYSDATE     NOT NULL    -- 게시물 작성일
, CONSTRAINT BOARD_NUM_PK PRIMARY KEY(NUM)
);
--==>> Table TBL_BOARD이(가) 생성되었습니다.


--○ 게시물 번호의 최대값을 얻어내는 쿼리문 구성(~15:36)
SELECT NVL(MAX(NUM), 0) AS MAXNUM
FROM TBL_BOARD;
--> 한 줄 구성
SELECT NVL(MAX(NUM), 0) AS MAXNUM FROM TBL_BOARD
;
--==>> 0


--○ 게시물 작성 쿼리문 구성
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
VALUES(1, '공찬민', '1234', 'kcm@test.com', '작성테스트', '게시물 내용 작성', '211.238.142.163', 0, SYSDATE);
--> 한 줄 구성
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED) VALUES(1, '공찬민', '1234', 'kcm@test.com', '작성테스트', '게시물 내용 작성', '211.238.142.163', 0, SYSDATE)
;
--==>> 1 행 이(가) 삽입되었습니다.

-- 확인
SELECT *
FROM TBL_BOARD;
--==>> 1	공찬민	1234	kcm@test.com	작성테스트	게시물 내용 작성	211.238.142.163	0	25/01/16

-- 롤백
ROLLBACK;
--==>> 롤백 완료.


--○ DB 레코드의 갯수를 가져오는 쿼리문 구성
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_BOARD
;
--==>> 0


--               11       20
--○ 특정 영역(시작번호~끝번호)의 게시물 목록을 읽어오는 쿼리문 구성
--   번호, 작성자, 제목, 조회수, 작성일
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
--> 한 줄 구성
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED FROM ( SELECT ROWNUM RNUM, DATA.* FROM ( SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD ORDER BY NUM DESC ) DATA ) WHERE RNUM>=1 AND RNUM<=10
;



--○ 특정 게시물 조회에 따른 조회 횟수 증가 쿼리문 구성
UPDATE TBL_BOARD
SET HITCOUNT = HITCOUNT + 1     -- HITCOUNT += 1    -- HITCOUNT++
WHERE NUM=1;
--> 한 줄 구성
UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT + 1 WHERE NUM=1
;

-- 실무적 → 로그화~!!!
-- 조회수에 따라 광고비가 달라지는 경우, 누가 언제 어떤 게시물을 조회했는지 로그기록을 모으는 테이블을 따로 만들어서,
-- 동일인물이 비슷한 시간대에 조회하는 경우 해당 테이블에 인서트되지 못하게 막는다거나, 인서트는 안 막지만 조회수를 뿌려줄 때 카운팅하지 않는 등의 처리가 가능하다


--○ 특정 게시물의 내용을 읽어오는 쿼리문 구성
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT
     , TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
FROM TBL_BOARD
WHERE NUM=1;
--> 한 줄 구성
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD WHERE NUM=1
;


--○ 특정 게시물을 삭제하는 쿼리문 구성
DELETE
FROM TBL_BOARD
WHERE NUM=1;
--> 한 줄 구성
DELETE FROM TBL_BOARD WHERE NUM=1
;


COMMIT;


--○ 특정 게시물을 수정하는 쿼리문 구성
--   (게시물 상세보기 페이지 → Article.jsp 내에서의 처리)
--   수정 가능 항목 : 작성자, 패스워드, 이메일, 제목, 내용
UPDATE TBL_BOARD
SET NAME='곽유진', PWD='9987', EMAIL='kyj@test.com', SUBJECT='수정한 제목', CONTENT='수정한 내용'
WHERE NUM=1;
--> 한 줄 구성
UPDATE TBL_BOARD SET NAME='곽유진', PWD='9987', EMAIL='kyj@test.com', SUBJECT='수정한 제목', CONTENT='수정한 내용' WHERE NUM=1
;

-- 확인
SELECT *
FROM TBL_BOARD;
--==>> 1	곽유진	9987	kyj@test.com	수정한 제목	수정한 내용	211.238.142.163	0	25/01/16

-- 커밋
COMMIT;
--==>> 커밋 완료.


--○ 특정 게시물(50)의 다음 번호 읽어오는 쿼리문 구성
SELECT NVL(MIN(NUM), -1) NEXTNUM
FROM TBL_BOARD
WHERE NUM>50;
--> 한 줄 구성
SELECT NVL(MIN(NUM), -1) NEXTNUM FROM TBL_BOARD WHERE NUM>50
;


--○ 특정 게시물(50)의 이전 번호 읽어오는 쿼리문 구성
SELECT NVL(MAX(NUM), -1) BEFORENUM
FROM TBL_BOARD
WHERE NUM<50;
--> 한 줄 구성
SELECT NVL(MAX(NUM), -1) BEFORENUM FROM TBL_BOARD WHERE NUM<50
;





--------------------------------------------------------------------------------
--■■■ 실습 진행간 테스트 및 처리 ■■■--

--○ 기존 게시물 삭제
DELETE
FROM TBL_BOARD;
--==>> 1 행 이(가) 삭제되었습니다.

--○ 커밋
COMMIT;
--==>> 커밋 완료.


--○ 프로시저 실행 이후 테이블 조회
SELECT *
FROM TBL_BOARD;
--> 데이터 입력 확인

--○ 커밋
COMMIT;
--==>> 커밋 완료.