package com.talkingdata.sdk
{
	import flash.external.ExtensionContext;
	
	public class TalkingDataAdTracking
	{
		//函数名称，以后的调用都是过这个方法名来传递的
		public static const functionName:String="TalkingDataFunctions";
		internal static var extContext:ExtensionContext;
		
		/**
		 * 初始化方法
		 * @param appid 从talkingdata网站申请的id
		 * @param channelid 程序发布的渠道名字，如，appstore googlepay 360等
		 * */
		public static function init(appId :String,channelId:String):void{
			createExtensionContext();
			try
			{
				extContext.call(functionName,TalkingDataAneFunction.AdTracking_init,appId,channelId);
			} 
			catch(error:Error) 
			{
				
			}
		}
		
		/**
		 * 当用户注册时调用，可以用来跟踪用户注册行为
		 * @param account 用户名或者是用来标识用户的id
		 * */
		public static function onRegister(account :String):void{
			createExtensionContext();
			try
			{
				extContext.call(functionName,TalkingDataAneFunction.AdTracking_onRegister,account);
			} 
			catch(error:Error) 
			{
				
			}
		}
		
		/**
		 * 当用户登录时调用，可以用来跟踪用户登录行为
		 * @param account 用户名或者是用来标识用户的id
		 * */
		public static function onLogin(account :String):void{
			createExtensionContext();
			try
			{
				extContext.call(functionName,TalkingDataAneFunction.AdTracking_onLogin,account);
			} 
			catch(error:Error) 
			{
				
			}
		}
		/***
		 * 消费事件跟踪
		 * @param account 用户名
		 * @param orderId 订单ID
		 * @param amount 支付金额以分为单位 100=1元
		 * @param currencyType 货币类型 美元USD 人民币：CNY 等
		 * @param payType 支付方式 如果unipay alipay 等
		 * */
		public static function onPay(account :String,orderId:String,amount:int,currencyType:String,payType:String):void{
			createExtensionContext();
			try
			{
				extContext.call(functionName,TalkingDataAneFunction.AdTracking_onPay,account,orderId,amount,currencyType,payType);
			} 
			catch(error:Error) 
			{
			}
		}
		//		public static function onPay(account :String,orderId:String,amount:int,currencyType:String):void{
		//			TalkingDataAdTracking.onPay(account,orderId,amount,currencyType,"default");
		//		}
		/**
		 * 角色创建事件
		 * @param roleName 角色名称
		 * */
		public static function onCreateRole(roleName :String):void{
			createExtensionContext();
			try
			{
				extContext.call(functionName,TalkingDataAneFunction.AdTracking_onCreateRole,roleName);
			} 
			catch(error:Error) 
			{
				
			}
		}
		/***
		 * 订单支持支付成功事件
		 * @param account 用户名
		 * @param orderId 订单ID
		 * @param amount 支付金额以分为单位 100=1元
		 * @param currencyType 货币类型 美元USD 人民币：CNY 等
		 * @param payType 支付方式 如果unipay alipay 等
		 * */
		public static function onOrderPaySucc(account :String,orderId:String,amount:int,currencyType:String,payType:String):void{
			createExtensionContext();
			try
			{
				extContext.call(functionName,TalkingDataAneFunction.AdTracking_onOrderPaySucc,account,orderId,amount,currencyType,payType);
			} 
			catch(error:Error) 
			{
				
			}
		}
		/***
		 * 获取TalkingData标识设备的ID
		 * @return talkingdata用来标识设备的ID
		 * */
		public static function getDeviceId():String{
			createExtensionContext();
			try
			{
				return extContext.call(functionName,TalkingDataAneFunction.AdTracking_getDeviceId) as String;
			} 
			catch(error:Error) 
			{
				
			}
			return "";
		}
		
		/***
		 *下订单事件
		 * @param order com.talkingdata.sdk.Order类型
		 * */
		public static function onPlaceOrder(account:String,order:Order):void{
			createExtensionContext();
			try
			{
				extContext.call(functionName,TalkingDataAneFunction.AdTracking_onPlaceOrder,account,order.toJsonString());
			} 
			catch(error:Error) 
			{
				
			}
		}
		
		
		/**
		 *自定义事件1
		 **/
		public static function onCustEvent1():void{
			createExtensionContext();
			try
			{
				extContext.call(functionName,TalkingDataAneFunction.AdTracking_onCustEvent1);
			} 
			catch(error:Error) 
			{
				
			}
		}
		/**
		 *自定义事件2 
		 **/
		public static function onCustEvent2():void{
			createExtensionContext();
			try
			{
				extContext.call(functionName,TalkingDataAneFunction.AdTracking_onCustEvent2);
			} 
			catch(error:Error) 
			{
				
			}
		}
		/**
		 *自定义事件3 
		 **/
		public static function onCustEvent3():void{
			createExtensionContext();
			try
			{
				extContext.call(functionName,TalkingDataAneFunction.AdTracking_onCustEvent3);
			} 
			catch(error:Error) 
			{
				
			}
		}
		/**
		 *自定义事件4
		 **/
		public static function onCustEvent4():void{
			createExtensionContext();
			try
			{
				extContext.call(functionName,TalkingDataAneFunction.AdTracking_onCustEvent4);
			} 
			catch(error:Error) 
			{
				
			}
		}
		/**
		 *自定义事件5 
		 **/
		public static function onCustEvent5():void{
			createExtensionContext();
			try
			{
				extContext.call(functionName,TalkingDataAneFunction.AdTracking_onCustEvent5);
			} 
			catch(error:Error) 
			{
				
			}
		}
		/**
		 *自定义事件6 
		 **/
		public static function onCustEvent6():void{
			createExtensionContext();
			try
			{
				extContext.call(functionName,TalkingDataAneFunction.AdTracking_onCustEvent6);
			} 
			catch(error:Error) 
			{
				
			}
		}
		/**
		 *自定义事件7 
		 **/
		public static function onCustEvent7():void{
			createExtensionContext();
			try
			{
				extContext.call(functionName,TalkingDataAneFunction.AdTracking_onCustEvent7);
			} 
			catch(error:Error) 
			{
				
			}
		}
		/**
		 *自定义事件8 
		 **/
		public static function onCustEvent8():void{
			createExtensionContext();
			try
			{
				extContext.call(functionName,TalkingDataAneFunction.AdTracking_onCustEvent8);
			} 
			catch(error:Error) 
			{
				
			}
		}
		/**
		 *自定义事件9 
		 **/
		public static function onCustEvent9():void{
			createExtensionContext();
			try
			{
				extContext.call(functionName,TalkingDataAneFunction.AdTracking_onCustEvent9);
			} 
			catch(error:Error) 
			{
				
			}
		}
		
		/**
		 *自定义事件10 
		 **/
		public static function onCustEvent10():void{
			createExtensionContext();
			try
			{
				extContext.call(functionName,TalkingDataAneFunction.AdTracking_onCustEvent10);
			} 
			catch(error:Error) 
			{
				
			}
		}
		
		/**
		 * 通用创建ExtensionContext 实例的方法
		 * */
		private static function  createExtensionContext():void{
			try{
				if(extContext==null){
					//创建ExtensionContext实例
					extContext=ExtensionContext.createExtensionContext("com.talkingdata.sdk",null);
				}
			}catch(err:Error){
				
			}
		}
	}
}