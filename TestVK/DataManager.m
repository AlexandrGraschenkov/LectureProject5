//
//  DataManager.m
//  TestViewController
//
//  Created by Alexander on 20.03.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "DataManager.h"

@interface DataManager()
{
    NSInteger stopOperationCount;
}
@end

@implementation DataManager

+ (instancetype)sharedInstance
{
    static id _singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [[self alloc] init];
    });
    return _singleton;
}

- (void)getAsyncAvatarWithSender:(id)sender selector:(SEL)selector
{
    int startStopCount = stopOperationCount;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if(startStopCount != stopOperationCount)
            return;
        
        [sender performSelector:selector withObject:[UIImage imageNamed:@"avatar"]];
    });
}

- (void)getAsyncInfoWithSender:(id)sender selector:(SEL)selector
{
    int startStopCount = stopOperationCount;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if(startStopCount != stopOperationCount)
            return;
        
        NSDictionary *responce = @{@"name" : @"Alexandr Sidorov", @"status" : @"offline", @"city" : @"Kazan"};
        [sender performSelector:selector withObject:responce];
    });
}

- (void)stopAsyncOperations
{
    stopOperationCount++;
}

@end
