package game;

import java.util.ArrayList;
import java.util.List;

public class 인벤토리 {
    // CD 표기법: List~아이템~ 매핑
    private List<아이템> 아이템리스트;
    private int 최대용량;

    public 인벤토리() {
        this.아이템리스트 = new ArrayList<>();
        this.최대용량 = 10; // 요구사항: 최대 용량 10칸
    }

    public boolean 아이템추가(아이템 아이템객체) {
        // 인벤토리가 가득 차면(10개) 추가 실패 반환
        if (아이템리스트.size() >= 최대용량) {
            return false;
        }
        return 아이템리스트.add(아이템객체);
    }

    // CD 및 SD 연동을 위한 아이템 개수 반환 행위
    public int get아이템개수() {
        return 아이템리스트.size();
    }

    public List<아이템> get아이템리스트() {
        return 아이템리스트;
    }

    public void set최대용량(int 최대용량) {
        this.최대용량 = 최대용량;
    }
}