//
//  InformationStepOne.m
//  SWL
//
//  Created by Liudq on 16/2/5.
//
//

#import "InformationStepOne.h"
#import "InformationStepTwo.h"
#import "DaiDodgeKeyboard.h"
#import "PECropViewController.h"
#import "ShareUserUploadModel.h"
#import "ImageUtil.h"
#import "ColorMatrix.h"
#import "ZYQAssetPickerController.h"

#define NickNameTag 100
#define CommentTag 200


@interface InformationStepOne()<UIImagePickerControllerDelegate, ZYQAssetPickerControllerDelegate,UINavigationControllerDelegate,UIScrollViewDelegate, UIActionSheetDelegate, PECropViewControllerDelegate, UITextFieldDelegate, UITextViewDelegate,  HPGrowingTextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nickNameTextField;
@property (weak, nonatomic) IBOutlet UIButton *headerButton;
@property (weak, nonatomic) IBOutlet UITextView *evaluationTextView;

@property (strong, nonatomic) ShareUserUploadModel *shareModel;
@end

@implementation InformationStepOne

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [DaiDodgeKeyboard removeRegisterTheViewNeedDodgeKeyboard];
    [DaiDodgeKeyboard addRegisterTheViewNeedDodgeKeyboard:self];
 
    if (!_shareModel) {
        [self addTarget:self action:@selector(backgroundTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        _nickNameTextField.delegate = self;
        _evaluationTextView.delegate = self;
        _shareModel = [ShareUserUploadModel new];
        
        _m_textView.autoresizingMask = UIViewAutoresizingNone;
//        _m_textView.contentInset = UIEdgeInsetsMake(0, 5, 0, 5);
        _m_textView.minNumberOfLines = 2;
//        _m_textView.maxNumberOfLines = 6;
        _m_textView.font = [BMFontLibrary defaultFont:14.0];
        _m_textView.delegate=self;
//        _m_textView.internalTextView.scrollIndicatorInsets = UIEdgeInsetsMake(5, 0, 5, 0);
        
        [_m_textView settingPlaceholder:@"5-20字以内"];
    }
}

-(void)backgroundTouchUpInside:(UIView *)view{
    [[self findFirstResponder] resignFirstResponder];
}

- (IBAction)headerImageAction:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"相册", nil];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [actionSheet addButtonWithTitle:@"照相"];
    } 
    [actionSheet showInView:self];
}

- (IBAction)submitAction:(UIButton *)sender {
    [self createHeaderImage];
    if ([self checkShareUserInfo]) {
        InformationStepTwo *step2View = (InformationStepTwo *)[[[NSBundle mainBundle]loadNibNamed:@"InformationStepTwo" owner:self options:nil]firstObject];
        step2View.flowVC = _flowVC;
        [self addSubview:step2View];
        step2View.alert = _alert;
        step2View.infoStepOne = self;
        step2View.shareModel = _shareModel;
    }
}

#pragma mark 检查填写信息
-(BOOL)checkShareUserInfo{
    BOOL flag = YES;
    //检查昵称
     if ([[Common checkNSNull:_shareModel.nickname] isEqualToString:@""] || [Common convertToInt:_shareModel.nickname]>10) {
        [ProgressHUDUtils dismissProgressHUDErrorWithStatus:@"请填写昵称,10个字以内"];
        flag = NO;
    }else if ([[Common checkNSNull:_shareModel.comment] isEqualToString:@""]||(5>[Common convertToInt:_shareModel.comment]||[Common convertToInt:_shareModel.comment]>20)){
        [ProgressHUDUtils dismissProgressHUDErrorWithStatus:@"请填写评论,5-20个字!"];
        flag = NO;
    }\
    else if ([[Common checkNSNull:_headerImage] isEqualToString:@""] && [[Common checkNSNull:_shareModel.photo_data] isEqualToString:@""]) {
        [ProgressHUDUtils dismissProgressHUDErrorWithStatus:@"请拍照!"];
        flag = NO;
    }
    return flag;
}

