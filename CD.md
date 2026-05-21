```mermaid
classDiagram
    class 플레이어 {
        -String 플레이어id
        +플레이어체크() boolean
    }
    
    class 캐릭터 {
        <<abstract>>
        +String 캐릭터명
        +int 레벨
        +int HP
        +int 공격력
        +스킬발동()* }
    
    class 전사 {
        +스킬발동() 
    }
    
    class 마법사 {
        +스킬발동() 
    }
    
    class 전투 {
        +캐릭터생성(캐릭터명:String, 레벨:int, HP:int, 공격력:int) 
        +몬스터공격(플레이어id:String, 캐릭터명:String) 
    }
    
    class 캐릭터_생성_UI {
        <<boundary>>
    }
    
    class 몬스터_공격_UI {
        <<boundary>>
    }
    
    캐릭터 <|-- 전사 : 상속 (검 휘두르기)
    캐릭터 <|-- 마법사 : 상속 (파이어볼)
    
    캐릭터_생성_UI ..> 전투 : 캐릭터 생성 요청
    몬스터_공격_UI ..> 전투 : 몬스터 공격 요청
    
    전투 ..> 플레이어 : 플레이어체크 검증
    전투 ..> 캐릭터 : 캐릭터 객체 제어