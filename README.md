# テーブル設計

## users テーブル

| Column                          | Type       | Options                        |
| ------------------------------- | ---------- | ------------------------------ |
| nickname                        | string     | null: false                    |
| email                           | string     | null: false, unique:true       |
| encrypted_password              | string     | null: false                    |
| last_name                       | string     | null: false                    |
| first_name                      | string     | null: false                   |
| last_name_reading               | string     | null: false                    |
| first_name_reading              | string     | null: false                    |
| birthday                        | date       | null: false                    |


### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column                       | Type       | Options                        |
| ---------------------------- | ---------- | ------------------------------ |
| user                         | references | null: false, foreign_key: true |
| name                         | string     | null: false                    |
| text                         | text       | null: false                    |
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
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | -------------------------------| 
| postcode         | string     | null: false                    |
| prefecture_id    | integer    | null: false                    | 
| city             | string     | null: false                    |
| block            | string     | null: false                    |
| building         | string     |                                |
| phone_number     | string     | null: false                    |
| purchase_record  | references | null: false, foreign_key: true |



### Association

- belongs_to :purchase_record
