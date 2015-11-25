//
//  Character.m
//  YugiohCard
//
//  Created by Hoang Ngoc Tung on 11/23/15.
//  Copyright © 2015 HoangNgocTung. All rights reserved.
//

#import "Character.h"

@implementation Character
- (instancetype) init: (NSString *) name
               withCs: (NSString *) cs
             andPhoto: (NSString *) photo {
    if (self = [super init]) {
        self.name = name;
        self.cs = cs;
        NSString* photoFile = [NSString stringWithFormat:@"%@0.jpg",photo];
        self.photo = [UIImage imageNamed:photoFile];
        NSString* iconFile = [NSString stringWithFormat:@"%@.jpg",photo];
        self.icon = [UIImage imageNamed:iconFile];

    }
    return self;
}


@end
