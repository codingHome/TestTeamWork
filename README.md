#TestTeamWork
===
RYFramWork
===

##RYRequest

* 继承自__AFHTTPRequestOperationManager__是GET请求和POST请求的封装。

##RYNetOperation

* 网络请求类，通过调用RYRequest来实现网络请求，并以delegate的方式实现回调。
* 请求类属性

	使用方式 | 属性 |
	------------ | ------------- 
	请求服务器URL | NSString *url  
	请求参数 | NSDictionary *params  
	完整的GET_URL | NSString *completeURL 
	完整请求回调数据 |NSDictionary *responseData
	请求数据解析对象 |id resultData
* delegate回调

	```objc
	
	- (void)netOperationDidFinish:(RYNetOperation *)operation;
	- (void)netOperationDidFailed:(RYNetOperation *)operation;
	
	```
	
##RYModel

* 继承自__JSONModel__，是工程中model层的基类。
* 命名时应与网络请求类的名称相对应。
 
	例：
	
	RYNetOperation | RYModel |
	------------ | ------------- 
	`Woeid`NetOperation | `Woeid`Model
	
	
##RYCache

* 继承自__YTKKeyValueStore__，是以键值方式存储的数据库。
* 在网络请求成功后会自动调用，用于缓存。
* 无网的状态下会自动加载上次缓存的数据。

##RYNetObservor

* 继承自__Reachability__，用于判断当前的网络状态。

##UIColor+hexColor

* 将16进制颜色转成UIColor。

##UIImageView+LoadImage

* 对于__SDWebImage__的封装，用于图片的加载与缓存。