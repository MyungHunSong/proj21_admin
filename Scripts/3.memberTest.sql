use proj21_admin;

-- 로그인 기능
-- 1. 전채 리스트 보기
-- 2. 로그인에 필요한 id, passwd 기능 추가.
-- 3.
-- 3-1. 관리자로 로그인시 관리자 페이지로 넘어 갑니다.
-- 3-2. 회원 로그인시 홈 으로 넘어 가며 회원 : 이름, 회원 : 포인트 가 표기되어야 합니다.

select *
	from `member`
where m_id = 'admin' and m_exit != 1 and m_passwd = 123;

alter table `member` modify m_exit int default 0;

update `member` 
	set m_exit = 0
where m_id = 'admin';

-- selectByLogin -검사용-
select m_id,(select CONCAT('*', UPPER(SHA1(UNHEX(SHA1(('암호')))))) as password) as m_passwd ,m_name,m_phone,m_birthday,m_gender,m_addr1,m_addr2,m_addr3,m_question,m_answer,m_email,m_join,m_point,m_total_buy,m_total_order,m_total_login,m_exit 
	from `member`
where m_id = 'test01'; 
 
-- 토탈 로그인수 증가. 
update `member`
	set m_total_login = m_total_login + 1
where m_id = 'test01';
	
select m_total_login from `member` where m_id = 'test01' ;


-- adminMemberMapper에 사용될것
update `member`
	set m_total_buy = m_total_buy - 1,
		m_total_order = m_total_order - 1,
		m_point = m_point - (1 * 0.01)
where m_id = 'test12';

select * from `member`;

select * 
	from `member`
where m_name like concat('%', '이', '%') and m_gender = 0
order by m_total_buy desc;

--  검색한 회원 수 --
select count(*)
	from `member` 
	where m_name like concat('%','이', '%')
	and m_gender = 0;
	
-- 회원 상세 정보 검색
SELECT m_id, m_name, m_point, m_total_login, m_total_buy, m_total_order
  FROM (SELECT (@rownum := @rownum + 1) AS rn, m_id, m_name, m_point,
  		m_total_login, 
  		(SELECT count(order_pro_num) FROM (SELECT * FROM MEMBER m JOIN `order` o ON m.m_id =o.order_member_id WHERE m_id = 'test%' GROUP BY order_pro_num)AS a) as m_total_order,
  	 	m_total_buy
  	 	from `member` m
  	 	where m_id = 'test12' and (@rownum := 0)
 WHERE rn=1;

-- 주문 있는지 없는지 확인
select if(count(*)=0, 'false','true')
	from `order`;

-- 총 판매 금액
select sum(order_pro_quantity * order_price)
		from `order`;
		
-- 총 주문 건 수
select count(distinct order_pro_num)
from `order`;

-- 총 주문 수
select count(*)
from `order`;
	
-- 배송 준비 중 수
select count(*)
	from `order`
	where delivery_status = '배송준비중';
-- 배송 중 수	
select count(*)
	from `order`
where delivery_status ='배송중';

-- 배송 완료 수
select count(*)
	from `order`
where delivery_status = '배송완료';

-- 환불 완료 수
select count(*)
	from `order`
	where delivery_status ='반품완료';

-- 환불 대기 수 
select count(*)
	from `order`
	where delivery_status = '반품대기중';

 

-- selectOrderList (전체 조회에 사용되는가 보다)
select distinct a.*, c.pro_imgfilename , p.pro_name 
	from (select format(@rownum := @rownum + 1, 0) as rn, o.order_code,	o.order_pro_num, o.order_date, o.order_pro_quantity,
				o.delivery_status, o.order_m_name, o.request_to_delivery, o.which_bank, o.order_price,o.order_m_id,
				p.pro_price-(p.pro_salerate * 0.01 * p.pro_price) as order_value, p.pro_num, p.pro_color, p.pro_size 
	from `order` o join product p on o.o_pro_num = p.pro_num
	where o.order_date > 0
		  and o.order_pro_num = 1
		  and o.delivery_status = '배송준비중'
	) a, product p join pro_img c on p.pro_num = c.pro_num 
	where c.pro_img_state = 1
		  and p.pro_num = a.pro_num;
		  
		 

SELECT DISTINCT 
	a.*,
	c.pro_imgfilename ,
	p.pro_name
FROM
	(
	SELECT 
		FORMAT(@ROWNUM := @ROWNUM + 1, 0) AS rn,
		order_code,
		order_pro_num,
		order_date,
		order_pro_quantity,
		delivery_status,
		order_m_name,
		request_to_delivery,
		which_bank,
		order_price,
		p.pro_price-(p.pro_salerate*0.01*p.pro_price) AS order_value,
		p.pro_num,
		p.pro_color,
		p.pro_size
	FROM
		(SELECT@ROWNUM := 0 ) R, `ORDER` o JOIN product p ON o.o_pro_num = p.pro_num
	WHERE
		order_date > 0 )a,	product p JOIN pro_img c ON p.pro_num = c.pro_num
WHERE
	c.pro_img_state = 1
	AND p.pro_num = a.pro_num
	AND rn BETWEEN (1-1)* 100 +(1-1)* 10 + 1 AND (1-1)* 100 +1* 10;

-- update 배송상태
update `order`
	set delivery_status = '배송준비중'
where order_pro_num = '1' and order_code = '4';

-- selecttotal 상품들 상태 총합
select count(distinct order_pro_num)
	from `order`
where order_pro_num = 1;

-- 삭제
delete 
	from `order`
where order_pro_num = 1;

-- update 리펀드
update `order`
	set
		delivery_status = '반품완료'
where order_pro_num = 1 and order_code = 3;

-- orderlist의 평균값
select sum(order_price)/count(order_code) 
	from `order` 
where order_m_id = 'test01';

-- haveOrder 가지고 있는가?
select if(count(order_m_id)=0, 'false', 'true')
	from `order` 
where order_m_id = 'test01';

-- onDelivery 배송상태를 알기위한 sql문 
select count(delivery_status) 
	from `order` 
where order_m_id = 'test01' and delivery_status = '배송준비중';

-- haveRefund 가지고 잇는가에 대한것
select if (count(order_pro_num)=0, 'false', 'true')
	from `order`
where order_m_id = 'test01' and delivery_status ='배송준비중';

select count(order_pro_num)
	from `order`
where order_m_id = 'test01' and delivery_status = '배송준비중';

-- get_OrderList  distinct를 사용한 a라는 (서브쿼리를 담고 있는 select문) 을 짜집어서 같이 보여주는 절이다
select  distinct a.*
	from (select 
			order_pro_num, order_code , order_date , order_pro_quantity , order_price ,
		  			   delivery_status ,order_m_name, request_to_delivery, which_bank,
					   p.pro_num, p.pro_color, p.pro_size, p.pro_name, img.pro_imgfilename			
			from `order` o, product p, pro_img img
			where o.o_pro_num = p.pro_num AND img.pro_img_state = 1 AND img.pro_num = p.pro_num AND o.order_m_id = 'test01'
			) a, product p
			where p.pro_num = a.pro_num
			order by a.order_code desc;
		
-- 시발 이게 않되
select m_id, m_name, m_point, m_join, m_total_order, m_total_buy
	from `member` 
where m_name like concat('%', '이', '%')
order by m_join desc;
