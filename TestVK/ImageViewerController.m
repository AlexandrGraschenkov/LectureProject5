//
//  ImageViewerController.m
//  TestVK
//
//  Created by Alexander on 20.03.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "ImageViewerController.h"

@interface ImageViewerController ()
{}
@property (nonatomic, weak) IBOutlet UIImageView *imgView;
@end

@implementation ImageViewerController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imgView.image = self.img;
}

@end
