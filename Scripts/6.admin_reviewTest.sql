select * from review;

-- listReviews.jsp 사용될 친구
-- id selectAllReviews
select a.*
	from(select format (@rownum := @rownum + 1, 0) as rn, re_num, re_member, r.pro_num, re_image,	re_image2,
			re_content,	re_stars, re_date, p.pro_name, p.pro_imgfilename, p.pro_color, p.pro_size
		from (select @rownum := 0) R, review r join productall p on r.pro_num = p.pro_num
		where re_date > 0
	) as a;
	
-- id selectedTotalReviews
select count(*) 
	from review
where re_num > 0
	and re_member like concat('%' , 't' ,'%')
	and pro_num like concat('%', 6, '%');

-- id deleteReviews (전체 삭제도 담당)
delete 
	from review 
where re_num in();