#import <Foundation/Foundation.h>
#import <rootless.h>

%hook ClassName

// Hooking a class method
+ (id)sharedInstance {
	return %orig;
}

- (void)messageName:(int)argument {
	%log; // Write a message about this call, including its class, name and arguments, to the system log.

	%orig; // Call through to the original function with its original arguments.

	NSLog(@"var: %@", ROOT_PATH_NS(@"/var/"));
}

%end

%ctor {
    NSLog(@"[Marauder] Brought to you by Luki, Leptos, Lightmann, and Kabir");
	%init;
}
