//
//  DataManager.h
//  TestViewController
//
//  Created by Alexander on 20.03.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

+ (instancetype)sharedInstance;

/**
 Call selector with UIImage
 */
- (void)getAsyncAvatarWithSender:(id)sender selector:(SEL)selector;


/**
 Call selector with dictionary:
 @{@"name" : @"Alexandr Sidorov", @"status" : @"offline", @"city" : @"Kazan"}
 */
- (void)getAsyncInfoWithSender:(id)sender selector:(SEL)selector;

- (void)stopAsyncOperations;

@end
