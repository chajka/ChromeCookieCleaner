//
//  AppDelegate.m
//  ChromeCookieCleaner
//
//  Created by Чайка on 7/10/15.
//  Copyright (c) 2015 Instrumentality of Mankind. All rights reserved.
//

#import "AppDelegate.h"
#import "FMDatabase.h"

@interface AppDelegate ()


@property (weak) IBOutlet NSWindow *window;
@end

static NSString *chromeCookiePath = @"~/Library/Application Support/Google/Chrome/Default/Cookies";
static NSString *chromiumCookiePath = @"~/Library/Application Support/Chromium/Default/Cookies";
static NSString *SQLString = @"delete from cookies where host_key like '.nicovideo.jp'";

enum popupTag {
	tagChrome = 1001,
	tagChromium,
	tagIron
};

@implementation AppDelegate
#pragma mark - synthesize properties
#pragma mark - class method
#pragma mark - constructor / destructor
#pragma mark - override
- (void) applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// Insert code here to initialize your application
}// end - (void) applicationDidFinishLaunching:(NSNotification *)aNotification

- (void) applicationWillTerminate:(NSNotification *)aNotification
{
	// Insert code here to tear down your application
}// end - (void) applicationWillTerminate:(NSNotification *)aNotification

#pragma mark - delegate
#pragma mark - properties
#pragma mark - actions
- (IBAction) deleteCookies:(id)sender
{
	NSString *cookiePath = nil;
	switch ([[browserKInd selectedItem] tag]) {
		case tagChrome:
			cookiePath = [NSString stringWithString:chromeCookiePath];
			break;
		case tagChromium:
		case tagIron:
			cookiePath = [NSString stringWithString:chromiumCookiePath];
			break;
		default:
			break;
	}// end switch - case by popup tag
	
	NSString *fullPath = [cookiePath stringByExpandingTildeInPath];
	
	FMDatabase *db = [FMDatabase databaseWithPath:fullPath];
	if (![db open])
		return;
	
	FMResultSet *resultSet = [db executeQuery:SQLString];
	if (resultSet == nil)
		return;
}// end - (IBAction) deleteCookies:(id)sender
#pragma mark - messages
#pragma mark - private
#pragma mark - C functions

@end
