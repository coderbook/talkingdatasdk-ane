package com.talkingdata.sdk.flashair;

import java.util.HashMap;
import java.util.Map;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;


public class TalkingDataSDKContext extends FREContext{
	@Override
	public Map<String, FREFunction> getFunctions() {
		Map<String, FREFunction> functionMap = new HashMap<String, FREFunction>();
		functionMap.put("TalkingDataFunctions",new TalkingDataFunctions(this));

		return functionMap;
	}

	@Override
	public void dispose() {
		
	}
}
