//
//  Datamanager.m
//  YugiohCard
//
//  Created by Hoang Ngoc Tung on 11/24/15.
//  Copyright © 2015 HoangNgocTung. All rights reserved.
//

#import "Datamanager.h"
#import "Character.h"

@implementation Datamanager

+ (instancetype) getSingleton {
    
    static Datamanager* datamanager = nil;
    static dispatch_once_t dispatchOnce;
    
    dispatch_once(&dispatchOnce, ^{
        datamanager = [Datamanager new];
        NSString* filePath = [[NSBundle mainBundle] pathForResource:@"List" ofType:@"plist"];
        NSArray* raw = [NSArray arrayWithContentsOfFile:filePath];
        NSMutableArray* temp = [[NSMutableArray alloc] initWithCapacity:raw.count];
        for (NSDictionary* item in raw) {
            Character* charaterNew = [[Character alloc] init:[item valueForKey:@"name"]
                                                   withCs:[item valueForKey:@"cs"]
                                                 andPhoto:[item valueForKey:@"photo"]];
            [temp addObject:charaterNew];
        }
        datamanager.data = [NSArray arrayWithArray:temp];
        
    });
    return datamanager;
}
@end
