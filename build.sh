#!/bin/zsh
set -euo pipefail
cd "${0:A:h}"
mkdir -p 'Pocket Player.app/Contents/Resources' 'Pocket Player.app/Contents/MacOS' work/swift-cache
swiftc Source/*.swift -o 'Pocket Player.app/Contents/MacOS/PocketPlayer' -framework Cocoa -framework SceneKit -O -target arm64-apple-macosx14.0 -module-cache-path "$PWD/work/swift-cache"
cp Info.plist 'Pocket Player.app/Contents/Info.plist'
codesign --force --sign - 'Pocket Player.app'
