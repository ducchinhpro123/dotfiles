if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Set PATH
set -gx PATH $PATH ~/bin
set -x PATH $HOME/.local/bin $PATH
set -x PATH $HOME/development/flutter/bin $PATH
#set -x JAVA_HOME /usr/lib/jvm/java-22-openjdk
#set -x PATH $JAVA_HOME/bin $PATH
set -x CHROME_EXECUTABLE /usr/bin/chromium
set -x Qt6_DIR /usr/bin/qmake6

set -x ANDROID_SDK_ROOT /home/duchinh/Android/Sdk
#set -x ANDROID_SDK_ROOT /opt/android-sdk
set -x PATH $PATH $ANDROID_SDK_ROOT/cmdline-tools/latest/bin/
set -x PATH $PATH $ANDROID_SDK_ROOT/platform-tools/
set -x PATH $PATH $ANDROID_SDK_ROOT/tools/bin/
set -x PATH $PATH $ANDROID_SDK_ROOT/emulator
set -x PATH $PATH $ANDROID_SDK_ROOT/tools/

set -x ANDROID_AVD_HOME $HOME/.android/avd
set -x ANDROID_SDK_HOME $HOME/Android/Sdk


set -x QTWEBENGINE_DISABLE_SANDBOX 1

set -x TERM xterm-256color

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
