package com.talkingdata.sdk.flashair;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class TalkingDataSDKExtension implements FREExtension{

	@Override
	public FREContext createContext(String arg0) {
		TalkingDataSDKContext talkingDataContext = new TalkingDataSDKContext();
		return talkingDataContext;
	}

	@Override
	public void dispose() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void initialize() {
		
	}

}
