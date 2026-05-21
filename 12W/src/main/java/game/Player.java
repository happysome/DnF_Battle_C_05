package game;

public class Player {
    private String playerId;

    public Player(String playerId) {
        this.playerId = playerId;
    }

    public boolean checkPlayer() {
        return "hero".equals(playerId);
    }

    public String getPlayerId() {
        return playerId;
    }
}