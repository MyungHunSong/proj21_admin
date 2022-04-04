use proj21_admin;

-- 옷 상세정보 보기
select  p.pro_num,pro_category,pro_name,pro_price,pro_content,pro_salerate
          ,pro_cre_date,pro_status,pro_color,pro_size,pro_quantity,pro_sold,pro_hits,re_replyCount
          ,pro_img_code,pro_imgfilename,pro_img_state
from  product p join pro_img i on p.pro_num = i.pro_num;

-- 조회수 증가
update product
		set pro_hits = pro_hits + 1
where pro_num = 1;
-- 메인화면 제품 목록(new, recommend,mostivew, new, best, sale)
select  pro_num,pro_category,pro_name,pro_price,pro_content,pro_salerate,pro_cre_date,pro_status,
				pro_color,pro_size,pro_quantity,pro_sold,pro_hits,re_replyCount,pro_img_code,pro_imgfilename,pro_img_state
			from productall
		where pro_size = 1 and pro_status = "신상"		
	order by pro_price desc
limit 8;

select count(*) from productall p 
where pro_size = 1 and pro_status = '신상'
order by pro_price desc;
-- 페이징 세일하는 제품 목록
SELECT DISTINCT a.*
	from (select format(@ROWNUM := @ROWNUM + 1, 0) as rn,
	 pro_num, pro_category, pro_name, pro_price, pro_salerate, pro_cre_date,
							  pro_status, pro_color, pro_size, pro_quantity, pro_hits, pro_imgfilename
		from (select @ROWNUM := 0) R, productall
		where pro_size = 1
	) a
where pro_size = 1;

-- productall prostatus = '신상'으로 수정
update productall 
	set pro_status = '신상'
where pro_size = 1 and pro_num between 2000 and 6300;

select * 
	from productall
where pro_size = 1;

-- 최고 물품 테스트 목록
update productall
	set pro_hits = 15
where pro_size = 2 
and pro_num between 2000 and 2300;

update productall 
	set pro_status = '최고'
where pro_hits > 10;

-- recommend 보여주기
update productall 
	set pro_status = '추천'
where pro_size = 1 
	and pro_num between 1141 and 2111;
