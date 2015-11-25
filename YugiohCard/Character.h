//
//  Character.h
//  YugiohCard
//
//  Created by Hoang Ngoc Tung on 11/23/15.
//  Copyright © 2015 HoangNgocTung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Character : NSObject
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* cs;
@property (nonatomic, strong) UIImage* photo;
@property (nonatomic, strong) UIImage* icon;

- (instancetype) init: (NSString *) name
               withCs: (NSString *) cs
             andPhoto: (NSString *) photo;
@end
