# アプリケーション名

Bolty

# 概要

ボルダリングにおける能力をレーダーチャートで表示し、管理するアプリケーションです。<br>
ユーザーは登れた課題のチェックを行い、その結果より能力値が表示される。<br>
ジム経営者はジムの登録から課題の登録までを行うことができる。

# 本番環境

## URL

[デプロイ先](https://bouldering-ability.herokuapp.com)

## テスト用アカウント

### ユーザー用

- メールアドレス：test@test.com
- パスワード：test1234

### ジム経営者用

- メールアドレス：bolty2022@test.com
- パスワード：bolty2022

## 利用方法

### ユーザー
新規登録、ログイン後、Pick up Gymsより対象ジムの課題に挑戦するボタンを押す、課題帳ページに遷移し、<br>
作成されている課題帳を開くと課題が表示されているのでそれぞれ登れた回数ごとにチェックする。<br>
チェック後マイページに遷移すると結果に応じたチャート、スコアが表示されている。

### ジム経営者
アカウントがない場合はパートナー登録申込ページから登録情報を入力し送信。
アカウントが作成されたら完了メールが届きます。
ログイン後、ジム情報、課題帳、課題の登録を行います。

### Githubリポジトリ

[Github](https://github.com/kazukiwada01/bolty)

# 制作背景

自分自身の能力を可視化することにより、得意、不得意が明確になり、<br>
伸ばすべきポイントや改善点を見つけることで、上達の助けとなります。
また、ボルダリングのコンペ(大会)のクラス分けは自己申告性であるため、<br>
参加者のグレード感のバラツキが問題となっています。<br>
そのため、クラス分け機能を実装し、共通の基準になればと考えました。

# 要件定義

[要件定義](https://docs.google.com/spreadsheets/d/1WNdG3qPRo6qa_-K8jCtMWAXHB0jJsv2MCeqA8h3zTTQ/edit?usp=sharing)

# 開発環境
Ruby/Ruby on Rails/Bootstrap/JavaScript/MySQL/Github/Heroku/AWS/Visual Studio Code

# 今後の課題や実装

- ジムごとの結果を表示
- 課題帳の定期削除機能
- 月ごとのデータを折線グラフで表示
- ジム検索機能
- フレンド機能
- ランキング機能

# テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |

### Association

- has_many :results

## admins テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| company            | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| phone_number       | string     | null: false                    |

### Association

- has_many :gyms
- has_many :problem_lists
- has_many :problems

## gyms テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city_name          | string     | null: false                    |
| street             | string     | null: false                    |
| building_name      | string     |                                |
| gym_url            | text       | null: false                    |
| admin              | references | null: false, foreign_key: true |

### Association

- belongs_to :admin
- has_many :problem_lists
- has_many :results

## problem_lists テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| admin              | references | null: false, foreign_key: true |
| gym                | references | null: false, foreign_key: true |

### Association

- belongs_to :admin
- belongs_to :gym
- has_many :problems

## problems テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| grade_id           | integer    | null: false                    |
| holding            | integer    | null: false                    |
| physical           | integer    | null: false                    |
| move               | integer    | null: false                    |
| positioning        | integer    | null: false                    |
| footwork           | integer    | null: false                    |
| coordination       | integer    | null: false                    |
| admin              | references | null: false, foreign_key: true |
| problem_list       | references | null: false, foreign_key: true |

### Association

- belongs_to :admin
- belongs_to :problem_list
- has_many :results

## results テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| climb              | string     | null: false                    |
| holding            | integer    | null: false                    |
| physical           | integer    | null: false                    |
| move               | integer    | null: false                    |
| positioning        | integer    | null: false                    |
| footwork           | integer    | null: false                    |
| coordination       | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| gym                | references | null: false, foreign_key: true |
| problem            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :gym
- belongs_to :problem

## partners テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| company            | string     | null: false                    |
| email              | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| phone_number       | string     | null: false                    |
| message            | text       | null: false                    |