// On iPhone Loaded
%hook SpringBoard
-(void)applicationDidFinishLaunching:(id)application 
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Welcome" 
        message:@"Welcome to your iPhone starkov79!" 
        delegate:nil 
        cancelButtonTitle:@"Thanks" 
        otherButtonTitles:nil];
    [alert show];
    [alert release];

	%orig;
}
%end

// On Each of Application Loaded
#import <UIKit/UIKit.h>

%hook SBApplicationIcon
-(void)launch
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" 
		message:@"Hello World" 
		delegate:self 
		cancelButtonTitle:@"Good Bye" 
		otherButtonTitles:nil];
    [alert show];
    [alert release];
    
	%orig;
}
%end




