#import "AFIncrementalStore.h"
#import "AFRestClient.h"

@interface BayBucksMobileAPIClient : AFRESTClient <AFIncrementalStoreHTTPClient>

+ (BayBucksMobileAPIClient *)sharedClient;

@end
