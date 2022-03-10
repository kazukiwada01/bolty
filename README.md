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