- (IBAction)clearAction:(UIButton *)sender {
//    [_alert dismissWithCompletion:^{
//        
    //    }];
    [self removeFromSuperview];
    _flowVC.maskingView.hidden = YES;
}
- (IBAction)closeAction:(id)sender {
//    [_alert dismissWithCompletion:^{
//        
//    }];
    [self removeFromSuperview];
    _flowVC.maskingView.hidden = YES;
}

#pragma mark--TextFieldDelegate
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(textField == _nickNameTextField){
        if ([Common convertToInt:textField.text]>=10&&![string isEqualToString:@""]) {
            return NO;
        }
    }
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    if(textField == _nickNameTextField){
        _shareModel.nickname = textField.text;
    }
}


#pragma mark--HPGrowingTextViewDelegate
-(BOOL)growingTextView:(HPGrowingTextView *)growingTextView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if(growingTextView == _m_textView){
        if (growingTextView.text.length>20&&![text isEqualToString:@""]) {
            return NO;
        }
    }
    return YES;
}

-(void)growingTextViewDidChange:(HPGrowingTextView *)growingTextView{
    if(growingTextView == _m_textView){
        _shareModel.comment = growingTextView.text;
    }
}

#pragma mark--TextViewDelegate
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if(textView == _evaluationTextView){
        if (textView.text.length>20&&![text isEqualToString:@""]) {
            return NO;
        }
    }
    return YES;
}

-(void)textViewDidChange:(UITextView *)textView{
//    if(textView == _evaluationTextView){
//        _shareModel.comment = textView.text;
//    }
}

#pragma mark - PECropViewControllerDelegate methods

- (void)cropViewController:(PECropViewController *)controller didFinishCroppingImage:(UIImage *)croppedImage transform:(CGAffineTransform)transform cropRect:(CGRect)cropRect
{
    [controller dismissViewControllerAnimated:YES completion:NULL];
    
    UIImage *scaledImage = [ImageUtils scaleToSize:CGSizeMake(506.52073732719015, 445.0f) andImage:croppedImage];
    
    _headerImage = scaledImage;
    
    [self.headerButton setImage:_headerImage forState:UIControlStateNormal];
}

- (void)cropViewControllerDidCancel:(PECropViewController *)controller
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
    }
    
    [controller dismissViewControllerAnimated:YES completion:NULL];
    _tempImage = nil;
}

#pragma mark - Action methods

- (IBAction)openEditor:(id)sender
{
    PECropViewController *controller = [[PECropViewController alloc] init];
    controller.delegate = self;
    controller.image = _tempImage;
    
    UIImage *image = _tempImage;
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    CGFloat length = MIN(width, height);
    controller.imageCropRect = CGRectMake((width - length) / 2,
                                          (height - length) / 2,
                                          length,
                                          length);
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
    }
    
    [_flowVC presentViewController:navigationController animated:YES completion:NULL];
}



#pragma mark - ZYQAssetPickerController Delegate
-(void)assetPickerController:(ZYQAssetPickerController *)picker didFinishPickingAssets:(NSArray *)assets{
    
        ALAsset *asset=[assets firstObject];
        UIImage *tempImg=[UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage];
        UIImage *matrixImage = [ImageUtil imageWithImage:tempImg withColorMatrix:colormatrix_danya];//colormatrix_langman
        
    _tempImage = matrixImage;
    
        //    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        //        if (self.popover.isPopoverVisible) {
        //            [self.popover dismissPopoverAnimated:NO];
        //        }
        //
        //        [self openEditor:nil];
        //    } else {
        [picker dismissViewControllerAnimated:YES completion:^{
            [self openEditor:nil];
        }];
}


#pragma mark - Private methods

