```mermaid
sequenceDiagram
    actor 플레이어
    participant Attack_Monster_UI
    participant 전투
    participant 플레이어객체
    participant 캐릭터객체

    플레이어->>Attack_Monster_UI: 몬스터공격 요청(플레이어id, 캐릭터명, 몬스터명, 몬스터체력)
    Attack_Monster_UI->>전투: 몬스터공격(플레이어id, 캐릭터명, 몬스터명, 몬스터체력)
    전투->>플레이어객체: 플레이어check(플레이어id)

    alt 플레이어check 결과 == true
        플레이어객체-->>전투: true
        전투->>캐릭터객체: 스킬발동()
        캐릭터객체-->>전투: 데미지 결과 (double)
        
        alt 데미지 >= 20.0
            전투->>전투: 등급 = "S급 공격"
        else 데미지 >= 15.0
            전투->>전투: 등급 = "A급 공격"
        else 데미지 < 15.0
            전투->>전투: 등급 = "B급 공격"
        end
        
        전투-->>Attack_Monster_UI: 공격 결과 및 등급 메시지 반환
        Attack_Monster_UI-->>플레이어: 결과 출력
    else 플레이어check 결과 == false
        플레이어객체-->>전투: false
        전투-->>Attack_Monster_UI: "플레이어체크 실패"
        Attack_Monster_UI-->>플레이어: 오류 메시지 출력
    end