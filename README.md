# テーブル設計

## users テーブル

| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| last_name_kana        | string  | null: false               |
| first_name_kana       | string  | null: false               |
| last_name_kanji       | string  | null: false               |
| first_name_kanji      | string  | null: false               |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| birthday              | date    | null: false               |


### Association

- has_many :items
- has_many :shoppings

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shopping_fee_id    | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| delivery_date_id   | integer    | null: false                    |
| item_name          | string     | null: false                    |
| price              | integer    | null: false                    |
| explanation        | text       | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association

- has_one :shopping
- belongs_to :user

## shopping_addresses テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| post_code         | string     | null: false                    |
| municipalities    | string     | null: false                    |
| address           | string     | null: false                    |
| building          | string     |                                |
| phone_number      | string     | null: false                    |
| area_id           | integer    | null: false                    |
| shopping          | references | null: false, foreign_key: true |


### Association

- belongs_to :shopping


## shoppings テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| shopping_addresses | references | null: false, foreign_key: true |

### Association

- has_one :shopping_address
- belongs_to :item
- belongs_to :user