

#import "Metric.h"
#import "Unit.h"

@implementation Metric
@synthesize metricType = _metricType;
@synthesize metricUnits = _metricUnits;
@synthesize strTittle = _strTittle;

-(id)initWithType:(METRIC_TYPE)type;
{
    self = [super init];
    if (self) {
    }
    
    self.metricType = type;
    [self setUnits:type];
    return self;
}

-(void)setUnits:(METRIC_TYPE)type
{
    switch (type) {
        case METRIC_TYPE_LENGTH:
        {
            self.strTittle = @"Length";
            
            Unit *unitOne = [[Unit alloc]initWithType:LENGTH_UNIT_FOOT];
            Unit *unitTwo = [[Unit alloc]initWithType:LENGTH_UNIT_INCH];
            
            self.metricUnits = [[NSArray alloc] initWithObjects:unitOne,unitTwo, nil];
        }
            break;
        case METRIC_TYPE_MASS:
        {
            self.strTittle = @"Mass";

            Unit *unitOne = [[Unit alloc]initWithType:MASS_UNIT_KILOGRAM];
            Unit *unitTwo = [[Unit alloc]initWithType:MASS_UNIT_POUND];
            self.metricUnits = [[NSArray alloc] initWithObjects:unitOne,unitTwo, nil];

        }
            break;
        case METRIC_TYPE_SPEED:
        {
            self.strTittle = @"Speed";

            Unit *unitOne = [[Unit alloc]initWithType:SPEED_UNIT_KM_PER_HOUR];
            Unit *unitTwo = [[Unit alloc]initWithType:SPEED_UNIT_MILE_PER_HOUR];
            self.metricUnits = [[NSArray alloc] initWithObjects:unitOne,unitTwo, nil];

        }
            break;
        case METRIC_TYPE_TEMPERATURE:
        {
            self.strTittle = @"Temperature";

            Unit *unitOne = [[Unit alloc]initWithType:TEMPERATURE_UNIT_CELSIUS];
            Unit *unitTwo = [[Unit alloc]initWithType:TEMPERATURE_UNIT_FARENHEIT];
            self.metricUnits = [[NSArray alloc] initWithObjects:unitOne,unitTwo, nil];

        }
            break;
        case METRIC_TYPE_VOLUME:
        {
            self.strTittle = @"Volume";

            Unit *unitOne = [[Unit alloc]initWithType:VOLUME_UNIT_USGAL];
            Unit *unitTwo = [[Unit alloc]initWithType:VOLUME_UNIT_USQUART];
            self.metricUnits = [[NSArray alloc] initWithObjects:unitOne,unitTwo, nil];

        }
            break;
       
        default:
            break;
    }
}

@end
