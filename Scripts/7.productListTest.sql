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
select *
	from productall
where pro_size = 2
order by pro_price desc
limit 8;

-- 페이징 세일하는 제품 목록