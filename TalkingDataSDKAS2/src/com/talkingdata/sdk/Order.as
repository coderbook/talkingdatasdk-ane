package com.talkingdata.sdk
{
	import flash.utils.Dictionary;

	public class Order
	{
		private var _orderId:String=null;
		private var _currencyType:String=null;
		private var _totalPrice:int=0;
		
		private var itemList:Array=null;
		
		public function Order(orderId:String ,totalPrice:int ,currencyType:String)
		{
			this._currencyType=currencyType;
			this._totalPrice=totalPrice;
			this._orderId=orderId;
		}
		
		public function addItem(category:String,name:String,unitPrice:int,amount:int):Order
		{
			if(itemList==null){
				itemList=new Array();
			}
			var itemDic={};
			itemDic["name"]=name;
			itemDic["category"]=category;
			itemDic["unitPrice"]=unitPrice;
			itemDic["count"]=amount;
			itemList.push(itemDic);
			return this;
		}
		
		public function toJsonString():String
		{
			var jsonResult={};
			jsonResult["orderId"]=this._orderId;
			jsonResult["currencyType"]=this._currencyType;
			jsonResult["totalPrice"]=this._totalPrice;
			jsonResult["items"]=this.itemList;
			return JSON.stringify(jsonResult);
		}
	}
}