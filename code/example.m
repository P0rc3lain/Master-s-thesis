#import <Foundation/Foundation.h>

@interface Greater: NSObject
- (void)sayHello;
@end

@implementation Greater
- (void)sayHello {
   NSLog(@"Hello World\n");
}
@end

int main () {
   @autoreleasepool {
      Greater * myGreater = [[SampleClass alloc] init];
      [myGreater sayHello];
   }
}