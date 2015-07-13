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
#import <AFNetworking/UIImageView+AFNetworking.h>

@implementation AppDelegate {
  SSELUtils *_sselutils;
  UIViewController *_rootController;
}

- (void)viewBeach {
  UIImageView *beachImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 250, 211)];
  [beachImageView setImageWithURL:[NSURL URLWithString:@"http://example.com/beaches/the-beach.jpg"]
                 placeholderImage:[UIImage imageNamed:@"beach-placeholder"]];
  [PEUIUtils placeView:beachImageView
            atBottomOf:[_rootController view]
         withAlignment:PEUIHorizontalAlignmentTypeCenter
              vpadding:75.0
              hpadding:0.0];
  
  /*UIButton *junkBtn = [PEUIUtils buttonWithKey:@"Junk"
                                               font:[UIFont systemFontOfSize:[UIFont systemFontSize]]
                                    backgroundColor:[UIColor lightGrayColor]
                                          textColor:[UIColor blackColor]
                       disabledStateBackgroundColor:[UIColor lightGrayColor]
                             disabledStateTextColor:[UIColor lightGrayColor]
                                    verticalPadding:15.0
                                  horizontalPadding:0.0
                                       cornerRadius:0.0
                                             target:nil
                                             action:nil];
  
  [PEUIUtils placeView:junkBtn
            atBottomOf:[_rootController view]
         withAlignment:PEUIHorizontalAlignmentTypeCenter
              vpadding:300.0
              hpadding:0.0];*/
  
}

#pragma mark - Application lifecycle

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  _sselutils = [SSELUtils utilsWithBaseResourceFolder:@"application-screens"];
  self.window = [[SSELUIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  _rootController = [[UIViewController alloc] initWithNibName:nil bundle:nil];
  UILabel *appTitle = [PEUIUtils labelWithKey:@"PESimu-Select\nDemo App"
                                         font:[UIFont systemFontOfSize:30]
                              backgroundColor:[UIColor clearColor]
                                    textColor:[UIColor blackColor]
                          verticalTextPadding:15];
  UIButton *viewBeachBtn = [PEUIUtils buttonWithKey:@"View Beach"
                                               font:[UIFont systemFontOfSize:[UIFont systemFontSize]]
                                    backgroundColor:[UIColor lightGrayColor]
                                          textColor:[UIColor blackColor]
                       disabledStateBackgroundColor:[UIColor lightGrayColor]
                             disabledStateTextColor:[UIColor lightGrayColor]
                                    verticalPadding:15.0
                                  horizontalPadding:0.0
                                       cornerRadius:0.0
                                             target:self
                                             action:@selector(viewBeach)];
  [PEUIUtils setFrameWidthOfView:viewBeachBtn ofWidth:1.0 relativeTo:[_rootController view]];
  [PEUIUtils placeView:appTitle
               atTopOf:[_rootController view]
         withAlignment:PEUIHorizontalAlignmentTypeCenter
              vpadding:100.0
              hpadding:0.0];
  [PEUIUtils placeView:viewBeachBtn
                 below:appTitle
                  onto:[_rootController view]
         withAlignment:PEUIHorizontalAlignmentTypeCenter
              vpadding:10.0
              hpadding:0.0];
  [[self window] setRootViewController:_rootController];
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
