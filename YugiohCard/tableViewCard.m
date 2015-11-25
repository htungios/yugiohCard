//
//  tableViewCard.m
//  YugiohCard
//
//  Created by Hoang Ngoc Tung on 11/25/15.
//  Copyright © 2015 HoangNgocTung. All rights reserved.
//

#import "tableViewCard.h"
#import "Character.h"
#import "Datamanager.h"
#import "DetailCard.h"

@interface tableViewCard () <UITableViewDataSource, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation tableViewCard
{
    Datamanager* dataManager;
}
- (void)viewDidLoad{
    [super viewDidLoad];

    dataManager = [Datamanager getSingleton];
    
}

#pragma mark UITableVIewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataManager.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Character* charaterNew = dataManager.data[indexPath.row];
    cell.textLabel.text = charaterNew.name;
    NSString* csf = [NSString stringWithFormat:@"ATK - DEF : %@", charaterNew.cs];
    cell.detailTextLabel.text = csf;
    cell.imageView.image = charaterNew.icon;
    cell.backgroundColor = [UIColor lightGrayColor];
    return  cell;
    
}

#pragma mark Navigation

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailCard* detail = (DetailCard*)segue.destinationViewController;
    NSIndexPath* selectedIndexPath = [self.tableView indexPathForSelectedRow];
    detail.charaterNew =  dataManager.data[selectedIndexPath.row];
    
}
@end
