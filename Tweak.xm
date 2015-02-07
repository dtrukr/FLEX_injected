#import <dlfcn.h>
#import <UIKit/UIKit.h>
#include <notify.h>
#include <objc/message.h>
#import "FLEXManager.h"

__attribute__((visibility("hidden")))
@interface FLEXInjected : NSObject {
@private
}
@end

#define kBundlePath @"/Library/MobileSubstrate/DynamicLibraries/FLEXInjectedBundle.bundle"

@implementation FLEXInjected

+ (instancetype)sharedInstance
{
    static FLEXInjected *_sharedFactory;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedFactory = [[self alloc] init];
    });

    return _sharedFactory;
}

- (id)init
{
        if ((self = [super init]))
        {
                     
        }
        return self;
}

-(void)inject {
	
	NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.daapps.FLEXInjected.plist"];
	id setting = [settings objectForKey:[NSString stringWithFormat:@"FLEXInjectedEnabled-%@", [NSBundle mainBundle].bundleIdentifier]];
	if (setting && [setting boolValue]) {

	NSLog(@"Openning explorer: %@", [FLEXManager sharedManager]);
	[[FLEXManager sharedManager] showExplorer];


	} 
	
}

@end


%ctor {

    [[NSNotificationCenter defaultCenter] addObserver:[FLEXInjected sharedInstance] selector:@selector(inject) name:UIApplicationDidBecomeActiveNotification object:nil];

}