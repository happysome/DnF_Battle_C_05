```mermaid
sequenceDiagram
    actor 플레이어
    participant Add_Item_UI
    participant 전투
    participant 플레이어객체
    participant 캐릭터객체
    participant 인벤토리객체

    플레이어->>Add_Item_UI: 아이템획득 요청(플레이어id, 아이템명, 아이템타입, 아이템가치)
    Add_Item_UI->>전투: 아이템획득(플레이어id, 아이템명, 아이템타입, 아이템가치)
    전투->>플레이어객체: 플레이어체크(플레이어id)

    alt 플레이어check 결과 == true
        플레이어객체-->>전투: true
        전투->>캐릭터객체: get인벤토리()
        캐릭터객체-->>전투: 인벤토리 객체 반환
        전투->>인벤토리객체: get아이템개수()
        인벤토리객체-->>전투: 현재 개수 (int)

        alt 현재 개수 < 10
            alt 아이템가치 >= 1000
                전투->>+아이템객체: create(아이템명, 아이템타입, 아이템가치, "전설")
            else 아이템가치 >= 500
                전투->>+아이템객체: create(아이템명, 아이템타입, 아이템가치, "희귀")
            else 아이템가치 < 500
                전투->>+아이템객체: create(아이템명, 아이템타입, 아이템가치, "일반")
            end
            아이템객체-->>-전투: 아이템 객체 반환

            전투->>인벤토리객체: 아이템추가(아이템객체)
            인벤토리객체-->>전투: true
            전투-->>Add_Item_UI: "아이템 획득 완료"
            Add_Item_UI-->>플레이어: 결과 출력
        else 현재 개수 >= 10
            전투-->>Add_Item_UI: "인벤토리 가득 참"
            Add_Item_UI-->>플레이어: 오류 메시지 출력
        end
    else 플레이어체크 결과 == false
        플레이어객체-->>전투: false
        전투-->>Add_Item_UI: "플레이어체크 실패"
        Add_Item_UI-->>플레이어: 오류 메시지 출력
    end
