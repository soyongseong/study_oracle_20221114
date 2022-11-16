--SQL : Structured Query Langguage (구조화된 질의어) 연습
-- 2장. SQL

/*
-- 공통사항
-- <이건 한줄 주석 ^이건 여러줄 주석
-- 명령어 끝에는 ; 붙이기
-- 일반적으로는 대소문자를 구분하지 않는다.

-- 2. SQL의 종류



*/

/*
-- 회원 정보를 저장하는 테이블
-- 아이디 : 인조키 (데이터를 식별하기 위해 인위적으로 만든 키)
-- 이름 나이 전화번호 주소 이메일 

*/



CREATE TABLE userTBL
 id number,
 name varchar2(20),
 age number,
 phone char (13),
 addr varchar2 (50),
 email varchar2 (30),
 reg_data date
);


-- 2.테이블에 데이터 삽입 : DML (데이터베이스 조작언어)



INSERT INTO userTBL (id, name, age, phone, addr, email, reg_date)
VALUES (1, '홍길동', 20, '010-1234-5678', 'gwangju, seo-gu', 'hong@naver.com', SYSDATE);




DROP TABLE USERTBL;




