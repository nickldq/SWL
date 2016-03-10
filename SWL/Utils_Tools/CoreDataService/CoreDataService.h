//
//  CoreDataHelper.h
//  SouthMedia
//
//  Created by yufei on 14-5-13.
//  Copyright (c) 2014年 pandoranews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataEnvir.h" 

@interface CoreDataService : NSObject{

    dispatch_queue_t coreDataOpQueue;

}

@property(nonatomic,strong) CoreDataEnvir* cde;
@property(nonatomic,strong) Article* article;
@property(nonatomic,strong) Column* column;


+(CoreDataService*)getInstance;
-(void)clearDB;
-(void)insertArticleArray:(NSArray *)array;
-(void)insertArticle:(ArticleModel*)arti;
-(void)insertColumnArray:(NSArray*)array;
-(void)insertColumn:(ColumnModel*)colu;
-(void)updateArticle:(ArticleModel*)arti;
-(void)updateColumn:(ColumnModel*)colu;


//返回的数组成员为model
-(NSArray*)selectColumn:(NSString*)predicate;
-(NSArray*)selectArticle:(NSString*)predicate;
-(NSArray*)selectColumn:(NSString*)predicate usingSortDescriptions:(NSArray *)sortDescriptions;//NSSortDescriptor
-(NSArray*)selectArticle:(NSString*)predicate usingSortDescriptions:(NSArray *)sortDescriptions;
-(NSArray*)selectArticle:(NSString*)predicate usingSortDescriptions:(NSArray *)sortDescriptions fromOffset:(int)offset limit:(int)limit;
-(NSArray*)selectArticle;
-(NSArray*)selectColumn;

//根据ID判断
-(BOOL)isArticleExists:(ArticleModel*)arti;
-(BOOL)isColumnExists:(ColumnModel*)colu;
@end
