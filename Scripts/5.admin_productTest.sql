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