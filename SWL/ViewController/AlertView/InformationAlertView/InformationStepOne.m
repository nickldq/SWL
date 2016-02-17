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

#define NickNameTag 100
#define CommentTag 200


@interface InformationStepOne()<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate, PECropViewControllerDelegate, UITextFieldDelegate, UITextViewDelegate>
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
 
    [self addTarget:self action:@selector(backgroundTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    _nickNameTextField.delegate = self;
    _evaluationTextView.delegate = self;
    _shareModel = [ShareUserUploadModel new];
}

-(void)backgroundTouchUpInside:(UIView *)view{
    [[self findFirstResponder] resignFirstResponder];
}

- (IBAction)headerImageAction:(id)sender {
    
    if (_headerButton.imageView.image) {
        
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"编辑", nil];
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            [actionSheet addButtonWithTitle:@"照相"];
        }
    //        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
    //            [actionSheet showFromBarButtonItem:self.cameraButton animated:YES];
    //        } else {
    [actionSheet showInView:self];
    //        }
    }else{
        [self showCamera];
    }
}

- (IBAction)submitAction:(UIButton *)sender {
    if ([self checkShareUserInfo]) {
        InformationStepTwo *step2View = (InformationStepTwo *)[[[NSBundle mainBundle]loadNibNamed:@"InformationStepTwo" owner:self options:nil]firstObject];
        step2View.flowVC = _flowVC;
        [self addSubview:step2View];
        step2View.alert = _alert;
        step2View.infoStepOne = self;
    }
}

-(BOOL)checkShareUserInfo{
    BOOL flag = YES;
    //检查昵称
    if ([[Common checkNSNull:_shareModel.nickname] isEqualToString:@""]) {
        [ProgressHUDUtils dismissProgressHUDErrorWithStatus:@"请填写昵称,10个字以内"];
        flag = NO;
    }else if ([[Common checkNSNull:_shareModel.comment] isEqualToString:@""]){
        [ProgressHUDUtils dismissProgressHUDErrorWithStatus:@"请填写评论,20个字以内"];
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
        if (textField.text.length>10) {
            return NO;
        }
        _shareModel.nickname = textField.text;
    }
    return YES;
}

#pragma mark--TextViewDelegate
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if(textView == _evaluationTextView){
        if (textView.text.length>20) {
            return NO;
        }
        _shareModel.comment = textView.text;
    }
    return YES;
}

#pragma mark - PECropViewControllerDelegate methods

- (void)cropViewController:(PECropViewController *)controller didFinishCroppingImage:(UIImage *)croppedImage transform:(CGAffineTransform)transform cropRect:(CGRect)cropRect
{
    [controller dismissViewControllerAnimated:YES completion:NULL];
    [self.headerButton setImage:croppedImage forState:UIControlStateNormal];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
    }
}

- (void)cropViewControllerDidCancel:(PECropViewController *)controller
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
    }
    
    [controller dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - Action methods

- (IBAction)openEditor:(id)sender
{
    PECropViewController *controller = [[PECropViewController alloc] init];
    controller.delegate = self;
    controller.image = self.headerButton.imageView.image;
    
    UIImage *image = self.headerButton.imageView.image;
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
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    controller.delegate = self;
    controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
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
    
    [_flowVC presentViewController:controller animated:YES completion:NULL];
    //    }
}

#pragma mark - UIActionSheetDelegate methods

/*
 Open camera or photo album.
 */
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"编辑"]) {
        [self openEditor:nil];
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
    [self.headerButton setImage:image forState:UIControlStateNormal];
    
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
@end
