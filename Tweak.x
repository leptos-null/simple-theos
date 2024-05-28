#import <Foundation/Foundation.h>

%hook ClassName

// Hooking a class method
+ (id)sharedInstance {
	return %orig;
}

- (void)messageName:(int)argument {
	%log; // Write a message about this call, including its class, name and arguments, to the system log.

	%orig; // Call through to the original function with its original arguments.
}

%end
