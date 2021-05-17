# テーブル設計

## users テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| nickname              | string     | null: false                    |
| email                 | string     | null: false                    |
| password              | string     | null: false                    |
| password_confirmation | string     | null: false                    |
| name                  | string     | null: false                    |
| name_reading          | string     | null: false                    |
| birthday              | date       | null: false                    |


### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column                       | Type       | Options                        |
| ---------------------------- | ---------- | ------------------------------ |
| user_id                      | references | null: false, foreign_key: true |
| image_id                     | references | null: false, foreign_key: true |
| item_name                    | string     | null: false, foreign_key: true |
| text                         | text       | null: false, foreign_key: true |
| category_id                  | integer    | null: false                    |
| status_id                    | integer    | null: false                    |
| delivery_charge_id           | integer    | null: false                    |
| prefecture_id                | integer    | null: false                    |
| delivery_days_id             | integer    | null: false                    | 
| price                        | integer    | null: false                    |


### Association

- has_one :purchase_record
- belongs_to :user

## purchase_records テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :addresse

## addresses テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ------------|
| postcode         | string     | null: false |
| prefecture_id    | integer    | null: false |
| city             | string     | null: false |
| block            | string     | null: false |
| building         | string     | null: false |
| phone_number     | string     | null: false |

### Association

- belongs_to :purchase_record
