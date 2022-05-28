# ------------------------------------------------
# Created by GRChiqueti 
# Free for commercial and non-commercial use
# Credit not needed, but much appreciated
# ------------------------------------------------
# Criado por GRChiqueti
# Livre para uso comercial e não-comercial
# Não precisa dar créditos, mas se quiser pode =)
# ------------------------------------------------

# ------------------------------------------------
# Script goal
# ------------------------------------------------
# Do not display the game title, optimizing game testing
# ------------------------------------------------
# Pula a tela de título, Tornando o teste do jogo mais rápido
class Scene_Title < Scene_Base
  def start
    DataManager.setup_new_game
    $game_map.autoplay
    SceneManager.goto(Scene_Map)
  end

  def transition_speed; 1; end
  def terminate; end
end
