//
//  ViewController.m
//  SocialNetwrking
//
//  Created by RainCreatives on 21/09/12.
//  Copyright (c) 2012 RainCreatives. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)showAllClick:(id)sender {
    
    
    NSString *textToShare = @"Testing!";
    UIImage *imageToShare = [UIImage imageNamed:@"salmantiger.jpeg"];
    NSURL *url = [NSURL URLWithString:@"http://www.yashesh.in"];
    NSArray *activityItems = [[NSArray alloc]  initWithObjects:textToShare, imageToShare,url,nil];
    
    UIActivity *activity = [[UIActivity alloc] init];
    
    NSArray *applicationActivities = [[NSArray alloc] initWithObjects:activity, nil];
    UIActivityViewController *activityVC =
    [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                      applicationActivities:applicationActivities];
    [self presentViewController:activityVC animated:YES completion:nil];
}

- (IBAction)socialClick:(id)sender {
    
    
    NSString *serviceType;
    
    switch ([sender tag]) {
        case 0:
            //Facebook
            serviceType = SLServiceTypeFacebook;
            break;
            
        case 1:
            //Twitter
            serviceType = SLServiceTypeTwitter;
            break;
            
        case 2:
            //SinaWeibo
            serviceType = SLServiceTypeSinaWeibo;
            break;
            
        default:
            break;
    }
    
    if([SLComposeViewController isAvailableForServiceType:serviceType]) {
        
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:serviceType];
        
        SLComposeViewControllerCompletionHandler myBlock = ^(SLComposeViewControllerResult result){
            if (result == SLComposeViewControllerResultCancelled) {
                
                NSLog(@"ResultCancelled");
                
            } else
                
            {
                NSLog(@"Success");
            }
            
            [controller dismissViewControllerAnimated:YES completion:Nil];
        };
        controller.completionHandler =myBlock;
        
        [controller setInitialText:@"Learn iOS6 Social Framework integration"];
        [controller addURL:[NSURL URLWithString:@"http://www.yashesh.in"]];
        [controller addImage:[UIImage imageNamed:@"salmantiger.jpeg"]];
        
        [self presentViewController:controller animated:YES completion:Nil];
        
    }
    else{
        
        NSLog(@"UnAvailable");
    }

    
    
}
@end
