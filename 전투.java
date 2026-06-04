package game;

import java.util.HashMap;
import java.util.Map;

public class 전투 {
    private 플레이어 플레이어검증기 = new 플레이어();
    private static Map<String, 캐릭터> 캐릭터저장소 = new HashMap<>();
    private static Map<String, 길드> 길드저장소 = new HashMap<>();

    static {
        // v2.0 제약: 이미 외부 어딘가에서 만들어진 길드 객체 배치
        길드저장소.put("아발론", new 길드("아발론"));
    }

    // [v1.0 기능 + v2.0 연동 완료]
    public String 캐릭터생성(String 플레이어id, String 캐릭터명, String 직업, int 레벨) {
        // 교정: 플레이어check 메서드명 동기화
        if (!플레이어검증기.플레이어check(플레이어id)) {
            return "플레이어체크 실패";
        }
        
        캐릭터 새로운캐릭터;
        if ("전사".equals(직업)) {
            새로운캐릭터 = new 전사(플레이어id, 캐릭터명, 레벨); 
        } else {
            새로운캐릭터 = new 마법사(플레이어id, 캐릭터명, 레벨); 
        }
        캐릭터저장소.put(플레이어id, 새로운캐릭터);
        return "캐릭터 생성 완료";
    }

    // [v1.0 기능 완전 복원]
    public String 몬스터공격(String 플레이어id, String 캐릭터명, String 몬스터명, int 몬스터체력) {
        캐릭터 캐릭터객체 = 캐릭터저장소.get(플레이어id);
        if (캐릭터객체 == null) {
            return "캐릭터가 없습니다.";
        }
        
        double 데미지 = 캐릭터객체.스킬발동(); // 다형성 동적 바인딩
        
        String 공격등급;
        if (데미지 >= 20.0) {
            공격등급 = "S급 공격";
        } else if (데미지 >= 15.0) {
            공격등급 = "A급 공격";
        } else {
            공격등급 = "B급 공격";
        }
        
        return 캐릭터명 + "가 " + 몬스터명 + "을 공격하여 " + 데미지 + " 데미지를 입혔습니다. [" + 공격등급 + "]";
    }

    // [v2.0 신규 기능 1]
    public String 아이템획득(String 플레이어id, String 아이템명, String 아이템타입, int 아이템가치) {
        if (!플레이어검증기.플레이어check(플레이어id)) {
            return "플레이어체크 실패";
        }
        
        캐릭터 캐릭터객체 = 캐릭터저장소.get(플레이어id);
        if (캐릭터객체 == null) {
            return "캐릭터가 존재하지 않습니다.";
        }

        인벤토리 인벤토리객체 = 캐릭터객체.get인벤토리();
        // 교정: 최종 확정된 인벤토리 메서드명 바인딩
        if (인벤토리객체.get아이템개수() >= 10) {
            return "인벤토리 가득 참";
        }

        String 등급;
        if (아이템가치 >= 1000) 등급 = "전설";
        else if (아이템가치 >= 500) 등급 = "희귀";
        else 등급 = "일반";

        // Composition 규칙에 의거해 컨트롤러 레이어에서 인스턴스를 소유 및 할당
        아이템 새로운아이템 = new 아이템(아이템명, 아이템타입, 아이템가치, 등급);
        인벤토리객체.아이템추가(새로운아이템);

        return "아이템 획득 완료 [등급: " + 등급 + "]";
    }

    // [v2.0 신규 기능 2 - 교수님 제약조건 버전]
    public String 길드가입(String 플레이어id, String 길드명) {
        if (!플레이어검증기.플레이어check(플레이어id)) {
            return "플레이어체크 실패";
        }

        길드 길드객체 = 길드저장소.get(길드명);
        if (길드객체 == null) {
            return "존재하지 않는 길드입니다.";
        }

        캐릭터 캐릭터객체 = 캐릭터저장소.get(플레이어id);
        if (캐릭터객체 == null) {
            return "가입할 캐릭터가 없습니다.";
        }

        // 핵심: 전투 클래스는 정원 초과 검증을 직접 하지 않고 길드에 위임하여 의존성을 파괴함
        boolean 결과 = 길드객체.캐릭터가입(캐릭터객체); 
        return 결과 ? "길드 가입 완료" : "길드 정원 초과";
    }
}