//
//  main.m
//  CPConsoleApp
//
//  Created by Erik Deijl on 01/10/15.
//  Copyright © 2015 Erik Deijl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "HsFFI.h"

int main(int argc, char * argv[]) {
    hs_init(NULL, NULL);
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
