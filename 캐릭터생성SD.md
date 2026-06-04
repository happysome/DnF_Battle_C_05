```mermaid

sequenceDiagram

&#x20;   actor 플레이어

&#x20;   participant Create\_Character\_UI

&#x20;   participant 전투

&#x20;   participant 플레이어객체

&#x20;   participant 전사객체

&#x20;   participant 마법사객체



&#x20;   플레이어->>Create\_Character\_UI: 캐릭터생성 요청(플레이어id, 캐릭터명, 직업, 레벨)

&#x20;   Create\_Character\_UI->>전투: 캐릭터생성(플레이어id, 캐릭터명, 직업, 레벨)

&#x20;   전투->>플레이어객체: 플레이어check(플레이어id)



&#x20;   alt 플레이어check 결과 == true

&#x20;       플레이어객체-->>전투: true

&#x20;       

&#x20;       alt 직업 == "전사"

&#x20;           전투->>+전사객체: create(플레이어id, 캐릭터명, 레벨)

&#x20;           Note over 전사객체: 인벤토리 내부 자동 생성

&#x20;           전사객체-->>-전투: 전사 객체 반환

&#x20;       else 직업 == "마법사"

&#x20;           전투->>+마법사객체: create(플레이어id, 캐릭터명, 레벨)

&#x20;           Note over 마법사객체: 인벤토리 내부 자동 생성

&#x20;           마법사객체-->>-전투: 마법사 객체 반환

&#x20;       end

&#x20;       

&#x20;       전투-->>Create\_Character\_UI: "캐릭터 생성 완료"

&#x20;       Create\_Character\_UI-->>플레이어: 결과 출력

&#x20;   else 플레이어check 결과 == false

&#x20;       플레이어객체-->>전투: false

&#x20;       전투-->>Create\_Character\_UI: "플레이어체크 실패"

&#x20;       Create\_Character\_UI-->>플레이어: 오류 메시지 출력

&#x20;   end

