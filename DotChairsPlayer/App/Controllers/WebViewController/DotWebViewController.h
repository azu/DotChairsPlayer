//
// Created by azu on 2014/02/16.
//


#import <Foundation/Foundation.h>
#import <ADBDownloadManager/ADBDownloadManager.h>
#import "WebViewIntegrator.h"

@class DotDownloadManager;


@interface DotWebViewController : UIViewController <ADBDownloadManagerDelegate, ADBDownloadManagerDataSource, DotWebViewIntegrator>
@end