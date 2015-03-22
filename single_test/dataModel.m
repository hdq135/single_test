//
//  dataModel.m
//  single_test
//
//  Created by hdq on 15-3-7.
//  Copyright (c) 2015年 hdq. All rights reserved.
//

#import "dataModel.h"

static dataModel *g_dataModel = nil;

@implementation dataModel

+(instancetype)getDataModel{
    if (g_dataModel == nil) {
        g_dataModel = [[dataModel alloc] init];
    }
    return g_dataModel;
}

-(instancetype)init{
    if (![self readDate]) {
        self.m_Dict = [NSMutableDictionary dictionary];
        self.m_Keys = [NSMutableArray array];
    }
    self.m_currKey = 0;
    return self;
}

-(void)dealloc {
    g_dataModel = nil;
}

-(void)addObject:(id)object{
    if (object ) {
        [self.m_Keys insertObject:[[NSDate date] description] atIndex:0];
        [self.m_Dict setObject:object forKey:[self.m_Keys firstObject]];
    }
}

-(void)updateObject:(id)object{
    if (object ) {
        [self.m_Dict setObject:object forKey:[self.m_Keys objectAtIndex:self.m_currKey]];
    }
}
-(NSUInteger)getCount{
    return [self.m_Dict count];
}

-(BOOL)setCurrentObj:(NSUInteger)index{
    self.m_currKey = index;
    return index < [self.m_Keys count];
}

-(id)getCurrentObj{
    return self.m_currKey>=[self.m_Keys count]?nil:[self.m_Dict objectForKey:[self.m_Keys objectAtIndex:self.m_currKey]];
}

-(id)getObjectAtIndex:(NSUInteger)index{
    if (index>=[self.m_Keys count]) {
        return nil;
    }
    return [self.m_Dict objectForKey:[self.m_Keys objectAtIndex:index]];
}

-(id)getKeyAtIndex:(NSUInteger)index{
    if (index>=[self.m_Keys count]) {
        return nil;
    }
    return [self.m_Keys objectAtIndex:index];
}

-(void)removeAtIndex:(NSUInteger)index{
    if (index < [self.m_Keys count]) {
        [self.m_Dict removeObjectForKey:[self.m_Keys objectAtIndex:index]];
        [self.m_Keys removeObjectAtIndex:index];
    }
     
}

-(void)saveDate{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentsDirectory = [paths objectAtIndex:0];
    NSString * path = [documentsDirectory stringByAppendingPathComponent:@"dict.dat"];
    BOOL ret =  [self.m_Dict writeToFile:path atomically:YES];
    path = [documentsDirectory stringByAppendingPathComponent:@"keys.dat"];
    ret =  [self.m_Keys writeToFile:path atomically:YES];
}
-(BOOL)readDate{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentsDirectory = [paths objectAtIndex:0];
    NSString * path = [documentsDirectory stringByAppendingPathComponent:@"dict.dat"];
    
    self.m_Dict = [[NSMutableDictionary dictionary] initWithContentsOfFile:path];;
    path = [documentsDirectory stringByAppendingPathComponent:@"keys.dat"];
    self.m_Keys = [[NSMutableArray array] initWithContentsOfFile:path];
    
    return self.m_Keys != nil && self.m_Dict != nil;
}
@end
