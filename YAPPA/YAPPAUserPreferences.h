#import <Foundation/Foundation.h>
#define YAPPA_PREF_DECK_TYPE @"deckType"

@interface YAPPAUserPreferences : NSObject
+(NSString *) userPreference: (NSString *) prefName;
+(void) saveUserPreference: (NSString *) prefName withValue: (NSString *) prefValue;
+(void) registerDefaults: (NSDictionary *) dic;
@end
