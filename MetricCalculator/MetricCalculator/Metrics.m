

#import "Metrics.h"
#import "Metric.h"

@implementation Metrics
@synthesize arrayMetrics = _arrayMetrics;


- (id)init
{
    self = [super init];
    if (self) {
    }
    
    _arrayMetrics = [[NSMutableArray alloc] init];
    
    for (int i =0; i<5; i++)
    {
        Metric *_metric = [[Metric alloc] initWithType:i];
        [_arrayMetrics addObject:_metric];
    }
    return self;
}
@end
