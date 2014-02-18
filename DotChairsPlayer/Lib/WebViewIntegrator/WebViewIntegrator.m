//
// Created by azu on 2014/02/05.
//


#import <WebViewJavascriptBridge/WebViewJavascriptBridge.h>
#import "WebViewIntegrator.h"
#import "ASTMap.h"
#import "DotIndexModel.h"


@interface WebViewIntegrator ()
@property(nonatomic, strong) WebViewJavascriptBridge *bridge;
@property(nonatomic, strong) UIWebView *webView;
@property(nonatomic, strong) NSObject <DotWebViewIntegrator> *webViewDelegate;
@end

@implementation WebViewIntegrator {

}
- (instancetype)initWithWebView:(UIWebView *) webView webViewDelegate:(NSObject <DotWebViewIntegrator> *) webViewDelegate {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    self.webView = webView;
    self.webViewDelegate = webViewDelegate;
    [WebViewJavascriptBridge enableLogging];
    [self integrationInstallHandler];
    return self;
}

+ (instancetype)integratorWithWebView:(UIWebView *) webView webViewDelegate:(NSObject <DotWebViewIntegrator> *) webViewDelegate {
    return [[self alloc] initWithWebView:webView webViewDelegate:webViewDelegate];
}

- (void)integrationInstallHandler {
    self.bridge = [WebViewJavascriptBridge bridgeForWebView:self.webView webViewDelegate:self.webViewDelegate handler:^(id data, WVJBResponseCallback responseCallback) {
        responseCallback(@"Response for message from ObjC");
    }];
    __weak typeof (self) that = self;
    [self.bridge registerHandler:@"post-video-list" handler:^(id data, WVJBResponseCallback responseCallback) {
        NSArray *videoObject = data;
        NSArray *models = ASTMap(videoObject, ^id(id obj) {
            NSLog(@"obj = %@", obj);
            return [DotIndexModel modelObjectWithDictionary:obj];
        });
        if ([_webViewDelegate respondsToSelector:@selector(webView:responseDotIndexList:)]) {
            [_webViewDelegate webView:_webView responseDotIndexList:models];
        }
    }];
}

@end