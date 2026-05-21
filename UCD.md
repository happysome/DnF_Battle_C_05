```mermaid
flowchart LR
    플레이어((플레이어))

    UC1([캐릭터생성])
    UC2([몬스터공격])
    UC3([플레이어체크])

    플레이어 --> UC1
    플레이어 --> UC2

    UC1 -. include .-> UC3
    UC2 -. include .-> UC3