## users テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| nickname  | string  | null: false |
| email     | integer | null: false |
| password  | integer | null: false |
| full_name | string  | null: false |
| katakana  | string  | null: false |
| birthday  | integer | null: false |

### Association

has_many :items
has_many :orders

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | string     | null: false                    |
| status          | string     | null: false                    |
| shipping_charge | string     | null: false                    |
| price           | integer    | null: false                    |
| prefecture      | string     | null: false                    |
| shipping_days   | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

belongs_to :user
has_one :order

## orders 名

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal_code  | integer | null: false |
| prefecture   | string  | null: false |
| city         | integer | null: false |
| house_number | integer | null: false |
| building     | integer |             |
| phone_number | integer | null: false |

### Association

belongs_to :order
