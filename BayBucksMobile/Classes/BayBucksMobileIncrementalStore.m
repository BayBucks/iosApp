#import "BayBucksMobileIncrementalStore.h"
#import "BayBucksMobileAPIClient.h"

@implementation BayBucksMobileIncrementalStore

+ (void)initialize {
    [NSPersistentStoreCoordinator registerStoreClass:self forStoreType:[self type]];
}

+ (NSString *)type {
    return NSStringFromClass(self);
}

+ (NSManagedObjectModel *)model {
    return [[NSManagedObjectModel alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"BayBucksMobile" withExtension:@"xcdatamodeld"]];
}

- (id <AFIncrementalStoreHTTPClient>)HTTPClient {
    return [BayBucksMobileAPIClient sharedClient];
}

@end