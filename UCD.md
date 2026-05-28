```mermaid
flowchart LR
    플레이어((플레이어))

    UC1([캐릭터생성])
    UC2([몬스터공격])
    UC3([플레이어체크])
    UC4([아이템획득])
    UC5([길드가입])


    플레이어 --> UC1
    플레이어 --> UC2
    플레이어 --> UC4
    플레이어 --> UC5

    UC1 -. include .-> UC3
    UC2 -. include .-> UC3
    UC4 -. include .-> UC3
    UC5 -. include .-> UC3
    