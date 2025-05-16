#!/bin/bash
SCREEN_NAME='minecraft-25560'
VERSION=1.21.4
SFW_DIR=/opt/sfw
MINECRAFT_JAR=${SFW_DIR}/minecraft/minecraft_server.${VERSION}.jar
JAVA=${SFW_DIR}/graalvm/bin/java
MEM=12288M
DIR=${SFW_DIR}/mc

save-all() {
  /usr/bin/screen -x -S "$SCREEN_NAME" -p 0 -X stuff "save-all\n"
}

save-off(){
  /usr/bin/screen -x -S "$SCREEN_NAME" -p 0 -X stuff "save-off\n"
}

save-on(){
  /usr/bin/screen -x -S "$SCREEN_NAME" -p 0 -X stuff "save-on\n"
}

world_owner_change() {
  cd ${DIR}
  sudo chown -Rv minecraft:minecraft ${DIR}/world
  touch ${DIR}/minecraft.log
}

start() {
  cd ${DIR}
  /usr/bin/screen -DmS "$SCREEN_NAME" \
  ${JAVA} -Xmx${MEM} -Xms${MEM} -XX:+UseG1GC -server -jar ${MINECRAFT_JAR} nogui
}

stop() {
  /usr/bin/screen -x -S "$SCREEN_NAME" -p 0 -X stuff "stop\n"
}

case $1 in
    save-all)
        save-all
        ;;
    save-on)
        save-on
        ;;
    save-off)
        save-off
        ;;
    start)
        world_owner_change
        start
        ;;
    stop)
        screen -x -S "$SCREEN_NAME" -p 0 -X stuff "say お知らせ: 30秒後にサーバーを停止します\n"
        save-all
        sleep 30
        stop
        ;;
    restart)
        screen -x -S "$SCREEN_NAME" -p 0 -X stuff "say お知らせ: 30秒後にサーバーを再起動します\n"
        sleep 30
        stop
        start
      ;;
    *)
        echo "start | stop | restart | save-all | save-on | save-off"
esac
