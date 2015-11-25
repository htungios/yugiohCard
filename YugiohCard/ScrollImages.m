//
//  ScrollImages.m
//  YugiohCard
//
//  Created by Hoang Ngoc Tung on 11/24/15.
//  Copyright © 2015 HoangNgocTung. All rights reserved.
//

#import "ScrollImages.h"
#import "Character.h"
#import "Datamanager.h"


@interface ScrollImages () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UILabel *labelCard;

@end

@implementation ScrollImages
{
    Datamanager* datamanager;
    
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.scrollView.delegate  = self;
    datamanager = [Datamanager getSingleton];
    self.pageControl.numberOfPages = datamanager.data.count;
    CGSize scrollviewSize = self.scrollView.bounds.size;
    self.scrollView.contentSize = CGSizeMake(scrollviewSize.width * datamanager.data.count, scrollviewSize.height);
    self.scrollView.pagingEnabled = true; // default NO. if YES, stop on multiples of view bounds
    int i=0;
    for (Character* charaterNew in datamanager.data) {
        UIImageView* imageVIew = [[UIImageView alloc] initWithImage:charaterNew.photo];
        imageVIew.contentMode = UIViewContentModeScaleAspectFit;
        imageVIew.frame = CGRectMake(scrollviewSize.width * i , 0, scrollviewSize.width, scrollviewSize.height);
        
        [self.scrollView addSubview:imageVIew];
        i++;
    }
    [self updateLabelAt:0];
}

#pragma mark - UIScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.pageControl.currentPage = self.scrollView.contentOffset.x / self.scrollView.bounds.size.width;
    [self updateLabelAt:(int)self.pageControl.currentPage];
    
    
}


#pragma mark - Until Function

-(void)updateLabelAt:(int) index {
    Character* charaterNew = datamanager.data[index];
    NSString* csf = [NSString stringWithFormat:@"ATF - DEF : %@",charaterNew.cs];
    self.labelCard.text = [NSString stringWithFormat:@"%@\n%@", charaterNew.name, csf];
    CGSize labelSize = [self.labelCard.text sizeWithAttributes:@{NSFontAttributeName:self.labelCard.font}];
    self.labelCard.frame = CGRectMake(self.labelCard.frame.origin.x, self.labelCard.frame.origin.y, self.labelCard.frame.size.width, labelSize.height);
    
                                                                 
}
- (IBAction)onPagecontrolChangle:(UIPageControl *)sender {
    self.scrollView.contentOffset = CGPointMake(self.pageControl.currentPage * self.scrollView.bounds.size.width, 0);
}


@end
