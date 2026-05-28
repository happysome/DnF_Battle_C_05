```mermaid
sequenceDiagram
    actor 플레이어
    participant Join_Guild_UI
    participant 전투
    participant 플레이어객체
    participant 길드객체

    플레이어->>Join_Guild_UI: 길드가입 요청(플레이어id, 길드명)
    Join_Guild_UI->>전투: 길드가입(플레이어id, 길드명)
    전투->>플레이어객체: 플레이어check(플레이어id)

<<<<<<< HEAD
&#x20;   participant Join\_Guild\_UI

&#x20;   participant 전투

&#x20;   participant 플레이어객체

&#x20;   participant 길드객체



&#x20;   플레이어->>Join\_Guild\_UI: 길드가입 요청(플레이어id, 길드명)

&#x20;   Join\_Guild\_UI->>전투: 길드가입(플레이어id, 길드명)

&#x20;   전투->>플레이어객체: 플레이어체크(플레이어id)



&#x20;   alt 플레이어체크 결과 == true

&#x20;       플레이어객체-->>전투: true

&#x20;       전투->>길드객체: get현재인원()

&#x20;       길드객체-->>전투: 현재 인원 (int)



&#x20;       alt 현재 인원 < 5

&#x20;           전투->>전투: 해당 플레이어의 캐릭터객체 확인

&#x20;           전투->>길드객체: 캐릭터가입(캐릭터객체)

&#x20;           길드객체-->>전투: true

&#x20;           전투-->>Join\_Guild\_UI: "길드 가입 완료"

&#x20;           Join\_Guild\_UI-->>플레이어: 결과 출력

&#x20;       else 현재 인원 >= 5

&#x20;           전투-->>Join\_Guild\_UI: "길드 정원 초과"

&#x20;           Join\_Guild\_UI-->>플레이어: 오류 메시지 출력

&#x20;       end

&#x20;   else 플레이어체크 결과 == false

&#x20;       플레이어객체-->>전투: false

&#x20;       전투-->>Join\_Guild\_UI: "플레이어체크 실패"

&#x20;       Join\_Guild\_UI-->>플레이어: 오류 메시지 출력

&#x20;   end
=======
    alt 플레이어check 결과 == true
        플레이어객체-->>전투: true
        전투->>길드객체: get현재인원()
        길드객체-->>전투: 현재 인원 (int)
>>>>>>> 541ec90d8feaf6fb70275a4a1f4079187857ef4c

        alt 현재 인원 < 5
            전투->>전투: 해당 플레이어의 캐릭터객체 확인
            전투->>길드객체: 캐릭터가입(캐릭터객체)
            길드객체-->>전투: true
            전투-->>Join_Guild_UI: "길드 가입 완료"
            Join_Guild_UI-->>플레이어: 결과 출력
        else 현재 인원 >= 5
            전투-->>Join_Guild_UI: "길드 정원 초과"
            Join_Guild_UI-->>플레이어: 오류 메시지 출력
        end
    else 플레이어check 결과 == false
        플레이어객체-->>전투: false
        전투-->>Join_Guild_UI: "플레이어체크 실패"
        Join_Guild_UI-->>플레이어: 오류 메시지 출력
    end