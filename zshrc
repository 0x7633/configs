# If you come from bash you might have to change your $PATH.
  export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/$USER/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="af-magic"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to change how often to auto-update (in days).
  export UPDATE_ZSH_DAYS=30

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  encode64
)

# Plugins that significantly slow down zsh:
#  zsh-autosuggestions
#  zsh-syntax-highlighting
#  ZSH_HIGHLIGHT_MAXLENGTH=100          # zsh-syntax-highlighting
#  ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


  alias cddl='cd ~/Загрузки'
  alias cdvd='cd ~/Видео'
  alias cddo='cd ~/Документы'
  alias cdmz='cd ~/Музыка'
  alias cddr='cd ~/Прочее'
  alias cdiz='cd ~/Изображения'
  alias cl='clear'
  alias wg='wget -c -t 0 -T 60'
  alias wg.cd='wget -c -t 0 -T 60 --content-disposition'
  alias wgs="wget --spider"
  alias vizsh='vi ~/.zshrc'
  alias -g L='| less'
  alias y='youtube-dl -c --socket-timeout 60 --no-part -o "%(title)s.%(ext)s" --merge-output-format mkv --no-playlist' 
  alias hist='history | less'
  alias testdisk='sudo testdisk'
  alias photorec='sudo photorec'
  alias u.server='fusermount -u /media/server'
  alias swap.clear='sudo swapoff -a && sleep 3 && sudo swapon -a'
  alias aria2c="aria2c --summary-interval=0"
  alias sync.time="sudo systemctl stop ntpd && sudo ntpdate pool.ntp.org && sudo systemctl start ntpd && sudo ntpdate -q pool.ntp.org"
  alias -g N='2>/dev/null'
  alias -g NN='>/dev/null 2>&1'
  alias a2="aria2c -c -j 10"
  alias find.files.sort="find . -maxdepth 1 \( -type l -o -type f \) | sort | awk -F '/' '{print \$NF}'"

# cdpath=(	 )

# PROMPTS
export PROMPT='$FG[237]${(l.COLUMNS..-.)}%{$reset_color%}
$FG[032]%(3~|../%2d|%~)\
$(git_prompt_info)$(hg_prompt_info) \
$FG[105]%(!.#.»)%{$reset_color%} '
export RPROMPT='$FG[032]%~ [%T]%{$reset_color%}'

# export PROMPT='[]'
#
# %n - Имя пользователя
# %m - Имя компьютера (до первой точки)
# %M - Полное имя компьютера
# %~ - Путь к текущему каталогу относительно домашнего
# %d - Полный путь к текущей директории ($PWD)
# %T - Время в формате HH:MM
# %* - Время в формате HH:MM:SS
# %D - Дата в формате YY-MM-DD
# %B, %b - Начало и конец выделения жирным
# %U, %u - Начало и конец подчеркивания
# %(3~|../%2d|%~) - Приглашение с двумя ближайшими каталогами [is.gd/MYaTEK]

# Файл истории
  HISTFILE=~/.zsh_history
# Число команд, сохраняемых в файл истории
  HISTSIZE=10000
# Число команд, сохраняемых в сеансе
  SAVEHIST=10000
# Дописывание файла истории
  setopt  APPEND_HISTORY
# Игнорировать повторения команд
  setopt  HIST_IGNORE_ALL_DUPS
# Игнорировать лишние пробелы
  setopt  HIST_IGNORE_SPACE
# Удалять пустые строки
  setopt  HIST_REDUCE_BLANKS
# Не пищим при дополнении и ошибках
  setopt NO_BEEP
# Перейти в директорию, если набрали путь без команды cd
  setopt AUTO_CD
# Исправлять неверно набраные команды
#  setopt CORRECT_ALL
# Добавлять в историю время выполнения команды  
#  setopt extended_history
# Не добавлять в историю время выполнения команды
  unsetopt extendedhistory
# "Уравнивать в правах" верхний и нижний регистры
  zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


# ФУНКЦИИ

# Распаковка архива
  ex(){
   if [ -f $1 ] ; then
     case $1 in
       *.tar.bz2) tar xvjf $1   ;;
       *.tar.gz)  tar xvzf $1   ;;
       *.tar.xz)  tar xvfJ $1   ;;
       *.bz2)     bunzip2 $1    ;;
       *.rar)     unrar x $1    ;;
       *.gz)      gunzip $1     ;;
       *.tar)     tar xvf $1    ;;
       *.tbz2)    tar xvjf $1   ;;
       *.tgz)     tar xvzf $1   ;;
       *.zip)     unzip $1      ;;
       *.Z)       uncompress $1 ;;
       *.7z)      7z x $1       ;;
       *)         echo "'$1' Не может быть распакован при помощи >ex<" ;;
     esac
   else
     echo "'$1' не является допустимым файлом"
   fi
  }
  
# Упаковка в архив
  pk(){
   if [ $1 ] ; then
     case $1 in
       tbz)       tar cjvf $2.tar.bz2 $2      ;;
       tgz)       tar czvf $2.tar.gz  $2       ;;
       tar)      tar cpvf $2.tar  $2       ;;
       bz2)    bzip $2 ;;
       gz)        gzip -c -9 -n $2 > $2.gz ;;
       zip)       zip -r $2.zip $2   ;;
       7z)        7z a $2.7z $2    ;;
       *)         echo "'$1' не может быть упакован с помощью pk()" ;;
     esac
   else
     echo "'$1' не является допустимым файлом"
   fi
  }

# Создать директорию и перейти в нее 
  mkcd(){ mkdir $1 && cd $1 }

# Создать qrcode и показать
  qr(){ qrencode -o - $1 | display }

# Создание паролей

  mkpasswdgpgr(){ 
   for ((i=1; i<=$1; i++)) ; do
    gpg --gen-random -armor 1 $2 | head -c $2 ; echo
   done
  }

  mkpasswdr(){ 
   for ((i=1; i<=$1; i++)) ; do
    < /dev/urandom tr -dc 'A-Za-z0-9!@#_$%&?*()' | head -c $2; echo 
   done
  }

  mkpasswdb64(){ 
   for ((i=1; i<=$1; i++)) ; do
     < /dev/urandom tr -dc 'A-Z-a-z-0-9!@#_$%^&*()' | head -c $2 | base64 | head -c $2 ; echo
   done
  }

# Создание случайных имен для файлов

  genRandomName(){
    for ((i=1; i<=$1; i++)) ; do
      < /dev/urandom tr -dc 'a-z0-9' | head -c $2 ; echo
    done
  }

# Удалить запись из истории команд в zsh
  rm_from_history(){
    if LC_ALL=C sed -i "/$1/d" $HISTFILE
    then
      echo "Удалено"
    else 
      echo "При удалении произошла ошибка"
    fi
  }

# ping
  ping_ya(){ ping -c $1 ya.ru } 

# Сравнение контрольных сумм
  compare_checksums(){
    [[ $1 == $2 ]] && echo "Суммы одинаковые" || echo "Суммы различаются"
  }

# Погода
  weather(){
    if [ -z $1 ]
    then
        curl https://ru.wttr.in/
    elif [ $1 = --help ] || [ $1 = help ] || [ $1 = -h ]
    then
        curl https://ru.wttr.in/:help
    else
        curl https://ru.wttr.in/$1
    fi
  }
