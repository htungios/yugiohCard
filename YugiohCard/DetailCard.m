//
//  DetailCard.m
//  YugiohCard
//
//  Created by Hoang Ngoc Tung on 11/25/15.
//  Copyright © 2015 HoangNgocTung. All rights reserved.
//

#import "DetailCard.h"

@interface DetailCard ()
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *information;

@end

@implementation DetailCard

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.photo.image = self.charaterNew.photo;
    self.photo.contentMode = UIViewContentModeScaleAspectFit;
    NSString* csf = [NSString stringWithFormat:@"ATK - DEF : %@",self.charaterNew.cs];
    self.information.text = csf;
    
    
}
- (IBAction)onTapPhoto:(UITapGestureRecognizer *)sender {
    [self dismissViewControllerAnimated:true
                             completion:nil];
    
}



@end
