//
//  CoreDataHelper.m
//  SouthMedia
//
//  Created by yufei on 14-5-13.
//  Copyright (c) 2014年 pandoranews. All rights reserved.
//

#import "CoreDataService.h"

@implementation CoreDataService
@synthesize cde = _cde;
@synthesize article;
@synthesize column;

+(CoreDataService*)getInstance{

    static CoreDataService* instance;
    @synchronized(self){
        if (!instance ) {
            instance = [[ CoreDataService alloc ] init];
        }
	}
	return instance;
}
-(CoreDataService*)init{
    
    self = [super init];
    if(self){
        coreDataOpQueue = dispatch_queue_create("com.pandoranews.SouthMedia.coreDataOperation", NULL);
    }
    
    return self;
}

- (CoreDataEnvir *)cde
{
    if (nil == _cde) {
        _cde = [CoreDataEnvir dataBase] ;
    }
    return _cde;
}
-(void)insertArticleArray:(NSArray *)array{
    
    
}
-(void)insertArticle:(ArticleModel*)arti{

    dispatch_async(coreDataOpQueue, ^{
        CoreDataEnvir *db = [CoreDataEnvir instance];
        [Article insertItemInContext:db fillData:^(Article *item) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
            [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            NSDate *date=[formatter dateFromString:arti.releasetime];
            item.releasetime = date;
            item.image = arti.image;
            item.columnid = arti.columnid;
            
            NSInteger m = [arti.modifytime intValue];

            item.modifytime = [NSNumber numberWithInteger:m];
            NSInteger c = [arti.createtime intValue];

            item.createtime = [NSNumber numberWithInteger:c];
            
            if ([arti respondsToSelector:@selector(content)]) {
                item.content = arti.content;

            }
            
            item.articleid = arti.articleId;
            
            item.author = arti.author;
            item.title = @"bb";//arti.title;
            item.ishead = [NSNumber  numberWithInt:arti.ishead];
            item.source = arti.source;
            item.introduction = arti.introduction;
            
//             [item setValue:date forKey:@"releasetime"];
//            [item setValue:arti.image forKey:@"image"];
//            [item setValue:arti.columnid forKey:@"columnid"];
//            [item setValue:[NSNumber numberWithInteger:m]  forKey:@"modifytime"];
//            [item setValue:[NSNumber numberWithInteger:c] forKey:@"createtime"];
//            [item setValue:arti.content forKey:@"content"];
//            [item setValue:arti.articleId forKey:@"articleid"];
//            [item setValue:arti.author forKey:@"author"];
//            [item setValue:arti.title forKey:@"title"];
//            [item setValue:[NSNumber  numberWithInt:arti.ishead] forKey:@"ishead"];
//            [item setValue:arti.source forKey:@"source"];
//            [item setValue:arti.introduction forKey:@"introduction"];
        }];
    
                   
            [db saveDataBase];
                   
        });

}
-(void)insertColumnArray:(NSArray*)array{

}
-(void)insertColumn:(ColumnModel*)colu{
    

    dispatch_async(coreDataOpQueue, ^{
        CoreDataEnvir *db = [CoreDataEnvir instance];
        [Column insertItemInContext:db fillData:^(Column *item) {
            item.image = colu.columnImage;
            item.name = colu.columnName;
            item.sort = [NSNumber numberWithInt:colu.columnSort];
            NSInteger c = [colu.columnCreatetime intValue];

            item.createtime =  [NSNumber numberWithInteger:c];
            item.columnid  = colu.columnId;
            
        }];
        
        
        [db saveDataBase];
        
    });

}
-(void)updateArticle:(ArticleModel*)arti{
    dispatch_async(coreDataOpQueue, ^{
        CoreDataEnvir *db = [CoreDataEnvir instance];

        NSString* predicate = [[NSString alloc]initWithFormat:@"articleid=='%@'",arti.articleId ];
        Article *item = (Article *)[Article lastItemInContext:db usingPredicate:[NSPredicate predicateWithFormat:predicate]];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *date=[formatter dateFromString:arti.releasetime];
        
        item.releasetime = date;
        item.image = arti.image;
        item.columnid = arti.columnid;
        
        NSInteger m = [arti.modifytime intValue];

        item.modifytime = [NSNumber numberWithInteger:m];
        
        NSInteger c = [arti.createtime intValue];

        item.createtime = [NSNumber numberWithInteger:c];
        if ([arti respondsToSelector:@selector(content)]) {
            item.content = arti.content;
            
        }
        item.articleid = arti.articleId;
        
        item.author = arti.author;
        item.title = arti.title;
        item.ishead = [NSNumber numberWithInt:arti.ishead];
        item.source = arti.source;
        item.introduction = arti.introduction;
        [db saveDataBase];
        
    });
}
-(void)updateColumn:(ColumnModel*)colu{
    dispatch_async(coreDataOpQueue, ^{
        CoreDataEnvir *db = [CoreDataEnvir instance];
        
        NSString* predicate = [[NSString alloc]initWithFormat:@"columnid=='%@'",colu.columnId ];
        Column *item = (Column *)[Column lastItemInContext:db usingPredicate:[NSPredicate predicateWithFormat:predicate]];
        //item = [colu copy];
        item.image = colu.columnImage;
        item.name = colu.columnName;
        item.sort = [NSNumber numberWithInteger:colu.columnSort];
        
        NSInteger c = [colu.columnCreatetime integerValue];
        item.createtime = [NSNumber numberWithInteger:c];
        item.columnid  = colu.columnId;

        [db saveDataBase];
        
    });
}

