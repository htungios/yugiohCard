//
//  Datamanager.h
//  YugiohCard
//
//  Created by Hoang Ngoc Tung on 11/24/15.
//  Copyright © 2015 HoangNgocTung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Datamanager : NSObject
@property (nonatomic, strong) NSArray *data;

+ (instancetype)getSingleton;
@end
