# JXLDayAndNightModeDemo/夜间模式
demo的使用很简单，在项目中引入JXLDayAndNightMode.h,
在需要设置夜间模式的控件调用UIView类目中的设置方法，
可通过manager单例的contentMode属性获取当前的模式，
开启日间模式或者夜间模式都会对自动对相关设置进行本地存储纪录
