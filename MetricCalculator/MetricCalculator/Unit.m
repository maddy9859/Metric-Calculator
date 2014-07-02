
#import "Unit.h"

@implementation Unit
@synthesize strTittle = _strTittle;
@synthesize value = _value;
@synthesize unitType = _unitType;

-(id)initWithType:(UNIT_TYPE)type;
{
    self = [super init];
    if (self) {
    }
    self.unitType = type;

    [self setUnitValue:type];
    return self;
}

-(void)setUnitValue:(UNIT_TYPE)type
{

    switch (type) {
        case MASS_UNIT_KILOGRAM:
        {
            self.strTittle = @"Kg";
        }
            break;
        case MASS_UNIT_POUND:
        {
            self.strTittle = @"Pound";

        }
            break;
        case LENGTH_UNIT_FOOT:
        {
            self.strTittle = @"Foot";
            self.value = 12;

        }
            break;
        case LENGTH_UNIT_INCH:
        {
            self.strTittle = @"Inch";

        }
            break;
        case TEMPERATURE_UNIT_CELSIUS:
        {
            self.strTittle = @"Celsius";

        }
            break;
        case TEMPERATURE_UNIT_FARENHEIT:
        {
            self.strTittle = @"Farehneit";

        }
            break;
        case SPEED_UNIT_KM_PER_HOUR:
        {
            self.strTittle = @"Km/hr";

        }
            break;
            
        case SPEED_UNIT_MILE_PER_HOUR:
        {
            self.strTittle = @"Mile/hr";

        }
            break;
        case VOLUME_UNIT_USGAL:
        {
            self.strTittle = @"US gal";

        }
            break;
        case VOLUME_UNIT_USQUART:
        {
            self.strTittle = @"US quart";

        }
            break;
        default:
            break;
    }
}
@end