-(NSArray*)selectArticle{
    CoreDataEnvir *db = [CoreDataEnvir instance];
    //NSArray *items = [Article itemsInContext:db];
    NSSortDescriptor* sort = [NSSortDescriptor sortDescriptorWithKey:@"releasetime" ascending:NO];
    NSArray* sortArray = [NSArray arrayWithObject:sort];
    NSArray *items = [Article itemsInContext:db usingPredicate:nil usingSortDescriptions:sortArray];
    
    NSMutableArray *rlt = [NSMutableArray array];
    for (Article * item in items ) {
        ArticleModel* arti  = [ArticleModel new];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *date = [formatter stringFromDate:item.releasetime];
        arti.releasetime = date;
        arti.image = item.image;
        arti.columnid = item.columnid;
        
        
        arti.modifytime = [NSString stringWithFormat:@"%d",[item.modifytime intValue] ];
        
        
        arti.createtime = [NSString stringWithFormat:@"%d",[item.createtime intValue] ];
        arti.content = item.content;
        
        arti.articleId = item.articleid;
        
        arti.author = item.author;
        arti.title = item.title;
        arti.ishead =  [item.ishead intValue];
        arti.source = item.source;
        arti.introduction = item.introduction;
        
        [rlt addObject:arti];
    }
    
    return  rlt;
}
-(NSArray*)selectColumn{

    CoreDataEnvir *db = [CoreDataEnvir instance];
    //NSArray *items = [Column itemsInContext:db ];
    NSSortDescriptor* sort = [NSSortDescriptor sortDescriptorWithKey:@"sort" ascending:NO];
    NSArray* sortArray = [NSArray arrayWithObject:sort];
    NSArray *items = [Column itemsInContext:db usingPredicate:nil usingSortDescriptions:sortArray];

    
    NSMutableArray *rlt = [NSMutableArray array];
    for (Column * item in items ) {
        ColumnModel* col  = [ColumnModel new];
        col.columnImage = item.image;
        col.columnName = item.name;
        col.columnSort = [item.sort intValue];;
        
        col.columnCreatetime = [NSString stringWithFormat:@"%d", [item.createtime intValue] ];
        col.columnId  = item.columnid;
        
        [rlt addObject:col];
    }
    
    return  rlt;
}

-(NSArray*)selectColumn:(NSString*)predicate{
    CoreDataEnvir *db = [CoreDataEnvir instance];
    NSArray *items = [Column itemsInContext:db usingPredicate:[NSPredicate predicateWithFormat:predicate]];

    NSMutableArray *rlt = [NSMutableArray array];
    for (Column * item in items ) {
        ColumnModel* col  = [ColumnModel new];
        col.columnImage = item.image;
        col.columnName = item.name;
        col.columnSort = [item.sort intValue];;
        
        col.columnCreatetime = [NSString stringWithFormat:@"%d", [item.createtime intValue] ];
        col.columnId  = item.columnid;
        
        [rlt addObject:col];
    }
    
    return  rlt;
}
-(NSArray*)selectArticle:(NSString*)predicate{
    CoreDataEnvir *db = [CoreDataEnvir instance];
    NSArray *items = [Article itemsInContext:db usingPredicate:[NSPredicate predicateWithFormat:predicate]];
    NSMutableArray *rlt = [NSMutableArray array];
    for (Article * item in items ) {
        ArticleModel* arti  = [ArticleModel new];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *date = [formatter stringFromDate:item.releasetime];
        arti.releasetime = date;
        arti.image = item.image;
        arti.columnid = item.columnid;
        
        
        arti.modifytime = [NSString stringWithFormat:@"%d",[item.modifytime intValue] ];
        
        
        arti.createtime = [NSString stringWithFormat:@"%d",[item.createtime intValue] ];
        arti.content = item.content;
        
        arti.articleId = item.articleid;
        
        arti.author = item.author;
        arti.title = item.title;
        arti.ishead =  [item.ishead intValue];
        arti.source = item.source;
        arti.introduction = item.introduction;
        
        [rlt addObject:arti];
    }
    
    return  rlt;
}

