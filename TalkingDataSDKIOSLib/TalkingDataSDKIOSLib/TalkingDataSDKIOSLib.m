//
//  TalkingDataSDKIOSLib.m
//  TalkingDataSDKIOSLib
//
//  Created by vernon^3^ on 15-4-7.
//  Copyright (c) 2015年 TalkingData. All rights reserved.
//

#import "TalkingDataSDKIOSLib.h"
#import "FlashRuntimeExtensions.h"
#import "TalkingDataAppCpa.h"

const int  AdTracking_init=100;
const int  AdTracking_onRegister=101;
const int  AdTracking_onLogin=102;
const int  AdTracking_onPay=103;
const int  AdTracking_onPlaceOrder=104;
const int  AdTracking_onCreateRole=105;
const int  AdTracking_onOrderPaySucc=106;
const int  AdTracking_getDeviceId=107;

const int  AdTracking_setVerboseLogDisable=108;
const int  AdTracking_onCustEvent1=109;
const int  AdTracking_onCustEvent2=110;
const int  AdTracking_onCustEvent3=111;
const int  AdTracking_onCustEvent4=112;
const int  AdTracking_onCustEvent5=113;
const int  AdTracking_onCustEvent6=114;
const int  AdTracking_onCustEvent7=115;
const int  AdTracking_onCustEvent8=116;
const int  AdTracking_onCustEvent9=117;
const int  AdTracking_onCustEvent10=118;



@implementation TalkingDataSDKIOSLib

