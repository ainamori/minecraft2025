#!/bin/bash
SCREEN_NAME='minecraft-25560'
BACKUP_DIR=/opt/sfw/mc
DATE=`date "+%Y-%m-%d %H:%M"`

save-off(){
  /usr/bin/screen -x -S "$SCREEN_NAME" -p 0 -X stuff "save-off\n"
}

save-on(){
  /usr/bin/screen -x -S "$SCREEN_NAME" -p 0 -X stuff "save-on\n"
}

save-all() {
  /usr/bin/screen -x -S "$SCREEN_NAME" -p 0 -X stuff "save-all\n"
}

git-commit(){
  git add .
  git commit -am "systemd.timer backup: ${DATE}"
}

git-push (){
  git push
  git gc
}

cd ${BACKUP_DIR}

case $1 in
    start)
        screen -x -S "$SCREEN_NAME" -p 0 -X stuff "say お知らせ: バックアップ取得開始\n"
        save-all
        save-off
        git-commit
        git-push
        save-on
        screen -x -S "$SCREEN_NAME" -p 0 -X stuff "say お知らせ: バックアップ完了\n"
        ;;
    *)
        echo "start"
esac
