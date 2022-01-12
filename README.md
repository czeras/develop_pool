# develop_pool
项目中一些资料整理





## 宏定义
#### iOS 腾讯IM 判断是否是 iPhone X 宏定义
```
#define Screen_Width      [UIScreen mainScreen].bounds.size.width
#define Screen_Height     [UIScreen mainScreen].bounds.size.height
#define Is_Iphone         (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define Is_IPhoneX        (Screen_Width >=375.0f && Screen_Height >=812.0f && Is_Iphone)
#define StatusBar_Height  (Is_IPhoneX ? (44.0):(20.0))
#define TabBar_Height     (Is_IPhoneX ? (49.0 + 34.0):(49.0))
#define NavBar_Height     (44)
#define SearchBar_Height  (55)
#define Bottom_SafeHeight (Is_IPhoneX ? (34.0):(0))
#define RGBA(r, g, b, a)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]
#define RGB(r, g, b)      [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.f]
```