FREObject TalkingDataSDKFunctions(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]){
    FREObject freObject=NULL;
    int command;
    FREGetObjectAsInt32(argv[0], &command);
    uint32_t appIdLength;
    uint32_t channelIdLength;
    const uint8_t * appId;
    const uint8_t * channelId;
    
    uint32_t accountLen;
    const uint8_t * account;
    
    uint32_t roleNameLen;
    const uint8_t *roleName;
    
    uint32_t orderIdLen;
    const uint8_t *orderId;
    
    int32_t amount;
    
    uint32_t currencyTypeLen;
    const uint8_t *currencyType;
    
    uint32_t payTypeLen;
    const uint8_t *payType;
    
    uint32_t orderLen;
    const uint8_t *order;
    
    
    NSString *orderJsonString=nil;
    id orderObj=nil;

    
    switch (command) {
        case AdTracking_init:
            FREGetObjectAsUTF8(argv[1], &appIdLength, &appId);
            FREGetObjectAsUTF8(argv[2], &channelIdLength, &channelId);
            [TalkingDataAppCpa init:[NSString stringWithUTF8String:(char*)appId] withChannelId:[NSString stringWithUTF8String:(char*)channelId]];
            break;
        case AdTracking_getDeviceId:
            
            break;
        case AdTracking_onRegister:
            FREGetObjectAsUTF8(argv[1], &accountLen, &account);
            [TalkingDataAppCpa onRegister:[NSString stringWithUTF8String:(char*)account]];
            break;
        case AdTracking_onCreateRole:
            FREGetObjectAsUTF8(argv[1], &roleNameLen, &roleName);
            [TalkingDataAppCpa onCreateRole:[NSString stringWithUTF8String:(char*)roleName]];
            break;
        case AdTracking_onCustEvent1:
            [TalkingDataAppCpa onCustEvent1];
            break;
        case AdTracking_onCustEvent10:
            [TalkingDataAppCpa onCustEvent10];
            break;
        case AdTracking_onCustEvent2:
            [TalkingDataAppCpa onCustEvent2];
            break;
        case AdTracking_onCustEvent3:
            [TalkingDataAppCpa onCustEvent3];
            break;
        case AdTracking_onCustEvent4:
            [TalkingDataAppCpa onCustEvent4];
            break;
        case AdTracking_onCustEvent5:
            [TalkingDataAppCpa onCustEvent5];
            break;
        case AdTracking_onCustEvent6:
            [TalkingDataAppCpa onCustEvent6];
            break;
        case AdTracking_onCustEvent7:
            [TalkingDataAppCpa onCustEvent7];
            break;
        case AdTracking_onCustEvent8:
            [TalkingDataAppCpa onCustEvent8];
            break;
        case AdTracking_onCustEvent9:
            [TalkingDataAppCpa onCustEvent9];
            break;
        case AdTracking_onLogin:
            FREGetObjectAsUTF8(argv[1], &accountLen, &account);
            [TalkingDataAppCpa onLogin:[NSString stringWithUTF8String:(char*)account]];
            break;
        case AdTracking_onOrderPaySucc:{
            FREGetObjectAsUTF8(argv[1], &accountLen, &account);
            FREGetObjectAsUTF8(argv[2], &orderIdLen, &orderId);
            FREGetObjectAsInt32(argv[3], &amount);
            FREGetObjectAsUTF8(argv[4], &currencyTypeLen, &currencyType);
            FREGetObjectAsUTF8(argv[5], &payTypeLen, &payType);
            [TalkingDataAppCpa onOrderPaySucc:[NSString stringWithUTF8String:(char*)account] withOrderId:[NSString stringWithUTF8String:(char*)orderId] withAmount:amount withCurrencyType:[NSString stringWithUTF8String:(char*)currencyType] withPayType:[NSString stringWithUTF8String:(char*)payType]];
        }
            break;
        case AdTracking_onPay:{
            FREGetObjectAsUTF8(argv[1], &accountLen, &account);
            FREGetObjectAsUTF8(argv[2], &orderIdLen, &orderId);
            FREGetObjectAsInt32(argv[3], &amount);
            FREGetObjectAsUTF8(argv[4], &currencyTypeLen, &currencyType);
            FREGetObjectAsUTF8(argv[5], &payTypeLen, &payType);
            [TalkingDataAppCpa onPay:[NSString stringWithUTF8String:(char*)account] withOrderId:[NSString stringWithUTF8String:(char*)orderId] withAmount:amount withCurrencyType:[NSString stringWithUTF8String:(char*)currencyType] withPayType:[NSString stringWithUTF8String:(char*)payType]];}
            break;
        case AdTracking_onPlaceOrder:{
            FREGetObjectAsUTF8(argv[1], &accountLen, &account);
            FREGetObjectAsUTF8(argv[2], &orderLen, &order);
            orderJsonString=[NSString stringWithUTF8String:(char*)order];
            if (orderJsonString) {
                NSError* error = nil;
                orderObj = [NSJSONSerialization JSONObjectWithData:[orderJsonString dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
            }
            if ([orderObj isKindOfClass:[NSDictionary class]]) {
                NSString *orderId=[orderObj objectForKey:@"orderId"];
                int orderPrice=[[orderObj objectForKey:@"totalPrice"] intValue];
                NSString *orderCurrencyType=[orderObj objectForKey:@"currencyType"];
                TDOrder *tdOrder=[TDOrder orderWithOrderId:orderId total:orderPrice currencyType:orderCurrencyType];
                NSArray *itemArray=[orderObj objectForKey:@"items"];
                if (itemArray && itemArray.count>0) {
                    for (NSDictionary *item in itemArray) {
                        [tdOrder addItemWithCategory:[item objectForKey:@"category"] name:[item objectForKey:@"name"] unitPrice:[[item objectForKey:@"unitPrice"]intValue] amount:[[item objectForKey:@"count"]intValue]];
                    }
                }
                [TalkingDataAppCpa onPlaceOrder:[NSString stringWithUTF8String:(char*)account] withOrder:tdOrder];
            }}
            break;
        case AdTracking_setVerboseLogDisable:
            [TalkingDataAppCpa setVerboseLogDisabled];
            break;
        default:
            break;
    }
    
    return freObject;
}






void TalkingDataSDKContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet){
    *numFunctionsToTest=1;
    FRENamedFunction *func=(FRENamedFunction*)malloc(sizeof(FRENamedFunction) * 1);
    func[0].name=(const uint8_t*)"TalkingDataFunctions";
    func[0].functionData=NULL;
    func[0].function=&TalkingDataSDKFunctions;
    *functionsToSet=func;
    
}

void TalkingDataSDKContextFinalizer(FREContext ctx){
    
}

void TalkingDataSDKExtensionInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet){
    extDataToSet=NULL;
    *ctxInitializerToSet=&TalkingDataSDKContextInitializer;
    *ctxFinalizerToSet=&TalkingDataSDKContextFinalizer;
}
@end