- (void)showCamera
{
    
#if TARGET_OS_SIMULATOR//模拟器
    [ProgressHUDUtils dismissProgressHUDErrorWithStatus:@"请在真机上使用拍照功能!"];
#elif TARGET_OS_IPHONE//真机
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    controller.delegate = self;
    controller.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    //    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
    //        if (self.popover.isPopoverVisible) {
    //            [self.popover dismissPopoverAnimated:NO];
    //        }
    //
    //        self.popover = [[UIPopoverController alloc] initWithContentViewController:controller];
    //        [self.popover presentPopoverFromBarButtonItem:self.cameraButton
    //                             permittedArrowDirections:UIPopoverArrowDirectionAny
    //                                             animated:YES];
    //    } else {
    
    [_flowVC presentViewController:controller animated:NO completion:nil];
    //    [self presentViewController:controller animated:YES completion:NULL];
    //    }

#endif
    
}

- (void)openPhotoAlbum
{
    
    
    ZYQAssetPickerController *picker = [[ZYQAssetPickerController alloc] init];
    picker.maximumNumberOfSelection = 1;
    picker.assetsFilter = [ALAssetsFilter allPhotos];
    picker.showEmptyGroups=YES;
    picker.delegate=self;
    picker.selectionFilter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        if ([[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyType] isEqual:ALAssetTypeVideo]) {
            NSTimeInterval duration = [[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyDuration] doubleValue];
            return duration >= 5;
        } else {
            return YES;
        }
    }];
    
    [_flowVC presentViewController:picker animated:YES completion:NULL];

}

#pragma mark - UIActionSheetDelegate methods

/*
 Open camera or photo album.
 */
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"相册"]) {
//        [self openEditor:nil];
         [self openPhotoAlbum];
    } else if ([buttonTitle isEqualToString:@"照相"]) {
        [self showCamera];
    }
    _flowVC.maskingView.hidden = NO;
}

#pragma mark - UIImagePickerControllerDelegate methods

/*
 Open PECropViewController automattically when image selected.
 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    UIImage *matrixImage = [ImageUtil imageWithImage:image withColorMatrix:colormatrix_danya];//colormatrix_langman
     
    [self.headerButton setImage:matrixImage forState:UIControlStateNormal];
    _tempImage = matrixImage;
    
    //    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
    //        if (self.popover.isPopoverVisible) {
    //            [self.popover dismissPopoverAnimated:NO];
    //        }
    //
    //        [self openEditor:nil];
    //    } else {
    [picker dismissViewControllerAnimated:YES completion:^{
        [self openEditor:nil];
    }];
    //    }
}

#pragma  mark 创建上传图片(没有拍照仅创建背景图)
-(void)createHeaderImage{
    UIImage *bgImage = [UIImage imageNamed:@"share-bg"];
    if (_headerImage) {
        UIImage *scaledImage = _headerImage;
        
        //    UIImage *cover_letter = [UIImage imageNamed:@"cover_letter"];
        UIImage *scaledbgImage = [ImageUtils scaleToSize:CGSizeMake(850.0f, 445.0f) andImage:bgImage];
        //    _showImage.image = [ImageUtils addImage:scaledImage addRect:CGRectMake(171.0f, 0, 247.0f, 217.0f) toImage:scaledbgImage toRect:CGRectMake(0, 0, scaledbgImage.size.width, scaledbgImage.size.height)];
        _showImage.image = [ImageUtils addImage:scaledbgImage addRect:CGRectMake(0, 0, scaledbgImage.size.width, scaledbgImage.size.height) toImage:scaledImage toRect:CGRectMake(344.47926267280985, 0, 506.52073732719015, 445.0f)];
        //    _showImage.image = [ImageUtils addImage:_showImage.image addRect:CGRectMake(0, 0, scaledbgImage.size.width, scaledbgImage.size.height) toImage:cover_letter toRect:CGRectMake(-2.5, 0, 840, 148)];
        _shareModel.imageFormKey = UIImageJPEGRepresentation(_showImage.image, 1.0);
        _shareModel.photo_data = UIImageJPEGRepresentation(_headerImage, 1.0);
    }else{
        _shareModel.imageFormKey = UIImageJPEGRepresentation(bgImage, 1.0);
    }
}
@end
