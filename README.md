# README

# オペリマインダー

## 概要
全診療科目の手術手順書がこのアプリで管理できます。手順の作成・編集に特化したサービスです。
手順作成・編集の完了時には全ての登録ユーザーにメールで通知されるようになっているため、
手順の変更に気づかないという事態を防いでくれます。
さらに、毎週月曜日に未読の手順の通知メールが届くようになっています。

## コンセプト
膨大な手順書をこのアプリ一つで管理、
手術手順変更の伝達漏れなく、
パソコン・スマホで確認

## バージョン
Ruby 2.6.5
Rails 5.2.4

## 開発環境
- Docker/docker-compose

### Docker環境構築

- Docker for Macのインストール<br>
[公式サイト](https://docs.docker.com/docker-for-mac/install/)からDocker for Macをダウンロードしてインストールします

- 公式チュートリアルに沿って各種ファイル設定<br>
[公式チュートリアル](https://docs.docker.com/compose/rails/)

- Dockerイメージ作成<br>
Dockerfileを元にDockerイメージを作成します

```console
docker-compose build
```

- Railsデータベース作成

```console
docker-compose run web rake db:create
```

- サーバー起動(background)

```console
docker-compose up -d
```

## 機能一覧
- [ ] ログイン機能
- [ ] ユーザー登録機能
  - [ ] メールアドレス、名前、パスワードは必須
- [ ] ユーザー編集機能
- [ ] 管理者権限
  - [ ] 手順の削除は管理者のみ行える
  - [ ] ユーザー作成・編集・削除操作ができる
- [ ] 手術手順一覧表示機能
  - [ ] コメント数を表示
- [ ] 手術手順作成機能
  - [ ] 手術名、診療科目、手順は必須
  - [ ] 手順をMarkdown形式で投稿できる
- [ ] 手術手順編集機能
  - [ ] 手順一覧、作成、編集はログインしているユーザーのみ実行可能
- [ ] 手術手順削除機能
  - [ ] 手順の削除は管理者のみ実行可能
- [ ] カード決済機能
  - [ ] 定期課金(毎月27日に1000円の課金)することで、プレミアム会員登録できます。手順投稿・編集機能を使用できるようになります
- [ ] 手順のストック機能
  - [ ] 手順のストックについては、1つの手順に対して一人一回しかできない
- [ ] コメント機能とストック機能については、ページ遷移なしで実行できる
- [ ] 通知機能
  - [ ] コメント・手順作成・編集完了時、ユーザー全員にメールで通知される
- [ ] 検索機能
  - [ ] 診療科目・手術名のキーワード(あいまい)検索、ステータスそれぞれの検索、または絞り込み検索が可能
- [ ] コメント機能
  - [ ] 手術手順に対し、コメントをすることが可能
- [ ] バッチ処理
  - [ ] 変更した手順を確認していないユーザーに対し、定期的(毎週月曜日の8時)に通知を行う
- [ ] 通知機能
  - [ ] 自分が投稿した手順に対してコメント、ストックされた際に、画面上に通知される
  - [ ] 手順作成・変更、コメント時、全てのユーザーにメールで通知してくれます


## カタログ設計
https://docs.google.com/spreadsheets/d/e/2PACX-1vQBI5Za3X0_-KUGobWm3zLDX5_i1uQdEStIWrtyo4_UDet2LuzlMq6k_-4AZioMtwCug5dYjDX6eyK6/pubhtml

## テーブル定義
https://drive.google.com/file/d/1H3KF6zrtA_d-Egm5bkev9cgEvMHuMjJz/view?usp=sharing
https://docs.google.com/spreadsheets/d/e/2PACX-1vT1_1mGH9dUf9rKI4p68s2yTcXMCfEFjQKGYKYuT6mGMUoYpFvt9ofLTavSp3UIO54UlAHjyi2O-jPX/pubhtml

## 画面遷移図
https://drive.google.com/file/d/18d_ihz5n2UbFtnKEcaWiS5jpsFSgmmOX/view?usp=sharing

## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1gQun0BDy7NJJVVRwy-uO-mRCNIHExe1EzMaiNG7OSlE/edit?usp=sharing

## 使用予定Gem
* CarrierWave
* mini_magick
* devise
* rails_admin
* cancancan
* Kaminari
* faker
* redcarpet
* coderay
* payjp
* fog-aws


# English Ver

# README

# operationreminder

## Overview
You can manage surgical procedures for all medical treatments with this app. It is a service that specializes in editing and creating procedures.
When the procedure is edited, all registered users will be notified by email.
It prevents you from noticing the change in procedure.
You can include comments in the procedure.

## Concept
Manage a huge number of procedures with this one app,
Without omission of transmission of surgical procedure changes,
Check on a PC or smartphone

## Version
Ruby 2.6.5
Rails 5.2.4

## Functions list
- [ ] Login function
- [ ] User registration function
  - [ ] Email address, name, password required
- [ ] User edit function
- [ ] Administrator privileges
  - [ ] Procedure can be deleted only by administrator
  - [ ] Can create/edit/delete users
- [ ] Surgical procedure list display function
  - [ ] Show the number of comments
- [ ] Operation procedure creation function
  - [ ] Surgery name, medical department, procedure required
  - [ ] You can post instructions in Markdown format
- [ ] Surgical procedure editing function
  - [ ] Procedure list, creation, and editing can be executed only by the logged-in user.
- [ ] Operation procedure deletion function
  - [ ] Procedure can be deleted only by administrator
- [ ] Card payment function
  - [ ] You can register as a premium member by paying a fixed fee (1000 yen charge on the   27th of every month). You will be able to use the procedure posting / editing function
- [ ] Procedure stock function
  - [ ] Regarding the stock of procedures, you can only do this once per procedure
- [ ] Comment function and stock function can be executed without page transition
- [ ] Notification function
  - [ ] Upon completion of comment/procedure creation/edit, all users will be notified by   email
- [ ] Search function
  - [ ] Keyword (fuzzy) search for medical department/surgery name, search for each status,   or narrowed search
- [ ] Comment function
  - [ ] It is possible to comment on the surgical procedure
- [ ] Batch processing
  - [ ] Periodically (every Monday at 8:00) notify users who have not confirmed the changed procedure.
- [ ] Notification function
  - [ ] You will be notified on the screen when you comment or stock the procedure you posted.
  - [ ] When creating/changing a procedure or commenting, all users will be notified by email.

## Catalog design,Table_Definition,Screen transition diagram,,Wire frame
* https://docs.google.com/spreadsheets/d/e/2PACX-1vQBI5Za3X0_-KUGobWm3zLDX5_i1uQdEStIWrtyo4_UDet2LuzlMq6k_-4AZioMtwCug5dYjDX6eyK6/pubhtml
* https://drive.google.com/file/d/1H3KF6zrtA_d-Egm5bkev9cgEvMHuMjJz/view?usp=sharing
* https://docs.google.com/spreadsheets/d/e/2PACX-1vT1_1mGH9dUf9rKI4p68s2yTcXMCfEFjQKGYKYuT6mGMUoYpFvt9ofLTavSp3UIO54UlAHjyi2O-jPX/pubhtml
* https://drive.google.com/file/d/18d_ihz5n2UbFtnKEcaWiS5jpsFSgmmOX/view?usp=sharing
* https://docs.google.com/spreadsheets/d/1gQun0BDy7NJJVVRwy-uO-mRCNIHExe1EzMaiNG7OSlE/edit?usp=sharing

## To be used Gem
* CarrierWave
* mini_magick
* devise
* rails_admin
* cancancan
* Kaminari
* faker
* redcarpet
* coderay
* payjp
* fog-aws
