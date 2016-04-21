//
//  DetailViewController.m
//  RSSFeedReader
//
//  Created by Md Adit Hasan on 4/14/16.
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *storyTitle;
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item
 

- (void)configureView {
    // Update the user interface for the detail item.
    [self.storyTitle setText:self.newsManageObject.title];
    [self.photo setImage:[UIImage imageWithData:self.newsManageObject.imageData]];
    [self.webview loadHTMLString:self.newsManageObject.shortdescription baseURL:[NSURL URLWithString:self.newsManageObject.imageURL]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationController.navigationBar.translucent = NO;
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
