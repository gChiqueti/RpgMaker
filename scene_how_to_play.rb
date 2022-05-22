# ------------------------------------------------
# Created by GRChiqueti / Criado por GRChiqueti
# Free for commercial and non-commercial use / Livre para uso comercial e não-comercial
# Credit not needed, but much appreciated / Não precisa dar créditos, mas se quiser pode =)
# ------------------------------------------------
# Insert this script above of others that change the title / Coloque esse script acima de outros que alteram a tela de título
# ------------------------------------------------

# Configurações
module HowToPlayConfig
  TITLE = 'Como jogar'
  HELP_WINDOW_WIDTH = 275
  HELP_WINDOW_HEIGHT = 150
  HELP_WINDOW_TEXT =
    "\\C[3]←↑→↓\\C[0] para andar\n" +
    "\\C[3]Espaço\\C[0] para interagir\n" +
    "\\C[3]X\\C[0] para Menu/Cancelar\n" +
    "\\C[3]Alt+Shift\\C[0] para tela cheia\n" +
    "\\C[3]Shift\\C[0] para correr"
end

#==============================================================================
# Não editável a partir daqui
#==============================================================================
class Scene_HowToPlay < Scene_MenuBase
  include HowToPlayConfig
 
  def start
    super
    create_debug_help_window
  end
 
  def update
    super
    SceneManager.call(Scene_Title) if Input.press?(:B)
  end

  def create_debug_help_window
    ww = HELP_WINDOW_WIDTH
    wh = HELP_WINDOW_HEIGHT   
    wx = Graphics.width/2 - ww/2
    wy = Graphics.height/2 - wh/2
    @debug_help_window = Window_Base.new(wx, wy, ww, wh)
    @debug_help_window.draw_text_ex(0, 0, HELP_WINDOW_TEXT)   
  end
end

class Window_TitleCommand < Window_Command
  def make_command_list
    add_command(Vocab::new_game, :new_game)
    add_command(Vocab::continue, :continue, continue_enabled)
    add_command(HowToPlayConfig::TITLE, :howtplay)
    add_command(Vocab::shutdown, :shutdown)
  end
end

class Scene_Title < Scene_Base
  alias sh_create_command_window create_command_window

  def create_command_window
    sh_create_command_window
    @command_window.set_handler(:howtplay, method(:command_howtplay))
  end
 
  def command_howtplay
    close_command_window
    SceneManager.call(Scene_HowToPlay)
  end
end
