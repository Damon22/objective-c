#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 가비지 컬렉션을 기동 
    NSGarbageCollector *gc = [NSGarbageCollector defaultCollector];
    [gc enable];
    
    // 약한 참조 관계로 오브젝트를 보관하는 해시 테이블을 생성
    NSHashTable *hashTable;
    hashTable = [NSHashTable hashTableWithWeakObjects];
    
	for (int i = 0; i < 10; i++)
	{
		// 한번의 루프로 소멸될 오브젝트를 추가
		NSString *str = [NSString string];
		[hashTable addObject:str];
	}
    NSLog(@"%@", hashTable);

    // 소멸 처리를 함
    [gc collectIfNeeded];
    [gc collectExhaustively];
    [pool drain];
    return 0;
}
