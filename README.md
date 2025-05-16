# minecraft server for srad

## 概要

- srad民の為のminecraft server

## 動作環境

- サーバURL
  - minecraft.justplayer.com:25560

## 利用上の注意点

- スポーンエリア付近を開発させすぎない
  - 新規参入者が常に楽しめるよう、散策に必要な最低限の物のみ置くことにしてください

## 運用ポリシー

- 不定期にチャンクリセットを行い、再探索を可能にしています
  - 予め残すエリアを指定してください
    - 残すエリアの記載先は**remain_area.txt** にチャンク単位で記載する

## バックアップポリシー

- systemd.timer weekly にてバックアップを行っています


### バックアップ参考メモ

- https://mc.server-memo.net/mc_backup/#google_vignette