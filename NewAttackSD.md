```mermaid
sequenceDiagram
    actor 사용자 as 플레이어
    participant UI as Attack_Monster_UI
    participant 전투
    participant 플레이어객체 as 플레이어
    participant 캐릭터객체 as 캐릭터

    사용자->>UI: 몬스터공격 요청
    UI->>전투: 몬스터공격(플레이어id, 캐릭터객체)
    전투->>플레이어객체: 플레이어체크(플레이어id)

    alt 플레이어체크 결과 == true
        플레이어객체-->>전투: true
        %% 다형성에 의해 전사/마법사에 맞는 스킬이 내부적으로 발동되고 데미지(double)만 리턴됨
        전투->>캐릭터객체: 스킬발동()
        캐릭터객체-->>전투: 데미지 (double)
        %% 데미지 크기에 따른 등급 분기 로직 (전투 클래스 내부에서 판단)
        alt 데미지 >= 200
            전투-->>UI: "S급 공격"
        else 데미지 >= 100
            전투-->>UI: "A급 공격"
        else 데미지 < 100
            전투-->>UI: "B급 공격"
        end
        UI-->>사용자: 공격 결과 출력
    else 플레이어체크 결과 == false
        플레이어객체-->>전투: false
        전투-->>UI: "플레이어체크 실패"
        UI-->>사용자: 오류 메시지 출력
    end