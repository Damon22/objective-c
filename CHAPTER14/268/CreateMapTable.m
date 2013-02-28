#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 가비지 컬렉션을 기동
    NSGarbageCollector *gc = [NSGarbageCollector defaultCollector];
    [gc enable];
    
    // 키가 강한 참조관계이고 오브젝트가 약한 참조관계인 맵 테이블을 생성
    NSMapTable *mapTable;
    
    mapTable = [NSMapTable mapTableWithStrongToWeakObjects];
        
    // 소멸 처리를 함
    [gc collectIfNeeded];
    [gc collectExhaustively];
    
    [pool drain];
    
    return 0;
}
