![PC](https://user-images.githubusercontent.com/92724990/160286908-ffae851e-cf0d-4070-94d3-1964d93e7dd5.jpg)

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

## DEMO

### ユーザー

新規登録またはログイン後、トップページからジムを検索し、ジムページへ遷移
![u-step2](https://user-images.githubusercontent.com/92724990/160288546-bb81db82-bd57-4f88-8284-4f279821e4a3.gif)

チェックシートを開き完登数を登録
![u-step3](https://user-images.githubusercontent.com/92724990/160289158-fb8e56f0-63f6-4b95-b0b1-1dea38e9d6ce.gif)

チェックシート登録後、マイページに遷移すると結果に応じたチャート、スコアが表示されている
![u-step4](https://user-images.githubusercontent.com/92724990/160289218-b15bad01-f473-453a-b33c-4121eb8f935d.gif)

### ジム経営者

ログイン後、ジム情報を登録
![p-step7](https://user-images.githubusercontent.com/92724990/160289492-f338b440-f852-4e9f-8af6-f299618eb4fc.gif)

課題帳を作成する
![p-step9](https://user-images.githubusercontent.com/92724990/160289559-5c378f5e-428b-4831-8e99-1f9e1f2e42f2.gif)

課題帳に紐づく課題作成ページに遷移
![p-step10](https://user-images.githubusercontent.com/92724990/160289708-c12c83e9-d385-4ab1-84f1-10477e4ef856.gif)

課題を登録
![p-step11](https://user-images.githubusercontent.com/92724990/160289847-f9858f93-b59a-4a22-a112-d01b2ca80559.gif)

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

# 工夫した点

- アプリケーションのロゴマークやトップ画像を自主製作
- ユーザーと管理者毎の使用状況を想定し、レスポンシブ化
- データの有無による表示の切り替え
- DBに保存する値をユーザーの選択により、自動で計算(JavaScript)

# 今後の課題や実装

- ジムごとの結果を表示
- 課題帳の定期削除機能
- 月ごとのデータを折線グラフで表示
- ジム検索機能
- フレンド機能
- ランキング機能

# ER図

![ER](https://user-images.githubusercontent.com/92724990/160288749-ac528425-3686-4431-bdaa-b10d89dc7faf.png)

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