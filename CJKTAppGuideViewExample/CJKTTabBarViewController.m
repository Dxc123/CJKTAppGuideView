//
//  XYTabBarViewController.m
//  ChemistryProject
//
//  Created by Dxc_iOS on 2018/8/16.
//  Copyright © 2018年 超级课堂. All rights reserved.
//

#import "CJKTTabBarViewController.h"
#import "CJKTHomeController.h"
#import "CJKTMeController.h"
@interface CJKTTabBarViewController ()

@end

@implementation CJKTTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self hdyw_setUpChildViewControllers];
}
/***  添加所有子控制器*/

-(void)hdyw_setUpChildViewControllers{
    //首页
    
    CJKTHomeController *homeVC=[[CJKTHomeController alloc] init];
    [self hdyw_setUpOneChildViewController:homeVC image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]  title:@"首页"];
    CJKTMeController *second=[[CJKTMeController alloc] init];
    [self hdyw_setUpOneChildViewController:second image:[UIImage imageNamed:@""]   selectedImage:[UIImage imageNamed:@""]   title:@"我的"];
   
    
    
}

/**添加一个子控制器的方法*/
- (void)hdyw_setUpOneChildViewController:(UIViewController *)viewController image:(UIImage *)image selectedImage:(UIImage *)selectedImage  title:(NSString *)title{
    
   UINavigationController *BaseNav=[[UINavigationController alloc] initWithRootViewController:viewController];
    viewController.title = title;
    //    viewController.tabBarItem.title=title;
    
    
    //    tabBarItem 的选中和不选中文字属性
    [viewController .tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [viewController .tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    
    //    tabBarItem 的选中和不选中图片属性
    [viewController.tabBarItem setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [viewController.tabBarItem setSelectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [self addChildViewController:BaseNav];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
