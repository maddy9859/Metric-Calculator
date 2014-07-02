

#import <Foundation/Foundation.h>

typedef enum UNIT{
    MASS_UNIT_KILOGRAM = 0,
    MASS_UNIT_POUND = 1,
    LENGTH_UNIT_FOOT = 2,
    LENGTH_UNIT_INCH = 3,
    TEMPERATURE_UNIT_CELSIUS = 4,
    TEMPERATURE_UNIT_FARENHEIT = 5,
    SPEED_UNIT_KM_PER_HOUR = 6,
    SPEED_UNIT_MILE_PER_HOUR = 7,
    VOLUME_UNIT_USGAL = 8,
    VOLUME_UNIT_USQUART = 9,
}UNIT_TYPE;

//typedef enum LENGTH_UNIT{
//    LENGTH_UNIT_FOOT = 0,
//    LENGTH_UNIT_INCHE = 1,
//}LENGTH_UNIT;


//typedef enum TEMPERATURE_UNIT{
//    TEMPERATURE_UNIT_CELSIUS = 0,
//    TEMPERATURE_UNIT_FARENHEIT = 1,
//}TEMPERATURE_UNIT;
//

//typedef enum SPEED_UNIT{
//    SPEED_UNIT_KM_PER_HOUR = 0,
//    SPEED_UNIT_MILE_PER_HOUR = 1,
//}SPEED_UNIT;


//typedef enum VOLUME_UNIT{
//    VOLUME_UNIT_USGAL = 0,
//    VOLUME_UNIT_USQUART = 1,
//}VOLUME_UNIT;


@interface Unit : NSObject
@property(assign,nonatomic)UNIT_TYPE unitType;
@property(assign,nonatomic)double value;
@property(strong,nonatomic)NSString *strTittle;

-(id)initWithType:(UNIT_TYPE)type;
@end
