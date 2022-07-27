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
| year_birth            | integer | null: false               |
| month_birth           | integer | null: false               |
| date_birth            | integer | null: false               |


### Association

- has_many :items
- has_many :shoppings

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| shopping_fee    | string     | null: false                    |
| area            | string     | null: false                    |
| shopping_fee    | boolean    | null: false                    |
| item_name       | string     | null: false                    |
| price           | integer    | null: false                    |
| explanation     | text       | null: false                    |
| user            | references | null: false, foreign_key: true |
| shopping        | references | null: false, foreign_key: true |

### Association

- has_one :shopping
- belongs_to :user

## shoppings テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| post_code         | integer    | null: false                    |
| prefectures       | string     | null: false                    |
| municipalities    | string     | null: false                    |
| address           | string     | null: false                    |
| building          | string     |                                |
| phone_number      | string     | null: false                    |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
