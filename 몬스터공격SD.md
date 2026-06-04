```mermaid

sequenceDiagram

&#x20;   actor 플레이어

&#x20;   participant Attack\_Monster\_UI

&#x20;   participant 전투

&#x20;   participant 캐릭터객체



&#x20;   플레이어->>Attack\_Monster\_UI: 몬스터공격 요청(플레이어id, 캐릭터명, 몬스터명, 몬스터체력)

&#x20;   Attack\_Monster\_UI->>전투: 몬스터공격(플레이어id, 캐릭터명, 몬스터명, 몬스터체력)

&#x20;   

&#x20;   전투->>캐릭터객체: 스킬발동()

&#x20;   캐릭터객체-->>전투: 데미지 결과 (double)

&#x20;   

&#x20;   alt 데미지 >= 20.0

&#x20;       전투->>전투: 등급 = "S급 공격"

&#x20;   else 데미지 >= 15.0

&#x20;       전투->>전투: 등급 = "A급 공격"

&#x20;   else 데미지 < 15.0

&#x20;       전투->>전투: 등급 = "B급 공격"

&#x20;   end

&#x20;   

&#x20;   전투-->>Attack\_Monster\_UI: 공격 결과 및 등급 메시지 반환

&#x20;   Attack\_Monster\_UI-->>플레이어: 결과 출력

