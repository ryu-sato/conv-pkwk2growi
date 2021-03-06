# conv-pkwk2growi

Pukiwiki データを Growi へ登録するための移行ツールです。

# 前提

- スクリプト実行時に Growi が起動された状態となっていること
- Pukiwiki のデータファイルと異なるファイルシステム上でスクリプトを実行する場合は、予めファイルシステムにアクセス可能にするか、tar 等で移動させること
    - 必要なファイルは Pukiwiki ディレクトリの TOP 配下にある `wiki` ディレクトリ内の全ファイルである
- Ruby Script と gem を使っているため Ruby 及び Bundle を予めインストールすること

# 使い方

## 実行環境準備

1. リポジトリをクローンする
    `git clone https://github.com/ryu-sato/conv-pkwk2growi.git`
1. `config/env.sh` の User Config 箇所を適宜設定する
1. `config/settings.yml` を作成して Growi(Crowi) の API_TOKEN と URL を設定する
1. Gem ファイルをインストールする
    `bundle install`

## コンバート方法

1. Pukiwiki データをディレクトリへ dump する (`dump-pkwk.sh`)
1. dump したファイルを Markdown 形式へ変更(`conv-pkwk2md.sh`)
1. Growi(Crowi) へ dump したファイルをアップロードする(`create-crowi-page.sh`)

```sh:bash
bash dump-pkwk.sh
bash conv-pkwk2md.sh
bash create-crowi-page.sh
```

# dependencies

## you must install manually

- Shell Command
  - nkf
  - sed
- apt packages
  - jq

## you can install with bundle install

- Ruby Gems
  - crowi-client

## external service

- [pukiwiki2markdown](https://pukiwiki2markdown.saino.me/) (default use, but optional use)


# Known Issue

- [ ] 一部 Growi へアップロードできない Pukiwiki ページがある
    - `/FrontPage`, `InterWikiName`

# TODO

- [ ] Pukiwiki の添付ファイル移行
