CREATE TABLE `tbl1_platform_admin` (
  `admin_id` binary(16) NOT NULL   COMMENT 'ID (UUID)',
  `admin_shop_id` int NOT NULL   COMMENT '所属店舗ID （店員所属店舗ID、該当プラットフォームの管理担当ならば、０が設定0）',
  `admin_username` varchar(50) NOT NULL   COMMENT '登録名',
  `admin_nickname` varchar(50) NOT NULL   COMMENT 'ニックネーム',
  `admin_password` text NOT NULL   COMMENT 'パスワード',
  `admin_role` varchar(20) NOT NULL   COMMENT '権限 （管理員権限： ADMIN/店員権限：STAFF)',
  `admin_status` int NOT NULL   COMMENT 'アカウント状態区分 (0　利用可/1　利用不可)',
  `admin_create_by` binary(16) NOT NULL   COMMENT 'アカウント作成者',
  `admin_create_at` timestamp(6) NOT NULL   COMMENT 'アカウント作成日時',
  `admin_update_by` binary(16) NOT NULL   COMMENT 'アカウント更新者',
  `admin_update_at` timestamp(6) NOT NULL   COMMENT 'アカウント更新日時',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='プラットフォーム管理者＆店員テーブル';

CREATE TABLE `tbl2_area` (
  `area_id` int NOT NULL AUTO_INCREMENT  COMMENT 'エリアID',
  `area_name_cn` varchar(20) NOT NULL   COMMENT 'エリア名（中国語）',
  `area_name_jp` varchar(20) NOT NULL   COMMENT 'エリア名（日本語）',
  `area_note` text    COMMENT 'エリア備考',
  `area_sw_lat` decimal(10,8) NOT NULL   COMMENT '座標１の緯度(西南の角)',
  `area_sw_lng` decimal(11,8) NOT NULL   COMMENT '座標１の経度(西南の角)',
  `area_ne_lat` decimal(10,8) NOT NULL   COMMENT '座標２の緯度(東北の角)',
  `area_ne_lng` decimal(11,8) NOT NULL   COMMENT '座標２の経度(東北の角)',
  `area_status` int NOT NULL   COMMENT 'エリア状態区分（0　表示/1　非表示）',
  `area_create_by` binary(16) NOT NULL   COMMENT 'エリア作成者',
  `area_create_at` timestamp(6) NOT NULL   COMMENT 'エリア作成日時',
  `area_update_by` binary(16) NOT NULL   COMMENT 'エリア更新者',
  `area_update_at` timestamp(6) NOT NULL   COMMENT 'エリア更新日時',
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='エリアテーブル';

CREATE TABLE `tbl3_category` (
  `category_id` int NOT NULL AUTO_INCREMENT  COMMENT '店舗分類ID',
  `category_name_cn` varchar(20) NOT NULL   COMMENT '店舗分類名前（中国語）',
  `category_name_jp` varchar(20) NOT NULL   COMMENT '店舗分類名前（日本語）',
  `category_note` text    COMMENT '店舗分類備考',
  `category_status` int NOT NULL   COMMENT '店舗分類状態区分（0　正常/1　削除済）',
  `category_create_by` binary(16) NOT NULL   COMMENT '店舗分類作成者',
  `category_create_at` timestamp(6) NOT NULL   COMMENT '店舗分類作成日時',
  `category_update_by` binary(16) NOT NULL   COMMENT '店舗分類更新者',
  `category_update_at` timestamp(6) NOT NULL   COMMENT '店舗分類更新日時',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='店舗分類テーブル';

CREATE TABLE `tbl4_shop` (
  `shop_id` int NOT NULL AUTO_INCREMENT  COMMENT '店舗ID',
  `shop_name_cn` varchar(50) NOT NULL   COMMENT '店舗名称（中国語）',
  `shop_name_jp` varchar(50) NOT NULL   COMMENT '店舗名称（日本語）',
  `shop_desc_cn` text NOT NULL   COMMENT '店舗紹介（中国語）',
  `shop_desc_jp` text NOT NULL   COMMENT '店舗紹介（日本語）',
  `category_id` int NOT NULL   COMMENT '店舗分類ID',
  `shop_addr_class1` int NOT NULL   COMMENT '店舗住所-都道府县ID',
  `shop_addr_class2` int NOT NULL   COMMENT '店舗住所-市区町村ID',
  `shop_addr_cn` text NOT NULL   COMMENT '店舗住所-詳細（中国語）',
  `shop_addr_jp` text NOT NULL   COMMENT '店舗住所-詳細（日本語）',
  `shop_addr_lat` decimal(10,8) NOT NULL   COMMENT '店舗住所-緯度',
  `shop_addr_lng` decimal(11,8) NOT NULL   COMMENT '店舗住所-経度',
  `area_id` int NOT NULL   COMMENT 'エリアID',
  `shop_expense_from` int NOT NULL   COMMENT '店舗消費区間（から）',
  `shop_expense_to` int NOT NULL   COMMENT '店舗消費区間（まで）',
  `shop_contact` text NOT NULL   COMMENT '連絡先',
  `shop_workday_cn` text NOT NULL   COMMENT '定休日（中国語）',
  `shop_workday_jp` text NOT NULL   COMMENT '定休日（日本語）',
  `shop_worktime1_from` time NOT NULL   COMMENT '営業時間1（から）',
  `shop_worktime1_to` time NOT NULL   COMMENT '営業時間1（まで）',
  `shop_worktime2_from` time    COMMENT '営業時間2（から）',
  `shop_worktime2_to` time    COMMENT '営業時間2（まで）',
  `shop_detail_1_cn` text    COMMENT '店舗紹介のフリー入力（中国語）',
  `shop_detail_1_jp` text    COMMENT '店舗紹介のフリー入力（日本語）',
  `shop_pics` text NOT NULL   COMMENT '店舗写真 (店铺轮播图图片，JSON数组)',
  `shop_contact_qrcode` text    COMMENT '店舗連絡QRコード',
  `shop_tag_cn` text    COMMENT '口コミタグ(中国語)',
  `shop_tag_jp` text    COMMENT '口コミタグ(日本語)',
  `shop_tag_eng` text    COMMENT '口コミタグ(英語)',
  `tag_update_at` timestamp(6)    COMMENT '口コミタグ更新日時',
  `shop_note` text    COMMENT '店舗備考',
  `shop_status` int NOT NULL   COMMENT '店铺状態区分（0　表示/1　非表示）',
  `shop_create_by` binary(16) NOT NULL   COMMENT '店舗作成者',
  `shop_create_at` timestamp(6) NOT NULL   COMMENT '店舗作成日時',
  `shop_update_by` binary(16) NOT NULL   COMMENT '店舗更新者',
  `shop_update_at` timestamp(6) NOT NULL   COMMENT '店舗更新日時',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='店舗テーブル';

CREATE TABLE `tbl5_platform_user` (
  `user_id` binary(16) NOT NULL   COMMENT '会員ID',
  `user_email` text NOT NULL   COMMENT '会員メールアドレス',
  `user_username` varchar(50) NOT NULL   COMMENT '会員登録名',
  `user_nickname` varchar(50) NOT NULL   COMMENT '会員ニックネーム',
  `user_password` text NOT NULL   COMMENT 'パスワード',
  `user_role` varchar(20) NOT NULL   COMMENT '会員権限',
  `user_status` int NOT NULL   COMMENT '会員アカウント状態区分（0　使用可/1　使用不可）',
  `user_country` int    COMMENT '会員国別-国別ID',
  `user_addr_class1` int    COMMENT '会員エリア-都道府县ID',
  `user_addr_class2` int    COMMENT '会員エリア-市区町村ID',
  `user_gender` tinyint    COMMENT '会員性別（1　男/0　女/NULL　不明）（1:男 0:女）',
  `user_birthdate` date    COMMENT '会員誕生日',
  `user_hobby` text    COMMENT '会員趣味',
  `user_create_by` binary(16) NOT NULL   COMMENT '会員作成者',
  `user_create_at` timestamp(6) NOT NULL   COMMENT '会員作成日時',
  `user_update_by` binary(16) NOT NULL   COMMENT '会員更新者',
  `user_update_at` timestamp(6) NOT NULL   COMMENT '会員更新日時',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='会員テーブル';

CREATE TABLE `tbl6_shop_coupon` (
  `coupon_id` int NOT NULL AUTO_INCREMENT  COMMENT 'クーポンID',
  `shop_id` int NOT NULL   COMMENT 'クーポン所属店舗ID',
  `coupon_title_cn` varchar(50) NOT NULL   COMMENT 'クーポン名（中国語）',
  `coupon_title_jp` varchar(50) NOT NULL   COMMENT 'クーポン名（日本語）',
  `discount_entrance` decimal(18,2) NOT NULL   COMMENT '割引以上額',
  `discount_amount` decimal(18,2) NOT NULL   COMMENT '割引額',
  `coupon_vaild_from` timestamp(6) NOT NULL   COMMENT 'クーポン有効期間から',
  `coupon_valid_to` timestamp(6) NOT NULL   COMMENT 'クーポン有効期間まで',
  `coupon_status` int NOT NULL   COMMENT 'クーポン状態区分（-1　未受け取り/0　受け取り可/1　受け取り完了）',
  `coupon_desc_cn` text NOT NULL   COMMENT 'クーポン詳細説明（中国語）',
  `coupon_desc_jp` text NOT NULL   COMMENT 'クーポン詳細説明（日本語）',
  `coupon_create_by` binary(16) NOT NULL   COMMENT 'クーポン作成者',
  `coupon_create_at` timestamp(6) NOT NULL   COMMENT 'クーポン作成日時',
  `coupon_update_by` binary(16) NOT NULL   COMMENT 'クーポン更新者',
  `coupon_update_at` timestamp(6) NOT NULL   COMMENT 'クーポン更新日時',
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='店舗クーポンテーブル';

CREATE TABLE `tbl7_user_coupon` (
  `user_coupon_id` varchar(20) NOT NULL   COMMENT '会員クーポンID',
  `coupon_id` int NOT NULL   COMMENT 'クーポンID',
  `user_coupon_valid_to` timestamp(6) NOT NULL   COMMENT '会員クーポン有効期間',
  `user_coupon_status` int NOT NULL   COMMENT '会員クーポン状態区分',
  `user_coupon_create_by` binary(16) NOT NULL   COMMENT '会員クーポン作成者',
  `user_coupon_create_at` timestamp(6) NOT NULL   COMMENT '会員クーポン作成日時',
  `user_coupon_update_by` binary(16) NOT NULL   COMMENT '会員クーポン更新者',
  `user_coupon_update_at` timestamp(6) NOT NULL   COMMENT '会員クーポン更新日時',
  PRIMARY KEY (`user_coupon_id`, `user_coupon_create_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='会員クーポンテーブル';

CREATE TABLE `tbl8_comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT  COMMENT '口コミID',
  `shop_id` int NOT NULL   COMMENT '店舗ID',
  `comment_point` int NOT NULL   COMMENT '口コミの五つ星',
  `comment_text` text NOT NULL   COMMENT '口コミの詳細',
  `comment_status` int NOT NULL   COMMENT '口コミ状態区分',
  `comment_create_by` binary(16) NOT NULL   COMMENT '口コミ作成者',
  `comment_create_at` timestamp(6) NOT NULL   COMMENT '口コミ作成日時',
  `comment_update_by` binary(16) NOT NULL   COMMENT '口コミ更新者',
  `comment_update_at` timestamp(6) NOT NULL   COMMENT '口コミ更新日時',
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
  `parent_region_id` int NOT NULL   COMMENT '区域父ID',
  `region_name` varchar(50) NOT NULL   COMMENT '区域名前',
  `region_name_romaji` varchar(100)    COMMENT '区域名前(ローマ字)',
  `region_type` tinyint NOT NULL   COMMENT '区域類型',
  `region_code` int NOT NULL   COMMENT '区域ポストコード',
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
  `shop_id` int NOT NULL   COMMENT '店舗ID',
  `favourite_create_by` binary(16) NOT NULL   COMMENT 'ブックマーク作成者',
  `favourite_create_at` timestamp(6) NOT NULL   COMMENT 'ブックマーク作成日時',
  PRIMARY KEY (`shop_id`, `favourite_create_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ブックマークテーブル';

CREATE TABLE `tbl10_shop_menu` (
  `menu_item_id` int NOT NULL AUTO_INCREMENT  COMMENT 'メニュー対象ID',
  `shop_id` int NOT NULL   COMMENT 'メニュー対象所属店舗ID',
  `menu_item_title_cn` varchar(20) NOT NULL   COMMENT 'メニュー対象名（中国語）',
  `menu_item_title_jp` varchar(20) NOT NULL   COMMENT 'メニュー対象名（日本語）',
  `menu_item_desc_cn` varchar(100) NOT NULL   COMMENT 'メニュー対象紹介（中国語）',
  `menu_item_desc_jp` varchar(100) NOT NULL   COMMENT 'メニュー対象紹介（日本語）',
  `menu_item_recommend` int NOT NULL   COMMENT '店家推奨（0　いいえ/1　はい）',
  `menu_item_price` decimal(18,2)    COMMENT 'メニュー対象価格',
  `tax_include` int NOT NULL   COMMENT '税込表示（0　税抜/1　税込）',
  `menu_item_price_mode` int NOT NULL   COMMENT 'メニュー対象価格状態区分（0　表示/1　時価）',
  `menu_item_pic` text NOT NULL   COMMENT 'メニュー対象写真',
  `menu_item_status` int NOT NULL   COMMENT 'メニュー対象状態区分（0　表示/1　非表示）',
  `menu_item_create_by` binary(16) NOT NULL   COMMENT 'メニュー対象作成者',
  `menu_item_create_at` timestamp(6) NOT NULL   COMMENT 'メニュー対象作成日時',
  `menu_item_update_by` binary(16) NOT NULL   COMMENT 'メニュー対象更新者',
  `menu_item_update_at` timestamp(6) NOT NULL   COMMENT 'メニュー対象更新日時',
  PRIMARY KEY (`menu_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='店舗メニューテーブル';

CREATE TABLE `tbl11_shop_menu_like` (
  `menu_item_id` int NOT NULL   COMMENT 'メニュー対象ID',
  `menu_like_by` binary(16) NOT NULL   COMMENT '作成者',
  `menu_like_at` timestamp(6) NOT NULL   COMMENT '作成日時',
  PRIMARY KEY (`menu_item_id`, `menu_like_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='店舗メニュー「like」テーブル';

