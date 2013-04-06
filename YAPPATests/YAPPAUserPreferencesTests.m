#import "YAPPAUserPreferencesTests.h"
#import "YAPPAUserPreferences.h"

@implementation YAPPAUserPreferencesTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void) cleanupUserPreferences
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"key1"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"key2"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)testRegisterDefaultsShouldSaveUserPreferencesDicWith1Element
{
    [YAPPAUserPreferences registerDefaults:@{@"key1" : @"val1"}];
    
    NSString *value = [[NSUserDefaults standardUserDefaults] stringForKey:@"key1"];
    
    [self cleanupUserPreferences];
    
    STAssertEqualObjects(@"val1", value, @"The key1 user preference should be equal to key1");
}

- (void)testRegisterDefaultsShouldSaveUserPreferencesDicWith2Elements
{
    [YAPPAUserPreferences registerDefaults:@{@"key1" : @"val1", @"key2" : @"val2"}];
    
    NSString *valueForKey1 = [[NSUserDefaults standardUserDefaults] stringForKey:@"key1"];
    NSString *valueForKey2 = [[NSUserDefaults standardUserDefaults] stringForKey:@"key2"];

    [self cleanupUserPreferences];
    
    STAssertEqualObjects(@"val1", valueForKey1, @"The key1 user preference should be equal to key1");
    STAssertEqualObjects(@"val2", valueForKey2, @"The key2 user preference should be equal to key2");

}

- (void)testRegisterDefaultsWithDictionaryNilShouldDoNothing
{
    STAssertNoThrow([YAPPAUserPreferences registerDefaults:nil], @"registerDefaults with nil dictionary should do nothing.");
}

- (void)testRegisterDefaultsWithEmptyDictionaryShouldDoNothing
{
    STAssertNoThrow([YAPPAUserPreferences registerDefaults:@{}], @"registerDefaults with empty dictionary should do nothing.");
}

- (void) testSaveUserPreferenceShouldSavePreference
{
    [YAPPAUserPreferences saveUserPreference:@"key1" withValue:@"val1"];
    
    NSString *valueForKey1 = [[NSUserDefaults standardUserDefaults] stringForKey:@"key1"];

    [self cleanupUserPreferences];
    
    STAssertEqualObjects(@"val1", valueForKey1, @"The key1 user preference should be equal to key1");
}

- (void) testUserPreferenceWithValidPrefNameShouldReturnValue
{
    [[NSUserDefaults standardUserDefaults] setValue:@"val1" forKey:@"key1"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSString *value = [YAPPAUserPreferences userPreference:@"key1"];
    
    [self cleanupUserPreferences];
    
    STAssertEqualObjects(@"val1", value, @"The key1 user preference should be equal to key1");
}

- (void) testUserPreferenceWithInvalidPrefNameShouldReturnNil
{
    NSString *value = [YAPPAUserPreferences userPreference:@"invalidKey"];
    STAssertNil(value, @"value for an unexistent key should return nil");
}

@end
