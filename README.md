# JXLDayAndNightModeDemo/夜间模式
**Demo的使用很简单，在项目中引入主头文件**

	#import "JXLDayAndNightMode.h"
**在需要设置夜间模式的控件调用UIView类目中的设置方法，在block回调中设置该视图的对应状态。**

	// 设置日间和夜间两种状态
    [self.view jxl_setDayMode:^(UIView *view) {
        // 设置日间模式状态
        // view为当前设置的视图
        view.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        // view为当前设置的视图
        // 设置夜间模式状态
        view.backgroundColor = [UIColor blackColor];
    }];
    
**在设置中也可以设置其子视图状态**

	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button setTitle:@"touch" forState:UIControlStateNormal];
    [button jxl_setDayMode:^(UIView *view) {
        
        UIButton *setButton = (UIButton *)view;
        setButton.backgroundColor = [UIColor blackColor];
        [setButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
    } nightMode:^(UIView *view) {
        
        UIButton *setButton = (UIButton *)view;
        setButton.backgroundColor = [UIColor whiteColor];
        [setButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    }];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
**可通过JXLDayAndNightManager单例的contentMode属性获取当前的模式**

	[[JXLDayAndNightManager shareManager] contentMode];
**contentMode枚举类型**

	typedef enum : NSUInteger {
    	JXLDayAndNightModeDay, // 日间模式
    	JXLDayAndNightModeNight, // 夜间模式
	} JXLDayAndNightMode;	
**开启日间模式或者夜间模式都会对自动对相关设置进行本地存储纪录,程序默认为日间模式**

	[[JXLDayAndNightManager shareManager] nightMode]; //开启夜间模式
	[[JXLDayAndNightManager shareManager] dayMode]; // 开启日间模式
**可使用通知中心自定义监听改变模式事件**

	extern NSString *const JXLChangeModeNotification; // 模式改变的监听事件名称

