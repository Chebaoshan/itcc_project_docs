-- view1_category_shop
create or replace view view1_category_shop as
(select category_id as category_id
      ,category_name as category_name
      ,count(shop_id) as shop_count from
(select tbl3.category_id as category_id
      ,tbl3.category_name_jp as category_name
      ,tbl4.shop_id as shop_id
from tbl4_shop tbl4
left join tbl3_category tbl3
on tbl4.category_id = tbl3.category_id
where tbl3.category_status = 0) tbl4_3
group by category_id,category_name);
-- view2_coupon_get_use
create or replace view view2_coupon_get_use as
(with available_shop as
(select tbl4.shop_id,
       tbl4.shop_name_jp as shop_name
from tbl4_shop tbl4
where tbl4.shop_status = 0),
coupon_get as
(select tbl6.shop_id,
        count(1) as coupon_get_count
from tbl7_user_coupon tbl7
left join tbl6_shop_coupon tbl6
on tbl7.coupon_id = tbl6.coupon_id
group by tbl6.shop_id),
coupon_use as
(select tbl6.shop_id,
        count(1) as coupon_use_count
from tbl7_user_coupon tbl7
left join tbl6_shop_coupon tbl6
on tbl7.coupon_id = tbl6.coupon_id
where tbl7.user_coupon_status = 1
group by tbl6.shop_id)
select * from
(select temp1.shop_name,
       case when temp3.coupon_use_count is null then 0 else temp3.coupon_use_count end as coupon_use_count,
       case when temp2.coupon_get_count is null then 0 else temp2.coupon_get_count end as coupon_get_count
from available_shop temp1
left join coupon_get temp2
on temp1.shop_id = temp2.shop_id
left join coupon_use temp3
on temp2.shop_id = temp3.shop_id) temp4
where coupon_get_count > 0
and coupon_use_count <= coupon_get_count);
-- view4_gender
create or replace view view4_gender as (
select case when tbl5.user_gender = 0 then '女' when tbl5.user_gender = 1 then '男' else '未知' end as user_gender_cn
      ,case when tbl5.user_gender = 0 then '女' when tbl5.user_gender = 1 then '男' else '不明' end as user_gender_jp
      ,case when tbl5.user_gender = 0 then 'Female' when tbl5.user_gender = 1 then 'Male' else 'Unknown' end as user_gender_eng
      ,count(1) as user_num
from tbl5_platform_user tbl5
group by tbl5.user_gender);
-- view7_shop_high_point_top10
create or replace view view7_shop_high_point_top10 as
(with shop_comment_count as
(select shop_id
       ,count(shop_id) as comment_count
 from tbl8_comment tbl8
 where comment_status = 0
 and comment_point >= 4
 group by shop_id)
select tbl4.shop_name_jp as shop_name
      ,tbl1.comment_count
from shop_comment_count tbl1
left join tbl4_shop tbl4
on tbl1.shop_id = tbl4.shop_id
order by tbl1.comment_count desc
limit 10);
-- view8_shop_high_point_low10
create or replace view view8_shop_high_point_low10 as
(with shop_comment_count as
(select shop_id
       ,count(shop_id) as comment_count
 from tbl8_comment tbl8
 where comment_status = 0
 and comment_point >= 4
 group by shop_id)
select tbl4.shop_name_jp as shop_name
      ,tbl1.comment_count
from shop_comment_count tbl1
left join tbl4_shop tbl4
on tbl1.shop_id = tbl4.shop_id
order by tbl1.comment_count asc
limit 10);
-- view9_category_high_point_top5
create or replace view view9_category_high_point_top5 as
(with shop_comment_count as
(select shop_id
       ,count(shop_id) as comment_count
 from tbl8_comment tbl8
 where comment_status = 0
 and comment_point >= 4
 group by shop_id),
category_comment_count as
(select tbl4.category_id
       ,sum(tbl1.comment_count) as comment_count
from shop_comment_count tbl1
left join tbl4_shop tbl4
on tbl1.shop_id = tbl4.shop_id
group by tbl4.category_id)
select tbl3.category_name_jp as category_name
      ,tbl1.comment_count
from category_comment_count tbl1
left join tbl3_category tbl3
on tbl1.category_id = tbl3.category_id
order by tbl1.comment_count desc
limit 5);
-- view10_category_high_point_low5
create or replace view view10_category_high_point_low5 as
(with shop_comment_count as
(select shop_id
       ,count(shop_id) as comment_count
 from tbl8_comment tbl8
 where comment_status = 0
 and comment_point >= 4
 group by shop_id),
category_comment_count as
(select tbl4.category_id
       ,sum(tbl1.comment_count) as comment_count
from shop_comment_count tbl1
left join tbl4_shop tbl4
on tbl1.shop_id = tbl4.shop_id
group by tbl4.category_id)
select tbl3.category_name_jp as category_name
      ,tbl1.comment_count
from category_comment_count tbl1
left join tbl3_category tbl3
on tbl1.category_id = tbl3.category_id
order by tbl1.comment_count asc
limit 5);