//
//  MainCollectionViewController.h
//  SWL
//
//  Created by Liudq on 16/2/2.
//
//

#import <UIKit/UIKit.h>

@interface MainCollectionViewController : BaseViewController<UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
