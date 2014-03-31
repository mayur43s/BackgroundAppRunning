//
//  ViewController.h
//  Geo
//
//  Created by Canopus 10 on 4/23/13.
//
//

#import <UIKit/UIKit.h>

#define CONSOLE_NOTIFICATION                    @"UpdateConsole"

#define PostConsoleMessage(message) [[NSNotificationCenter defaultCenter] postNotificationName:CONSOLE_NOTIFICATION object:message userInfo:nil]

@interface ViewController : UIViewController
{
    //    Command *upload;
    //    Command *download;
    
    NSArray *arrayEvents;
    
    IBOutlet UITextView *console;
}

@end
