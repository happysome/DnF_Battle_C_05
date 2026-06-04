```mermaid
sequenceDiagram
    actor 플레이어
    participant Create_Character_UI
    participant 전투
    participant 플레이어객체
    participant 전사객체
    participant 마법사객체

    플레이어->>Create_Character_UI: 캐릭터생성 요청(플레이어id, 캐릭터명, 직업, 레벨)
    Create_Character_UI->>전투: 캐릭터생성(플레이어id, 캐릭터명, 직업, 레벨)
    전투->>플레이어객체: 플레이어check(플레이어id)

    alt 플레이어check 결과 == true
        플레이어객체-->>전투: true
        
        alt 직업 == "전사"
            전투->>+전사객체: create(플레이어id, 캐릭터명, 레벨)
            Note over 전사객체: 인벤토리 내부 자동 생성
            전사객체-->>-전투: 전사 객체 반환
        else 직업 == "마법사"
            전투->>+마법사객체: create(플레이어id, 캐릭터명, 레벨)
            Note over 마법사객체: 인벤토리 내부 자동 생성
            마법사객체-->>-전투: 마법사 객체 반환
        end
        
        전투-->>Create_Character_UI: "캐릭터 생성 완료"
        Create_Character_UI-->>플레이어: 결과 출력
    else 플레이어check 결과 == false
        플레이어객체-->>전투: false
        전투-->>Create_Character_UI: "플레이어체크 실패"
        Create_Character_UI-->>플레이어: 오류 메시지 출력
    end
