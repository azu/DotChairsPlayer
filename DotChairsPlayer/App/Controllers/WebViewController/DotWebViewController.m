//
// Created by azu on 2014/02/16.
//


#import "DotWebViewController.h"
#import "DotDownloadManager.h"
#import "DotWebViewModel.h"


@interface DotWebViewController ()
@property(weak, nonatomic) IBOutlet UIWebView *mainWebView;

@property(nonatomic, strong) DotDownloadManager *downloadManager;

@property(nonatomic, strong) DotWebViewModel *model;

@property(nonatomic, strong) WebViewIntegrator *integrator;

- (IBAction)backButtonHandler:(id) sender;

- (IBAction)downloadButtonHandler:(id) sender;
@end

@implementation DotWebViewController
- (DotWebViewModel *)model {
    if (_model == nil) {
        _model = [[DotWebViewModel alloc] init];
    }
    return _model;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.integrator = [WebViewIntegrator integratorWithWebView:self.mainWebView webViewDelegate:self];

    NSString *defaultURL = @"http://dotinstall.com/";
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:defaultURL]];
    [self.mainWebView loadRequest:request];
}

- (IBAction)backButtonHandler:(id) sender {
    if ([self.mainWebView canGoBack]) {
        [self.mainWebView goBack];
    }
}


- (DotDownloadManager *)downloadManager {
    if (_downloadManager == nil) {
        _downloadManager = [DotDownloadManager sharedManager];
    }
    _downloadManager.dataSource = self;
    _downloadManager.delegate = self;
    _downloadManager.forceDownload = YES;
    _downloadManager.createFoldersHierarchy = NO;
    return _downloadManager;
}

- (void)downloadFiles:(NSArray *) downloadURLs {
    [self.model setDownloadList:downloadURLs];
    [self.downloadManager start];
}

- (NSUInteger)numberOfFilesToDownloadForDownloadManager:(ADBDownloadManager *) manager {
    return [self.model numberOfURLs];
}

- (NSString *)downloadManager:(ADBDownloadManager *) manager pathForFileToDownloadAtIndex:(NSUInteger) index1 {
    return [self.model filePathForIndex:index1];
}

- (NSString *)downloadManager:(ADBDownloadManager *) manager fileNameForFileToDownloadAtIndex:(NSUInteger) index1 {
    return [self.model fileNameForIndex:index1];
}


- (void)downloadManagerWillStart:(ADBDownloadManager *) manager {
    self.title = @"Downloading...";
}

- (void)downloadManager:(ADBDownloadManager *) manager didFailFileAtIndex:(NSUInteger) index1 fromRemoteURL:(NSString *) remoteURL toLocalPath:(NSString *) localPath error:(NSError *) error {
}

- (void)downloadManagerDidCompleteAllDownloads:(ADBDownloadManager *) manager failedURLs:(NSArray *) failedURLs totalBytes:(NSUInteger) totalBytes {
    self.title = @"";
}

- (void)downloadManagerDidStop:(ADBDownloadManager *) manager {
    self.title = @"";
}

- (void)downloadManager:(ADBDownloadManager *) manager didDownloadFileAtIndex:(NSUInteger) index1 fromRemoteURL:(NSString *) remoteURL toLocalPath:(NSString *) localPath bytes:(NSUInteger) bytes {
    self.title = [NSString stringWithFormat:@"Finish %d/%d", index1, [self.model numberOfURLs]];
}

- (void)webView:(UIWebView *) webView responseDotIndexList:(NSArray *) dotIndexList {
    [self downloadFiles:dotIndexList];
}

- (IBAction)downloadButtonHandler:(id) sender {
    NSString *javaScript = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dotinstall" ofType:@"js"] encoding:NSUTF8StringEncoding error:nil];
    [self.mainWebView stringByEvaluatingJavaScriptFromString:javaScript];
}


@end