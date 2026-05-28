```mermaid

classDiagram

&#x20;   direction topToBottom



&#x20;   %% Boundary 클래스

&#x20;   class Create\_Character\_UI {

&#x20;   }

&#x20;   class Attack\_Monster\_UI {

&#x20;   }

&#x20;   class Add\_Item\_UI {

&#x20;   }

&#x20;   class Join\_Guild\_UI {

&#x20;   }



&#x20;   %% Controller 클래스

&#x20;   class 전투 {

&#x20;       +캐릭터생성(플레이어id: String, 캐릭터명: String, 직업: String, 레벨: int) String

&#x20;       +몬스터공격(플레이어id: String, 캐릭터명: String, 몬스터명: String, 몬스터체력: int) String

&#x20;       +아이템획득(플레이어id: String, 아이템명: String, 아이템타입: String, 아이템가치: int) String

&#x20;       +길드가입(플레이어id: String, 길드명: String) String

&#x20;   }



&#x20;   %% Entity 클래스

&#x20;   class 플레이어 {

&#x20;       +플레이어check(플레이어id: String) boolean

&#x20;   }



&#x20;   class 캐릭터 {

&#x20;       <<abstract>>

&#x20;       #플레이어id: String

&#x20;       #캐릭터명: String

&#x20;       #직업: String

&#x20;       #레벨: int

&#x20;       #인벤토리: 인벤토리

&#x20;       +스킬발동()\* double

&#x20;   }



&#x20;   class 전사 {

&#x20;       +스킬발동() double

&#x20;   }



&#x20;   class 마법사 {

&#x20;       +스킬발동() double

&#x20;   }



&#x20;   class 인벤토리 {

&#x20;       -아이템리스트: List

&#x20;       -최대용량: int

&#x20;       +아이템추가(아이템객체: 아이템) boolean

&#x20;   }



&#x20;   class 아이템 {

&#x20;       -아이템명: String

&#x20;       -타입: String

&#x20;       -가치: int

&#x20;       -등급: String

&#x20;   }



&#x20;   class 길드 {

&#x20;       -길드명: String

&#x20;       -캐릭터리스트: List

&#x20;       -최대인원: int

&#x20;       +캐릭터가입(캐릭터객체: 캐릭터) boolean

&#x20;   }



&#x20;   %% 의존 및 관계 정의 (요구사항 제약조건 반영)

&#x20;   Create\_Character\_UI ..> 전투 : 의존

&#x20;   Attack\_Monster\_UI ..> 전투 : 의존

&#x20;   Add\_Item\_UI ..> 전투 : 의존

&#x20;   Join\_Guild\_UI ..> 전투 : 의존



&#x20;   전투 ..> 플레이어 : 의존

&#x20;   전투 ..> 캐릭터 : 의존

&#x20;   전투 ..> 길드 : 의존

&#x20;   전투 ..> 아이템 : 의존



&#x20;   전사 --|> 캐릭터 : 상속

&#x20;   마법사 --|> 캐릭터 : 상속



&#x20;   %% 복합객체관계 핵심 기호

&#x20;   캐릭터 "1" \*-- "1" 인벤토리 : Composition (강한소유)

&#x20;   인벤토리 "1" \*-- "0..10" 아이템 : Composition (강한소유)

&#x20;   길드 "1" o-- "0..5" 캐릭터 : Aggregation (약한소유)

