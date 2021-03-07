## users テーブル

| Column          | Type               | Options                   |
| --------------- | ------------------ | ------------------------- |
| nickname        | string             | null: false               |
| email           | integer            | null: false, unique: true |
| password        | encrypted_password | null: false               |
| last_name       | string             | null: false               |
| first_name      | string             | null: false               |
| last_name_kana  | string             | null: false               |
| first_name_kana | string             | null: false               |
| birthday        | date               | null: false               |

### Association

has_many :items
has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| status_id          | integer    | null: false                    |
| shipping_charge_id | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| price              | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

belongs_to :user
has_one :order

## orders 名

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| postcode     | string     | null: false |
| prefecture   | string     | null: false |
| city         | integer    | null: false |
| block        | integer    | null: false |
| building     | integer    |             |
| phone_number | integer    | null: false |
| order        | references | null: false |

### Association

belongs_to :order
