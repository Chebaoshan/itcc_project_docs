CREATE TABLE `tbl1_platform_admin` (
  `admin_id` binary(16) NOT NULL   COMMENT 'ID (UUID)',
  `admin_shop_id` int NOT NULL   COMMENT '所属店舗ID (店员所属店铺ID，平台管理员统一为0)',
  `admin_username` varchar(50) NOT NULL   COMMENT '登録名 (登录名)',
  `admin_nickname` varchar(50) NOT NULL   COMMENT 'ニックネーム (昵称)',
  `admin_password` text NOT NULL   COMMENT 'パスワード (密码)',
  `admin_role` varchar(20) NOT NULL   COMMENT '権限 (平台管理员权限: ADMIN/店员权限: STAFF)',
  `admin_status` int NOT NULL   COMMENT 'アカウント状態区分 (账号状态:0启用/1禁用)',
  `admin_create_by` binary(16) NOT NULL   COMMENT 'アカウント作成者 (账号创建者)',
  `admin_create_at` timestamp(6) NOT NULL   COMMENT 'アカウント作成日時 (账号创建时间)',
  `admin_update_by` binary(16) NOT NULL   COMMENT 'アカウント更新者 (账号更新者)',
  `admin_update_at` timestamp(6) NOT NULL   COMMENT 'アカウント更新日時 (账号更新时间)',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='プラットフォーム管理者＆店員テーブル';

CREATE TABLE `tbl2_area` (
  `area_id` int NOT NULL AUTO_INCREMENT  COMMENT 'エリアID (商圈ID)',
  `area_name` varchar(20) NOT NULL   COMMENT 'エリア名 (商圈名称)',
  `area_note` text    COMMENT 'エリア備考 (商圈备注，仅平台管理员可见)',
  `area_sw_lat` decimal(10,8) NOT NULL   COMMENT '座標１の緯度(西南の角)',
  `area_sw_lng` decimal(11,8) NOT NULL   COMMENT '座標１の経度(西南の角)',
  `area_ne_lat` decimal(10,8) NOT NULL   COMMENT '座標２の緯度(東北の角)',
  `area_ne_lng` decimal(11,8) NOT NULL   COMMENT '座標２の経度(東北の角)',
  `area_status` int NOT NULL   COMMENT 'エリア状態区分 (商圈显示状态:0显示/1隐藏)',
  `area_create_by` binary(16) NOT NULL   COMMENT 'エリア作成者 (商圈创建者)',
  `area_create_at` timestamp(6) NOT NULL   COMMENT 'エリア作成日時 (商圈创建时间)',
  `area_update_by` binary(16) NOT NULL   COMMENT 'エリア更新者 (商圈更新者)',
  `area_update_at` timestamp(6) NOT NULL   COMMENT 'エリア更新日時 (商圈更新时间)',
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='エリアテーブル';

CREATE TABLE `tbl3_category` (
  `category_id` int NOT NULL AUTO_INCREMENT  COMMENT '店舗分類ID (分类ID)',
  `category_name` varchar(20) NOT NULL   COMMENT '店舗分類名前 (分类名称)',
  `category_note` text    COMMENT '店舗分類備考 (分类备注，仅平台管理员可见)',
  `category_status` int NOT NULL   COMMENT '店舗分類状態区分 (分类显示状态: 0正常/1已删除)',
  `category_create_by` binary(16) NOT NULL   COMMENT '店舗分類作成者 (分类创建者)',
  `category_create_at` timestamp(6) NOT NULL   COMMENT '店舗分類作成日時 (分类创建时间)',
  `category_update_by` binary(16) NOT NULL   COMMENT '店舗分類更新者 (分类更新者)',
  `category_update_at` timestamp(6) NOT NULL   COMMENT '店舗分類更新日時 (分类更新时间)',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='店舗分類テーブル';

CREATE TABLE `tbl4_shop` (
  `shop_id` int NOT NULL AUTO_INCREMENT  COMMENT '店舗ID (店铺ID)',
  `shop_name` varchar(50) NOT NULL   COMMENT '店舗名称',
  `shop_desc` text NOT NULL   COMMENT '店舗紹介',
  `category_id` int NOT NULL   COMMENT '店舗分類ID (分类ID)',
  `shop_addr_class1` int NOT NULL   COMMENT '店舗住所-都道府县ID',
  `shop_addr_class2` int NOT NULL   COMMENT '店舗住所-市区町村ID',
  `shop_addr` text NOT NULL   COMMENT '店舗住所-詳細',
  `shop_addr_lat` decimal(10,8)   COMMENT '店舗住所-緯度',
  `shop_addr_lng` decimal(11,8)   COMMENT '店舗住所-経度',
  `area_id` int NOT NULL   COMMENT 'エリアID (商圈ID)',
  `shop_expense` text NOT NULL   COMMENT '店舗消費区間',
  `shop_contact` text NOT NULL   COMMENT '連絡先',
  `shop_workday` text NOT NULL   COMMENT '定休日',
  `shop_worktime` text NOT NULL   COMMENT '営業時間',
  `shop_detail_1` text    COMMENT '店舗紹介のフリー入力',
  `shop_pics` text NOT NULL   COMMENT '店舗写真 (店铺轮播图图片，JSON数组)',
  `shop_tag_cn` text    COMMENT '口コミタグ(中国語)',
  `shop_tag_jp` text    COMMENT '口コミタグ(日本語)',
  `shop_tag_eng` text    COMMENT '口コミタグ(英語)',
  `tag_update_at` timestamp(6)    COMMENT '口コミタグ更新日時',
  `shop_note` text    COMMENT '店舗備考 (店铺备注，仅平台管理员可见)',
  `shop_status` int NOT NULL   COMMENT '店铺状態区分 (商圈显示状态:0显示/1隐藏)',
  `shop_create_by` binary(16) NOT NULL   COMMENT '店舗作成者 (店铺创建者)',
  `shop_create_at` timestamp(6) NOT NULL   COMMENT '店舗作成日時 (店铺创建时间)',
  `shop_update_by` binary(16) NOT NULL   COMMENT '店舗更新者 (店铺更新者)',
  `shop_update_at` timestamp(6) NOT NULL   COMMENT '店舗更新日時 (店铺更新时间)',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='店舗テーブル';

CREATE TABLE `tbl5_platform_user` (
  `user_id` binary(16) NOT NULL   COMMENT '会員ID (用户ID-UUID)',
  `user_email` text NOT NULL   COMMENT '会員メールアドレス (用户电子邮件地址)',
  `user_username` varchar(50) NOT NULL   COMMENT '会員登録名 (用户登录名)',
  `user_nickname` varchar(50) NOT NULL   COMMENT '会員ニックネーム (用户昵称)',
  `user_password` text NOT NULL   COMMENT 'パスワード (用户密码)',
  `user_role` varchar(20) NOT NULL   COMMENT '会員権限 (用户权限: USER)',
  `user_status` int NOT NULL   COMMENT '会員アカウント状態区分 (用户账号状态:0启用/1禁用)',
  `user_country` int    COMMENT '会員国別-国別ID',
  `user_addr_class1` int    COMMENT '会員エリア-都道府县ID',
  `user_addr_class2` int    COMMENT '会員エリア-市区町村ID',
  `user_gender` tinyint    COMMENT '会員性別（1:男 0:女）',
  `user_birthdate` date    COMMENT '会員誕生日（用户生日）',
  `user_hobby` text    COMMENT '会員趣味 (用户兴趣爱好，兴趣爱好master表ID使用半角逗号分隔开)',
  `user_create_by` binary(16) NOT NULL   COMMENT '会員作成者 (用户创建者)',
  `user_create_at` timestamp(6) NOT NULL   COMMENT '会員作成日時 (用户创建时间)',
  `user_update_by` binary(16) NOT NULL   COMMENT '会員更新者 (用户更新者)',
  `user_update_at` timestamp(6) NOT NULL   COMMENT '会員更新日時 (用户更新时间)',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='会員テーブル';

CREATE TABLE `tbl6_shop_coupon` (
  `coupon_id` int NOT NULL AUTO_INCREMENT  COMMENT 'クーポンID (优惠券ID)',
  `shop_id` int NOT NULL   COMMENT 'クーポン所属店舗ID (优惠券所属店铺ID)',
  `coupon_title` varchar(50) NOT NULL   COMMENT 'クーポン名 (优惠券名称)',
  `discount_entrance` decimal(18,2) NOT NULL   COMMENT '割引以上額 (折扣门槛金额)',
  `discount_amount` decimal(18,2) NOT NULL   COMMENT '割引額 (折扣金额)',
  `coupon_vaild_from` timestamp(6) NOT NULL   COMMENT 'クーポン有効期間から (优惠券有效期间: from)',
  `coupon_valid_to` timestamp(6) NOT NULL   COMMENT 'クーポン有効期間まで (优惠券有效期间: to)',
  `coupon_status` int NOT NULL   COMMENT 'クーポン状態区分 (-1:未开始领取/0可领取/1领取结束)',
  `coupon_desc` text NOT NULL   COMMENT 'クーポン詳細説明 (优惠券详情)',
  `coupon_create_by` binary(16) NOT NULL   COMMENT 'クーポン作成者 (优惠券创建者)',
  `coupon_create_at` timestamp(6) NOT NULL   COMMENT 'クーポン作成日時 (优惠券创建时间)',
  `coupon_update_by` binary(16) NOT NULL   COMMENT 'クーポン更新者 (优惠券更新者)',
  `coupon_update_at` timestamp(6) NOT NULL   COMMENT 'クーポン更新日時 (优惠券更新时间)',
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='店舗クーポンテーブル';

CREATE TABLE `tbl7_user_coupon` (
  `user_coupon_id` varchar(20) NOT NULL   COMMENT '会員クーポンID (用户优惠券编码，格式：U+优惠券ID不足4位补0+领取时刻10位时间戳+用户UUID末4位)',
  `coupon_id` int NOT NULL   COMMENT 'クーポンID (优惠券ID)',
  `user_coupon_valid_to` timestamp(6) NOT NULL   COMMENT '会員クーポン有効期間 (用户优惠券使用有效期限，默认状态下与优惠券发行有效期限相同，但如果优惠券被商家主动下架，该使用有效期限不发生变化)',
  `user_coupon_status` int NOT NULL   COMMENT '会員クーポン状態区分 (0:待使用/1:已使用/2:已过期)',
  `user_coupon_create_by` binary(16) NOT NULL   COMMENT '会員クーポン作成者 (用户优惠券领取者)',
  `user_coupon_create_at` timestamp(6) NOT NULL   COMMENT '会員クーポン作成日時 (用户优惠券领取时间)',
  `user_coupon_update_by` binary(16) NOT NULL   COMMENT '会員クーポン更新者 (用户优惠券更新者)',
  `user_coupon_update_at` timestamp(6) NOT NULL   COMMENT '会員クーポン更新日時 (用户优惠券更新时间)',
  PRIMARY KEY (`user_coupon_id`, `user_coupon_create_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='会員クーポンテーブル';

CREATE TABLE `tbl8_comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT  COMMENT '口コミID (店铺点评ID)',
  `shop_id` int NOT NULL   COMMENT '店舗ID (店铺ID)',
  `comment_point` int NOT NULL   COMMENT '口コミの五つ星 (店铺星等)',
  `comment_text` text NOT NULL   COMMENT '口コミの詳細 (点评详情)',
  `comment_status` int NOT NULL   COMMENT '口コミ状態区分 (0:正常/1:用户主动删除/2:管理员屏蔽)',
  `comment_create_by` binary(16) NOT NULL   COMMENT '口コミ作成者 (店铺点评发布者)',
  `comment_create_at` timestamp(6) NOT NULL   COMMENT '口コミ作成日時 (店铺点评发布时间)',
  `comment_update_by` binary(16) NOT NULL   COMMENT '口コミ更新者 (店铺点评更新者)',
  `comment_update_at` timestamp(6) NOT NULL   COMMENT '口コミ更新日時 (店铺点评更新时间)',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='口コミテーブル';

CREATE TABLE `mst1_country` (
  `country_id` int NOT NULL AUTO_INCREMENT  COMMENT '国別ID',
  `country_name_cn` varchar(100) NOT NULL   COMMENT '国別名前(中国語)',
  `country_name_jp` varchar(100) NOT NULL   COMMENT '国別名前(日本語)',
  `country_name_eng` varchar(100) NOT NULL   COMMENT '国別名前(英語)',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='国別テーブル';

CREATE TABLE `mst2_region` (
  `region_id` int NOT NULL   COMMENT '区域ID',
  `parent_region_id` int NOT NULL   COMMENT '区域父ID（例如区县的pid指向市，市的pid指向省，省的pid则是0）',
  `region_name` varchar(50) NOT NULL   COMMENT '区域名前',
  `region_name_romaji` varchar(100)   COMMENT '区域名前(ローマ字)',
  `region_type` tinyint NOT NULL   COMMENT '区域類型（如1则是都道府县， 如果是2则是区市町村...）',
  `region_code` int NOT NULL   COMMENT '区域ポストコード（区域的实际完整编码）',
  PRIMARY KEY (`region_id`, `parent_region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='区域テーブル';

CREATE TABLE `mst3_hobby` (
  `hobby_id` int NOT NULL AUTO_INCREMENT  COMMENT '趣味ID',
  `hobby_name_cn` varchar(100) NOT NULL   COMMENT '趣味名前(中国語)',
  `hobby_name_jp` varchar(100) NOT NULL   COMMENT '趣味名前(日本語)',
  `hobby_name_eng` varchar(100) NOT NULL   COMMENT '趣味名前(英語)',
  PRIMARY KEY (`hobby_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='趣味テーブル';

CREATE TABLE `tbl9_favourite` (
  `shop_id` int NOT NULL   COMMENT '店舗ID (店铺ID)',
  `favourite_create_by` binary(16) NOT NULL   COMMENT 'ブックマーク作成者 (店铺收藏者)',
  `favourite_create_at` timestamp(6) NOT NULL   COMMENT 'ブックマーク作成日時 (店铺收藏时间)',
  PRIMARY KEY (`shop_id`, `favourite_create_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ブックマークテーブル';

