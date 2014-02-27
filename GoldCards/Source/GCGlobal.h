// Logging
#import <CocoaLumberjack/DDLog.h>
#import <CocoaLumberjack/DDASLLogger.h>
#import <CocoaLumberjack/DDTTYLogger.h>
#import <CocoaLumberjack/DDFileLogger.h>

#ifdef DEBUG
// If you are debugging, feel free to change this to LOG_LEVEL_VERBOSE though please don't commit the change.
static const int ddLogLevel = LOG_LEVEL_WARN;
#else
static const int ddLogLevel = LOG_LEVEL_WARN;
#endif
