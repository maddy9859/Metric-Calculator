

#import <Foundation/Foundation.h>

typedef enum METRIC{
    METRIC_TYPE_MASS = 0,
    METRIC_TYPE_TEMPERATURE = 1,
    METRIC_TYPE_VOLUME = 2,
    METRIC_TYPE_LENGTH = 3,
    METRIC_TYPE_SPEED = 4,
}METRIC_TYPE;

@interface Metric : NSObject

@property(assign,nonatomic)METRIC_TYPE metricType;
@property(strong,nonatomic)NSArray *metricUnits;
@property(strong,nonatomic)NSString *strTittle;

-(id)initWithType:(METRIC_TYPE)type;
@end
