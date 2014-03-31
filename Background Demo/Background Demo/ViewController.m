//
//  ViewController.m
//  Geo
//
//  Created by Canopus 10 on 4/23/13.
//
//
#define CURRENT_DATE_TIME_STRING [NSDateFormatter localizedStringFromDate:[NSDate date] dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle]

#import "ViewController.h"

#import "ESTBeaconManager.h"

//@interface ViewController ()
//
//@end

@interface ViewController ()<ESTBeaconManagerDelegate>
@property (nonatomic, strong) ESTBeaconManager *beaconManager;
@property (nonatomic, strong) ESTBeacon *selectedBeacon;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // setup Estimote beacon manager
    self.beaconManager = [[ESTBeaconManager alloc] init];
    self.beaconManager.delegate = self;
    ESTBeaconRegion* region = [[ESTBeaconRegion alloc] initRegionWithIdentifier:@"EstimoteSampleRegion"];
    
    // start looking for estimote beacons in region
    [self.beaconManager startRangingBeaconsInRegion:region];

    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(consoleNotification:) name:CONSOLE_NOTIFICATION object:nil];

//    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(backgroundCall) userInfo:nil repeats:YES];
    
    [console setText:@"Log screen ...\n"];
}

-(void)consoleNotification:(NSNotification *)notification//(NSDictionary*)configDict
{
    [self updateConsoleWithMessage:notification.object];
}


//-(void)backgroundCall
//{
//    [self updateConsoleWithMessage:@"Sample Console Message"];
//}

- (void)viewDidUnload
{
    console = nil;
    
    [super viewDidUnload];
}

-(void)updateConsoleWithMessage:(NSString*)message
{
    BOOL check = (console.contentOffset.y >= (console.contentSize.height - console.frame.size.height-20));
    
    [console setText:[console.text stringByAppendingFormat:@"%@:%@\n",CURRENT_DATE_TIME_STRING,message]];
    CGFloat height = console.contentSize.height-console.frame.size.height;
    
    if (check && height>0)
    {
        [console setContentOffset:CGPointMake(0, height)];
    }
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}


#pragma ESTBeaconManagerDelegate the delegate methods

- (void)beaconManager:(ESTBeaconManager *)manager
      didRangeBeacons:(NSArray *)beacons
             inRegion:(ESTBeaconRegion *)region
{
    [self updateConsoleWithMessage:NSStringFromSelector(_cmd)];
}

-(void)beaconManager:(ESTBeaconManager *)manager
rangingBeaconsDidFailForRegion:(ESTBeaconRegion *)region
           withError:(NSError *)error
{
    [self updateConsoleWithMessage:NSStringFromSelector(_cmd)];
}

-(void)beaconManager:(ESTBeaconManager *)manager
monitoringDidFailForRegion:(ESTBeaconRegion *)region
           withError:(NSError *)error
{
    [self updateConsoleWithMessage:NSStringFromSelector(_cmd)];
}

-(void)beaconManager:(ESTBeaconManager *)manager
      didEnterRegion:(ESTBeaconRegion *)region
{
    [self updateConsoleWithMessage:NSStringFromSelector(_cmd)];
}

-(void)beaconManager:(ESTBeaconManager *)manager
       didExitRegion:(ESTBeaconRegion *)region
{
    [self updateConsoleWithMessage:NSStringFromSelector(_cmd)];
}

-(void)beaconManager:(ESTBeaconManager *)manager
   didDetermineState:(CLRegionState)state
           forRegion:(ESTBeaconRegion *)region
{
    [self updateConsoleWithMessage:NSStringFromSelector(_cmd)];
}

-(void)beaconManagerDidStartAdvertising:(ESTBeaconManager *)manager
                                  error:(NSError *)error
{
    [self updateConsoleWithMessage:NSStringFromSelector(_cmd)];
}

- (void)beaconManager:(ESTBeaconManager *)manager
   didDiscoverBeacons:(NSArray *)beacons
             inRegion:(ESTBeaconRegion *)region
{
    [self updateConsoleWithMessage:NSStringFromSelector(_cmd)];
}

- (void)beaconManager:(ESTBeaconManager *)manager
didFailDiscoveryInRegion:(ESTBeaconRegion *)region
{
    [self updateConsoleWithMessage:NSStringFromSelector(_cmd)];
}

@end
