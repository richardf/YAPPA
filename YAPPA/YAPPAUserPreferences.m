#import "YAPPAUserPreferences.h"
#import "YAPPADeckFactory.h"

@implementation YAPPAUserPreferences
+(NSString *) userPreference: (NSString *) prefName {
   NSString *pref = [[NSUserDefaults standardUserDefaults] stringForKey: prefName];
    
    if(pref == nil) {
        [self registerDefaults:@{YAPPA_PREF_DECK_TYPE : DECK_DEFAULT}];
    }
    
    return [[NSUserDefaults standardUserDefaults] stringForKey: prefName];
}

+(void) saveUserPreference: (NSString *) prefName withValue: (NSString *) prefValue {
    [[NSUserDefaults standardUserDefaults] setValue:prefValue forKey:prefName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(void) registerDefaults: (NSDictionary *) dic {
    [dic enumerateKeysAndObjectsUsingBlock:
     ^(id key, id obj, BOOL *stop) {
         [[NSUserDefaults standardUserDefaults] setValue:obj forKey:key];
     }];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
