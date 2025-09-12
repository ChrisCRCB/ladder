@echo off
flutter build web --release --base-href="/ladder/" & scp -Cr build\web chris@backstreets.site:ladder