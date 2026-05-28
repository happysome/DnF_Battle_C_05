```mermaid
classDiagram
    direction TB

    class Create_Character_UI
    class Attack_Monster_UI
    class Add_Item_UI
    class Join_Guild_UI

    class 전투 {
        +캐릭터생성(플레이어id: String, 캐릭터명: String, 직업: String, 레벨: int) String
        +몬스터공격(플레이어id: String, 캐릭터명: String, 몬스터명: String, 몬스터체력: int) String
        +아이템획득(플레이어id: String, 아이템명: String, 아이템타입: String, 아이템가치: int) String
        +길드가입(플레이어id: String, 길드명: String) String
    }

    class 플레이어 {
        +플레이어check(플레이어id: String) boolean
    }

    class 캐릭터 {
        <<abstract>>
        #플레이어id: String
        #캐릭터명: String
        #직업: String
        #레벨: int
        #인벤토리: 인벤토리
        +스킬발동()* double
    }

    class 전사 {
        +스킬발동() double
    }

    class 마법사 {
        +스킬발동() double
    }

    class 인벤토리 {
        -아이템리스트: List
        -최대용량: int
        +아이템추가(아이템객체: 아이템) boolean
    }

    class 아이템 {
        -아이템명: String
        -타입: String
        -가치: int
        -등급: String
    }

    class 길드 {
        -길드명: String
        -캐릭터리스트: List
        -최대인원: int
        +캐릭터가입(캐릭터객체: 캐릭터) boolean
    }

    Create_Character_UI ..> 전투 : 의존
    Attack_Monster_UI ..> 전투 : 의존
    Add_Item_UI ..> 전투 : 의존
    Join_Guild_UI ..> 전투 : 의존

    전투 ..> 플레이어 : 의존
    전투 ..> 캐릭터 : 의존
    전투 ..> 길드 : 의존
    전투 ..> 아이템 : 의존

    전사 --|> 캐릭터 : 상속
    마법사 --|> 캐릭터 : 상속

    캐릭터 "1" *-- "1" 인벤토리 : Composition
    인벤토리 "1" *-- "0..10" 아이템 : Composition
    길드 "1" o-- "0..5" 캐릭터 : Aggregation
