package com.talkingdata.sdk.flashair;

import org.json.JSONArray;
import org.json.JSONObject;

import android.app.Activity;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREInvalidObjectException;
import com.adobe.fre.FREObject;
import com.adobe.fre.FRETypeMismatchException;
import com.adobe.fre.FREWrongThreadException;
import com.tendcloud.appcpa.Order;
import com.tendcloud.appcpa.TalkingDataAppCpa;

public class TalkingDataFunctions implements FREFunction {

	TalkingDataSDKContext exContext=null;
	public TalkingDataFunctions(TalkingDataSDKContext exContext){
		this.exContext=exContext;
	}
	private String Tag="TalkingDataFunctions";
	@Override
	public FREObject call(FREContext arg0, FREObject[] arg1) {
		FREObject obj=null;
		try {
			Activity ctx=arg0.getActivity();
			if(ctx==null){
				return FREObject.newObject("Activity is null");
			}
			int Command=arg1[0].getAsInt();
			switch (Command) {
			case TalkingDataFunctionType.AdTracking_init:
				String appId=arg1[1].getAsString();
				String channel=arg1[2].getAsString();
				TalkingDataAppCpa.init(ctx, appId, channel);
				break;
			case TalkingDataFunctionType.AdTracking_onRegister:
				String account=arg1[1].getAsString();
				TalkingDataAppCpa.onRegister(account);
				break;
			case TalkingDataFunctionType.AdTracking_onLogin:
				account=arg1[1].getAsString();
				TalkingDataAppCpa.onLogin(account);
				break;
			case TalkingDataFunctionType.AdTracking_getDeviceId:
				String deviceID=TalkingDataAppCpa.getDeviceId(ctx);
				obj=FREObject.newObject(deviceID);
				break;
			case TalkingDataFunctionType.AdTracking_onCreateRole:
				String roleName=arg1[1].getAsString();
				TalkingDataAppCpa.onCreateRole(roleName);
				break;
			case TalkingDataFunctionType.AdTracking_onCustEvent1:
				TalkingDataAppCpa.onCustEvent1();
				break;
			case TalkingDataFunctionType.AdTracking_onCustEvent10:
				TalkingDataAppCpa.onCustEvent10();
				break;
			case TalkingDataFunctionType.AdTracking_onCustEvent2:
				TalkingDataAppCpa.onCustEvent2();
				break;
			case TalkingDataFunctionType.AdTracking_onCustEvent3:
				TalkingDataAppCpa.onCustEvent3();
				break;
			case TalkingDataFunctionType.AdTracking_onCustEvent4:
				TalkingDataAppCpa.onCustEvent4();
				break;
			case TalkingDataFunctionType.AdTracking_onCustEvent5:
				TalkingDataAppCpa.onCustEvent5();
				break;
			case TalkingDataFunctionType.AdTracking_onCustEvent6:
				TalkingDataAppCpa.onCustEvent6();
				break;
			case TalkingDataFunctionType.AdTracking_onCustEvent7:
				TalkingDataAppCpa.onCustEvent7();
				break;
			case TalkingDataFunctionType.AdTracking_onCustEvent8:
				TalkingDataAppCpa.onCustEvent8();
				break;
			case TalkingDataFunctionType.AdTracking_onCustEvent9:
				TalkingDataAppCpa.onCustEvent9();
				break;
			case TalkingDataFunctionType.AdTracking_onOrderPaySucc:
				account=arg1[1].getAsString();
				String orderId=arg1[2].getAsString();
				int amount=arg1[3].getAsInt();
				String currencyType=arg1[4].getAsString();
				String payType=arg1[5].getAsString();
				TalkingDataAppCpa.onOrderPaySucc(account, orderId, amount, currencyType, payType);
				break;
			case TalkingDataFunctionType.AdTracking_onPay:
				account=arg1[1].getAsString();
				orderId=arg1[2].getAsString();
				amount=arg1[3].getAsInt();
				currencyType=arg1[4].getAsString();
				payType=arg1[5].getAsString();
				TalkingDataAppCpa.onPay(account, orderId, amount, currencyType, payType);
				break;
			case TalkingDataFunctionType.AdTracking_onPlaceOrder:
				account=arg1[1].getAsString();
				String orderString=arg1[2].getAsString();
				try{
				JSONObject orderObj=new JSONObject(orderString);
				Order order=Order.createOrder(orderObj.getString("orderId"), orderObj.getInt("totalPrice"), orderObj.getString("currencyType"));
				JSONArray itemlist=orderObj.getJSONArray("items");
				for (int i = 0; i < itemlist.length(); i++) {
					JSONObject item=itemlist.getJSONObject(i);
					order.addItem(item.getString("name"), item.getString("category"), item.getInt("unitPrice"), item.getInt("count"));
				}
				TalkingDataAppCpa.onPlaceOrder(account, order);
				}catch (Throwable e) {
				}
				break;
			case TalkingDataFunctionType.AdTracking_setVerboseLogDisable:
				TalkingDataAppCpa.setVerboseLogDisable();
				break;
			default:
				break;
			}
		} catch (IllegalStateException e) {
			Log.e(Tag, e.getMessage());
		} catch (FRETypeMismatchException e) {
			Log.e(Tag, e.getMessage());
		} catch (FREInvalidObjectException e) {
			Log.e(Tag, e.getMessage());
		} catch (FREWrongThreadException e) {
			Log.e(Tag, e.getMessage());
		}catch(Exception e){
			Log.e(Tag, e.getMessage());
		}
		return obj;
	}
}
