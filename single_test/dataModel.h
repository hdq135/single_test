//
//  dataModel.h
//  single_test
//
//  Created by hdq on 15-3-7.
//  Copyright (c) 2015年 hdq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dataModel : NSObject
+ (instancetype)getDataModel;

@property (strong, nonatomic) NSMutableDictionary *m_Dict;
@property (strong, nonatomic) NSMutableArray *m_Keys;
@property (nonatomic) NSUInteger m_currKey; 

-(id)getObjectAtIndex:(NSUInteger)index;
-(id)getKeyAtIndex:(NSUInteger)index;
-(NSUInteger)getCount;
-(BOOL)setCurrentObj:(NSUInteger)index;
-(id)getCurrentObj;

-(void)addObject:(id)object;
-(void)updateObject:(id)object;

-(void)removeAtIndex:(NSUInteger)index;

-(void)saveDate;
-(BOOL)readDate;

@end
