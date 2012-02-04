//
//  RGRViewController.h
//  ObjC_HomeWork2
//
//  Created by Ruben Robles (public) on 1/21/12.
//  ruben.go.robles@gmail.com
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RGRViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>


@property (retain, nonatomic) NSMutableArray *myTweets;
@property (strong, nonatomic) NSDictionary *tweet;
@property (strong, nonatomic) NSString *myText;
@end

