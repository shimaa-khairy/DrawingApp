//
//  AppDelegate.h
//  DrawingApp
//
//  Created by shimaa_khairy on 7/10/18.
//  Copyright © 2018 shimaa_khairy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

