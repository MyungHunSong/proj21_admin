use proj21_admin;

 -- prodcutall view맵 만들기
CREATE VIEW productall
as
select p.pro_num,pro_category,pro_name,pro_price,pro_content,pro_salerate,pro_cre_date,pro_status,pro_color,pro_size,pro_quantity,pro_sold,pro_hits,re_replyCount
		   ,pro_img_code,pro_imgfilename,pro_img_state
  from product p join pro_img i on p.pro_num = i.pro_num;
 
 
 select * from cart c join productall p on c.cart_pro_num = p.pro_num; 
  
 --  productall로 만들기
select cart_num, c.cart_member_id, c.cart_pro_num, cart_pro_quantity, p.pro_imgfilename, p.pro_name, p.pro_price,p.pro_size, p.pro_salerate, p.pro_color, p.pro_quantity
 	from cart c join productall p on c.cart_pro_num = p.pro_num;
 	