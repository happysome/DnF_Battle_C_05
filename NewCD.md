```mermaid
classDiagram
class 플레이어 {
    -String 플레이어id
    +플레이어체크(String 입력id) boolean
}
class 캐릭터 {
    <<abstract>>
    -String 캐릭터명
    -int 레벨
    -int HP
    -int 공격력
    +스킬발동()* double
}
class 전사 {
    +스킬발동() double
}
class 마법사 {
    +스킬발동() double
}
class 전투 {
    +캐릭터생성(String 플레이어id, String 캐릭터명, String 직업, int 레벨) 캐릭터
    +몬스터공격(String 플레이어id, 캐릭터 캐릭터객체) String
}
class Create_Character_UI {
    <<boundary>>
}
class Attack_Monster_UI {
    <<boundary>>
}

%% 상속 관계 및 명세서 스킬 주석 반영
캐릭터 <|-- 전사 : 상속 (검 휘두르기)
캐릭터 <|-- 마법사 : 상속 (파이어볼)

%% 경계 클래스와 구조적 관계선
Create_Character_UI ..> 전투 : 캐릭터 생성 요청
Attack_Monster_UI ..> 전투 : 몬스터 공격 요청
전투 ..> 플레이어 : 플레이어체크 검증
전투 ..> 캐릭터 : 캐릭터 객체 제어
