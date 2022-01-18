use proj21_admin;

-- 로그인 기능
-- 1. 전채 리스트 보기
-- 2. 로그인에 필요한 id, passwd 기능 추가.
-- 3.
-- 3-1. 관리자로 로그인시 관리자 페이지로 넘어 갑니다.
-- 3-2. 회원 로그인시 홈 으로 넘어 가며 회원 : 이름, 회원 : 포인트 가 표기되어야 합니다.

select m_id,m_passwd,m_name,m_phone,m_birthday,m_gender,m_addr1,m_addr2,m_addr3,m_question,m_answer,m_email,m_join,m_point,m_total_buy,m_total_order,m_total_login,m_exit
	from `member`;

-- selectByLogin -검사용-
select m_id,(select CONCAT('*', UPPER(SHA1(UNHEX(SHA1(('암호')))))) as password) as m_passwd ,m_name,m_phone,m_birthday,m_gender,m_addr1,m_addr2,m_addr3,m_question,m_answer,m_email,m_join,m_point,m_total_buy,m_total_order,m_total_login,m_exit 
	from `member`
where m_id = 'test01'; 
 
-- 토탈 로그인수 증가. 
update `member`
	set m_total_login = m_total_login + 1
where m_id = 'test01';
	
select m_total_login from `member` where m_id = 'test01' ;