-(NSArray*)selectColumn:(NSString*)predicate usingSortDescriptions:(NSArray *)sortDescriptions{
    CoreDataEnvir *db = [CoreDataEnvir instance];
    NSArray *items = [Column itemsInContext:db usingPredicate:[NSPredicate predicateWithFormat:predicate] usingSortDescriptions:sortDescriptions];
    NSMutableArray *rlt = [NSMutableArray array];
    for (Column * item in items ) {
        ColumnModel* col  = [ColumnModel new];
        col.columnImage = item.image;
        col.columnName = item.name;
        col.columnSort = [item.sort intValue];;
        
        col.columnCreatetime = [NSString stringWithFormat:@"%d", [item.createtime intValue] ];
        col.columnId  = item.columnid;
        
        [rlt addObject:col];
    }
    
    return  rlt;

}
-(NSArray*)selectArticle:(NSString*)predicate usingSortDescriptions:(NSArray *)sortDescriptions{
    CoreDataEnvir *db = [CoreDataEnvir instance];
    NSArray *items = [Article itemsInContext:db usingPredicate:[NSPredicate predicateWithFormat:predicate ] usingSortDescriptions:sortDescriptions];
    NSMutableArray *rlt = [NSMutableArray array];
    for (Article * item in items ) {
        ArticleModel* arti  = [ArticleModel new];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *date = [formatter stringFromDate:item.releasetime];
        arti.releasetime = date;
        arti.image = item.image;
        arti.columnid = item.columnid;
        
        
        arti.modifytime = [NSString stringWithFormat:@"%d",[item.modifytime intValue] ];
        
        
        arti.createtime = [NSString stringWithFormat:@"%d",[item.createtime intValue] ];
        arti.content = item.content;
        
        arti.articleId = item.articleid;
        
        arti.author = item.author;
        arti.title = item.title;
        arti.ishead =  [item.ishead intValue];
        arti.source = item.source;
        arti.introduction = item.introduction;
        
        [rlt addObject:arti];
    }
    
    return  rlt;
}
-(NSArray*)selectArticle:(NSString*)predicate usingSortDescriptions:(NSArray *)sortDescriptions fromOffset:(int)offset limit:(int)limit{

    CoreDataEnvir *db = [CoreDataEnvir instance];
    NSArray *items = [Article itemsInContext:db usingPredicate:[NSPredicate predicateWithFormat:predicate ] usingSortDescriptions:sortDescriptions fromOffset:offset LimitedBy:limit];
    NSMutableArray *rlt = [NSMutableArray array];
    for (Article * item in items ) {
        ArticleModel* arti  = [ArticleModel new];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *date = [formatter stringFromDate:item.releasetime];
        arti.releasetime = date;
        arti.image = item.image;
        arti.columnid = item.columnid;
        
        
        arti.modifytime = [NSString stringWithFormat:@"%d",[item.modifytime intValue] ];
        
        
        arti.createtime = [NSString stringWithFormat:@"%d",[item.createtime intValue] ];
        arti.content = item.content;
        
        arti.articleId = item.articleid;
        
        arti.author = item.author;
        arti.title = item.title;
        arti.ishead =  [item.ishead intValue];
        arti.source = item.source;
        arti.introduction = item.introduction;
        
        [rlt addObject:arti];
    }
    
    return  rlt;


}

-(BOOL)isArticleExists:(ArticleModel*)arti{
    BOOL rlt = NO;
    CoreDataEnvir *db = [CoreDataEnvir instance];
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"articleid=='%@'",arti.articleId ];
    NSArray *items = [Article itemsInContext:db usingPredicate:predicate];
    
    if ([items count] > 0) {
        rlt = YES;
    }
    return  rlt;


}
-(BOOL)isColumnExists:(ColumnModel*)colu{

    BOOL rlt = NO;
    CoreDataEnvir *db = [CoreDataEnvir instance];
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"columnid=='%@'",colu.columnId ];

    NSArray *items = [Column itemsInContext:db usingPredicate:predicate];
    
    if ([items count] > 0) {
        rlt = YES;
    }
    return  rlt;
}


-(void)clearDB{
    //self.itemmn = (itemmn *)[itemmn lastItemInContext:self.cde usingPredicate:[NSPredicate predicateWithFormat:@"name==9"]];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        CoreDataEnvir *db = [CoreDataEnvir instance];
        NSLog(@"delete %@", db.context);
        NSArray *items = [Column itemsInContext:db ];
        [db deleteDataItems:items];
        [db saveDataBase];
        //[db sendPendingChanges];
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        CoreDataEnvir *db = [CoreDataEnvir instance];
        NSLog(@"delete %@", db.context);
        NSArray *items = [Article itemsInContext:db ];
        [db deleteDataItems:items];
        [db saveDataBase];
        //[db sendPendingChanges];
    });

}


@end
