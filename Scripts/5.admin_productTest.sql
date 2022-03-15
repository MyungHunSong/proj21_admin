use proj21_admin;
select *
	from product; 


-- 총 제품 수
select count(pro_num)
	from product;
	
-- 신상품 
select count(pro_num)
	from product
where pro_status = '신상';	

-- 판매량이 많은 제품 (이거는 pro_sold 값의 기준도 정해줘서 뽑아야 되지 않을까?)  
select count(pro_num),
	case 
		when pro_sold >= 10 then '최고'
		when pro_sold <= 9 then 'nomal'
		else '인기없음' 
	end as '상품'	
	from product
where pro_status = '최고';

-- 그냥 해논거
select count(pro_num)
	from product
where pro_status = '최고';

-- 세일중인 제품
select count(pro_num)
	from product
where pro_status = '세일';

-- 추천상품
select count(pro_num)
	from product
where pro_status = '추천';

-- 판매 중지된 상품
select count(pro_num)
	from product
where pro_status='품절';

-- 조건 별 제품 리스트 가져오기
select a.*
	from (select @ROWNUM := @ROWNUM + 1 as rn, p.*, p2.pro_imgfilename 
		from (select @ROWNUM := 0) R, product p join pro_img p2 on p.pro_num = p2.pro_num
			where p2.pro_img_state = 1 and p.pro_num) a
	where rn
	between (10 - 1) * 200 + (10 - 1) * 20 + 1
	and (10 - 1) * 200 + (10) * 20;

-- 제품 추가
insert into product
	(pro_num,pro_category,pro_name,pro_price,pro_content,pro_salerate,pro_status,pro_color,pro_size,pro_quantity)
values 
 (,,,,,,)
select * from product; 
-- 제품 사진 추가
insert into pro_img 
	(pro_num, pro_imgfilename, pro_img_state)
values
	(,,,)
-- 제품 재입고 (삭제)
delete 
	from product 
where pro_num = '';	
	
-- 제품별 검색 카테고리로
-- TShirts 
-- distinct 중복값 제거 substring (column,  숫자(부터), 숫자(까지) )
select  count(distinct substr(pro_num, 1, 3))
			from product
		where pro_category = 1;

select  count(distinct substr(pro_num, 1, 3))
			from product
		where pro_category = 2;
	
select  count(distinct substr(pro_num, 1, 3))
			from product
		where pro_category = 3;
	
select  count(distinct substr(pro_num, 1, 3))
			from product
		where pro_category = 4;
	
select  count(distinct substr(pro_num, 1, 3))
			from product
		where pro_category = 5;	

select  count(distinct substr(pro_num, 1, 3))
			from product
		where pro_category = 6;	

-- 제품 수정1
update product 
	set pro_quantity = pro_quantity + 1
where
	pro_num = 1;
-- 제품 수정2 (팔린거 갯수 -1)
update product 
	set pro_quantity = pro_quantity + 1 ,
	set pro_sold = pro_sold-1
where pro_num = 1;