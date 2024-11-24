【注意事项】
1.iOS 目前由于是网页模拟的原因，有一些不兼容的问题，演示时要用 Android 的 app； 2.演示注册功能时，先进行账号的登入登出操作；
3.app 语言跟随系统语言切换功能目前只在地区设置为中国时生效； 4.口コミ分析功能由于每次点击后显示的结果不同，尽量不要重复点击该功能； 5.店铺分析的按地区分布功能，从其他标签（按优惠券划分使用状况，店铺点评统计，会员分布情况）切回来时分布图会消失，尽量不要在选中地区分布的情况下直接切换标签，可以先选择按种类分布，再点击主页的其他标签； 6.长时间没有操作可能会导致登录状态失效，可以尝试重启 App；
7.App 首页加载较慢；

【意外情况对应】
如果出现服务器无法连接等现象，可以尝试重启服务器，重启流程如下： 1.登录阿里云的控制面板（需要短信验证），进入所购买的服务器实例页面，点击重启按钮； 2.重启完成后，通过阿里云账号的控制面板或者其他终端连接服务器，服务器地址：172.23.128.85，用户名：root，密码：Root20241108； 3.查看 MySQL 状态，是否为 active/running，若非启动状态，则输入启动命令：sudo systemctl status mysql 4.查看 Redis 状态，是否为 active/running，若非启动状态，则输入启动命令：sudo systemctl status redis 5.查看 nginx 状态，是否为 active/running，若非启动状态，则输入启动命令：sudo systemctl status nginx 6.启动 Java 后端应用程序：
cd /home/couponkun_app/backend
nohup java -jar -Duser.timezone=GMT+9 couponkun_management_itcc.jar --spring.profiles.active=prod &
nohup java -jar -Duser.timezone=GMT+9 couponkun_app_itcc.jar --spring.profiles.active=prod &
（具体可以参考【参考資料/システム情報.xlsx】）
