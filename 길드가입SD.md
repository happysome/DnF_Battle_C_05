```mermaid

sequenceDiagram

&#x20;   actor 사용자 as 플레이어

&#x20;   participant UI as Join\_Guild\_UI

&#x20;   participant 전투 as 전투

&#x20;   participant 플레이어객체 as 플레이어

&#x20;   participant 길드객체 as 길드



&#x20;   사용자->>UI: 길드가입 요청(플레이어id, 길드명)

&#x20;   UI->>전투: 길드가입(플레이어id, 길드명)

&#x20;   전투->>플레이어객체: 플레이어check(플레이어id)



&#x20;   alt 플레이어check 결과 == true

&#x20;       플레이어객체-->>전투: true

&#x20;       전투->>길드객체: get현재인원()

&#x20;       길드객체-->>전투: 현재 인원 (int)



&#x20;       alt 현재 인원 < 5

&#x20;           전투->>전투: 해당 플레이어의 캐릭터객체 확인

&#x20;           전투->>길드객체: 캐릭터가입(캐릭터객체)

&#x20;           길드객체-->>전투: true

&#x20;           전투-->>UI: "길드 가입 완료"

&#x20;           UI-->>사용자: 결과 출력

&#x20;       else 현재 인원 >= 5

&#x20;           전투-->>UI: "길드 정원 초과"

&#x20;           UI-->>사용자: 오류 메시지 출력

&#x20;       end

&#x20;   else 플레이어check 결과 == false

&#x20;       플레이어객체-->>전투: false

&#x20;       전투-->>UI: "플레이어체크 실패"

&#x20;       UI-->>사용자: 오류 메시지 출력

&#x20;   end

