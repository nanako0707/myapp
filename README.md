# README

# オペリマインダー

## 概要
全診療科目の手術手順書がこのアプリで管理できます。手順の編集、作成に特化したサービスです。
手順編集の完了時には全ての登録ユーザーにメールで通知されるようになっているため、
手順の変更に気づかないという事態を防いでくれます。
手順にはコメントを入れることができます。

## コンセプト
膨大な手順書をこのアプリ一つで管理、
手術手順変更の伝達漏れなく、
パソコン・スマホで確認

## バージョン
Ruby 2.6.5
Rails 5.2.4

## 機能一覧
- [ ] ログイン機能
- [ ] ユーザー登録機能
  - [ ] メールアドレス、名前、パスワードは必須
- [ ] ユーザー編集機能
- [ ] 手術手順一覧表示機能
  - [ ] コメント数を表示
- [ ] 手術手順作成機能
  - [ ] 手術名、手順、作成日は必須
- [ ] 手術手順編集機能
  - [ ] 手順一覧、作成、編集はログインしているユーザーのみ実行可能
  - [ ] 編集者の名前、編集日、ステータス(変更あり・なし・編集中)は必須
- [ ] 手術手順削除機能
  - [ ] 手順の削除は管理者のみ実行可能
- [ ] 手順のストック機能
  - [ ] 手順のストックについては、1つの手順に対して一人一回しかできない
- [ ] コメント機能とストック機能については、ページ遷移なしで実行できる
- [ ] メール機能
  - [ ] 手順作成・編集完了時、ユーザー全員にメールで通知される
- [ ] 検索機能
  - [ ] 診療科目・手術名のキーワード(あいまい)検索、ステータスそれぞれの検索、または絞り込み検索が可能
- [ ] コメント機能
  - [ ] 手術手順に対し、コメントをすることが可能
- [ ] 手順一覧ソート機能
  - [ ] 手順を診療科目ごと、またはあいうえお順に表示することができます
- [ ] バッチ処理
  - [ ] 変更した手順を確認していないユーザーに対し、定期的(1日ごと)に通知を行う  


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
* Whenever
* rails_admin
* cancancan

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
- [ ] Operation procedure list display function
  - [ ] Show the number of comments
- [ ] Operation procedure creation function
  - [ ] Required surgery name, procedure, creation date
- [ ] Surgical procedure editing function
  - [ ] Procedure list, creation, and editing can be executed only by the logged-in user.
  - [ ] Editor's name, edit date, status (changed/not modified/editing) required
- [ ] Function to delete surgical procedure
  - [ ] Procedure can be deleted only by administrator
- [ ] Procedure Stock Function
  - [ ] Regarding the stock of procedures, it can be done only once for each procedure
- [ ] About comment function and stock function can be executed without page transition
- [ ] Email function
  - [ ] When the procedure creation/editing is completed, all users are notified by email.
- [ ] Search function
  - [ ] Keyword (fuzzy) search for medical department/surgery name, search for each status, or narrowed search
- [ ] Comment function
  - [ ] It is possible to comment on the surgical procedure
- [ ] Procedure list sort function
  - [ ] Procedures can be displayed for each medical department or in order of AIUEO
- [ ] Batch processing
  - [ ] Periodically (daily) notify users who have not confirmed the changed procedure.

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
* Whenever
* rails_admin
* cancancan
