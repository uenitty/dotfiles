#!/bin/sh

#
# システム設定
#

## メニューバー 時計
defaults write "com.apple.menuextra.clock" "DateFormat" -string "M月d日(EEE)  H:mm:ss"
defaults write "com.apple.menuextra.clock" "ShowSeconds" -bool True

## Mission Control 最新の使用状況に基づいて操作スペースを並び替える
defaults write "com.apple.dock" "mru-spaces" -bool False

## メニューバーに Time Machine を表示
# defaults write com.apple.systemuiserver menuExtras -array-add "/System/Library/CoreServices/Menu Extras/TimeMachine.menu"
# defaults write "com.apple.systemuiserver" "NSStatusItem Visible com.apple.menuextra.TimeMachine" -bool True
# killall SystemUIServer

## バッテリーの割合（%）を表示
# defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist BatteryShowPercentage -bool True

#
# Finder
#

## 新規Finderウィンドウで次を表示
# defaults write "com.apple.finder" "NewWindowTarget" -string "PfHm"
# defaults write "com.apple.finder" "NewWindowTargetPath" -string "file:///Users/ueni/"

## すべてのファイル名拡張子を表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool True
