//
// Created by azu on 2014/02/05.
//


#import <Foundation/Foundation.h>

@class WebViewJavascriptBridge;
@protocol DotWebViewIntegrator<UIWebViewDelegate>
- (void)webView:(UIWebView *)webView responseDotIndexList:(NSArray *)dotIndexList;
@end
/* @require
    pod 'WebViewJavascriptBridge', '~> 4.1.0'
 */
@interface WebViewIntegrator : NSObject

+ (instancetype)integratorWithWebView:(UIWebView *) webView webViewDelegate:(NSObject <DotWebViewIntegrator> *) webViewDelegate;

@end