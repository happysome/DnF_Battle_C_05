```mermaid
sequenceDiagram
    actor 사용자 as 플레이어
    participant UI as Attack_Monster_UI
    participant 전투
    participant 플레이어객체 as 플레이어
    participant 캐릭터

    사용자->>UI: 몬스터공격 요청
    UI->>전투: 몬스터공격(플레이어id, 캐릭터)
    전투->>플레이어객체: 플레이어체크(플레이어id)

    alt 플레이어id == "hero"
        플레이어객체-->>전투: true
        전투->>캐릭터: 스킬발동()

        alt 캐릭터 == 전사
            캐릭터-->>전투: 검 휘두르기, 데미지 = 공격력 × 1.5
        else 캐릭터 == 마법사
            캐릭터-->>전투: 파이어볼, 데미지 = 공격력 × 2.0
        end

        alt 데미지 >= 200