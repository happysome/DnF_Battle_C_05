package game;

public class 전투 {

    // 행위 1: 캐릭터생성 (반환타입: 캐릭터 추상클래스)
    public 캐릭터 캐릭터생성(String 플레이어id, String 캐릭터명, String 직업, int 레벨) throws Exception {
        // 1. 반드시 플레이어 체크를 수행 (SD 흐름 반영)
        플레이어 플레이어객체 = new 플레이어();
        if (!플레이어객체.플레이어체크(플레이어id)) {
            throw new Exception("플레이어체크 실패: 유효하지 않은 플레이어 ID입니다.");
        }

        // 2. 직업에 따라 다형성을 활용하여 하위 객체 생성 후 반환
        if ("전사".equals(직업)) {
            return new 전사(캐릭터명, 레벨);
        } else if ("마법사".equals(직업)) {
            return new 마법사(캐릭터명, 레벨);
        } else {
            throw new Exception("존재하지 않는 직업입니다.");
        }
    }

    // 행위 2: 몬스터공격 (반환타입: String으로 등급 리턴)
    public String 몬스터공격(String 플레이어id, 캐릭터 캐릭터객체) throws Exception {
        // 1. 반드시 플레이어 체크를 수행 (SD 흐름 반영)
        플레이어 플레이어객체 = new 플레이어();
        if (!플레이어객체.플레이어체크(플레이어id)) {
            throw new Exception("플레이어체크 실패: 유효하지 않은 플레이어 ID입니다.");
        }

        if (캐릭터객체 == null) {
            throw new Exception("공격할 캐릭터가 존재하지 않습니다.");
        }

        // 2. 다형성에 기반한 스킬 발동 및 데미지 계산
        double 데미지 = 캐릭터객체.스킬발동();

        // 3. 요구사항에 따른 데미지 등급 부여 및 반환
        // s급 공격: 데미지 200이상 / a급 공격: 데미지 100이상 / b급 공격: 데미지 100 미만
        if (데미지 >= 200) {
            return "S급 공격 (데미지: " + 데미지 + ")";
        } else if (데미지 >= 100) {
            return "A급 공격 (데미지: " + 데미지 + ")";
        } else {
            return "B급 공격 (데미지: " + 데미지 + ")";
        }
    }
}