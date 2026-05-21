'''mermaid
sequenceDiagram
    actor 사용자 as 플레이어
    participant 생성UI as Create_Character_UI
    participant 전투객체 as 전투
    participant 플레이어객체 as 플레이어
    participant 전사객체 as 전사
    participant 마법사객체 as 마법사

    사용자->>생성UI: 플레이어id, 캐릭터명, 직업, 레벨 입력
    생성UI->>전투객체: 캐릭터생성(플레이어id, 캐릭터명, 직업, 레벨)

    전투객체->>플레이어객체: 플레이어체크(플레이어id)

    alt 플레이어id == "hero"
        플레이어객체-->>전투객체: true

        alt 직업 == "전사"
            전투객체->>전사객체: 전사 생성(캐릭터명, 레벨)
            Note right of 전사객체: HP = 레벨 × 100<br/>공격력 = 레벨 × 15