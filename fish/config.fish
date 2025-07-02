if status is-interactive
    # Commands to run in interactive sessions can go here
end

# set -Ux PATH ~/Android/Sdk/emulator $PATH
# fish_add_path -g -p ~/development/flutter/bin

set -x ANDROID_HOME $HOME/Android/Sdk

fish_add_path $ANDROID_HOME/emulator $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools

set -gx PATH /home/ducchinh/development/flutter/bin $PATH

set -x GEMINI_API_KEY ""

set -x GTK_IM_MODULE fcitx
set -x QT_IM_MODULE fcitx
set -x XMODIFIERS @im=fcitx

set -gx PATH $PATH /home/ducchinh/.dotnet/tools
set -gx PATH /usr/bin $PATH

starship init fish | source

# set -gx DOTNET_ROOT $HOME/dotnet
# set -gx PATH $PATH:$HOME/dotnet
