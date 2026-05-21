'''mermaid
classDiagram
    class 플레이어 {
        +String 플레이어id
        +boolean 플레이어체크()
    }

    class 캐릭터 {
        <<abstract>>
        +String 캐릭터명
        +int 레벨
        +int HP
        +int 공격력
        +double 스킬발동()
    }

    class 전사 {
        +double 스킬발동()
    }

    class 마법사 {
        +double 스킬발동()
    }

    class 전투 {
        +캐릭터 캐릭터생성(String 플레이어id, String 캐릭터명, String 직업, int 레벨)
        +String 몬스터공격(String 플레이어id, 캐릭터 캐릭터)
    }

    class Create_Character_UI {
        <<boundary>>