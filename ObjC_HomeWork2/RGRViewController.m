//
//  RGRViewController.m
//  ObjC_HomeWork2
//
//  Created by Ruben Robles (public) on 1/21/12.
//  ruben.go.robles@gmail.com
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RGRViewController.h"

@implementation RGRViewController
@synthesize myTweets, tweet, myText;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    myTweets = [[NSMutableArray alloc] init];
   // Merlyn's (Randal Schwartz' tweets)
    NSData *tweets = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.search.twitter.com/search.json?q=from:merlyn&rpp=10"]];
    NSInputStream *twitterStream = [[NSInputStream alloc] initWithData:tweets];
    [twitterStream open];
    
    if (twitterStream) {
        NSError *parseError = nil;
        id jsonObject = [NSJSONSerialization JSONObjectWithStream:twitterStream options:NSJSONReadingAllowFragments error:&parseError];        
        if ([jsonObject respondsToSelector:@selector(objectForKey:)]) {
            for (self.tweet in [jsonObject objectForKey:@"results"]) {
                NSLog(@"Tweet: %@", [tweet objectForKey:@"text"]);
               self.myText = [tweet objectForKey:@"text"];
                //[tweet setObject:self.myTweets forKey:text];
                NSLog(@"mytext = %@", myText);
                [myTweets addObject:myText];        
            }
        }
    } else {
        NSLog(@"Failed to open stream.");
    }
   
    NSLog(@"my tweets = %@", self.myTweets);

    
    
    

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



#pragma mark -
#pragma mark Table View Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    //return [self.jobData count];
    
    return [self.myTweets count];
    NSLog(@"count = %@", [self.myTweets count]);
    //return 5;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *RubenTableIdentifier = @"RubenTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             RubenTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleValue1 
                reuseIdentifier:RubenTableIdentifier];
    }
    NSUInteger row = [indexPath row];
    if (row % 2)
    {cell.textLabel.textColor = [UIColor blueColor];
    }
    cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
  // cell.textLabel.text = [jobData objectAtIndex:row];
    cell.textLabel.text = [myTweets objectAtIndex:row];
   // cell.textLabel.text = [myTweets objectAtIndex:row];
    return cell;
    
}


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
    NSString *rowValue = [myTweets objectAtIndex:row];
    NSString *message = [[NSString alloc] initWithFormat:
                         @"Full Tweet:  %@", rowValue];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Detailed Tweet view:"
                          message:message
                          delegate:nil
                          cancelButtonTitle:@"OK, finished reading tweet"
                          otherButtonTitles:nil];
    [alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
 
 

@end


