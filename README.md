# テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |

### Association

- has_many :check_sheets

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
| prefectures_id     | integer    | null: false                    |
| city_name          | string     | null: false                    |
| street             | string     | null: false                    |
| building_name      | string     |                                |
| gym_url            | text       |                                |
| admin              | references | null: false, foreign_key: true |

### Association

- belongs_to :admin
- has_many :problem_lists

## problem_lists テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| month_numbers      | date       | null: false                    |
| admin              | references | null: false, foreign_key: true |
| gym                | references | null: false, foreign_key: true |

### Association

- belongs_to :admin
- belongs_to :gym
- has_many :problems
- has_one :check_sheet

## problems テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| grades_id          | integer    | null: false                    |
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

## check_sheets テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| climbs_id          | integer    |                                |
| user               | references | null: false, foreign_key: true |
| problem_list       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :problem_list