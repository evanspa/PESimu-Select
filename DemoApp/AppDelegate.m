//
//  AppDelegate.m
//
// Copyright (c) 2014-2015 PESimu-Select
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <PEObjc-Commons/PEUIUtils.h>
#import "AppDelegate.h"
#import "SSELSimulationSelectionController.h"
#import "SSELUtils.h"
#import "SSELUIWindow.h"

@implementation AppDelegate {
  SSELUtils *_sselutils;
}

#pragma mark - Application lifecycle

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _sselutils = [SSELUtils utilsWithBaseResourceFolder:@"application-screens"];
    self.window = [[SSELUIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    UIViewController *rootCtrl = [[UIViewController alloc] init];
    UILabel *appTitle = [PEUIUtils labelWithKey:@"PESimu-Select\nDemo App"
                                           font:[UIFont systemFontOfSize:30]
                                backgroundColor:[UIColor clearColor]
                                      textColor:[UIColor blackColor]
                          horizontalTextPadding:15
                            verticalTextPadding:15];
    [PEUIUtils placeView:appTitle
              inMiddleOf:[rootCtrl view]
           withAlignment:PEUIHorizontalAlignmentTypeCenter
                hpadding:0];
    [[self window] setRootViewController:rootCtrl];

    [_sselutils reactToShakeGestureForScreen:@"unauthenticated-landing-screen"
                          ontoViewController:[[self window] rootViewController]];
    // add simulation toggler button
    [_sselutils addSimulationTogglerForScreen:@"unauthenticated-landing-screen"
                           ontoViewController:[[self window] rootViewController]];

    application.applicationSupportsShakeToEdit = YES;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application { }

- (void)applicationDidEnterBackground:(UIApplication *)application { }

- (void)applicationWillEnterForeground:(UIApplication *)application { }

- (void)applicationDidBecomeActive:(UIApplication *)application { }

- (void)applicationWillTerminate:(UIApplication *)application { }

@end
