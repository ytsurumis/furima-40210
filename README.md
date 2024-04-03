## users テーブル

| Column              | Type          | Options                        |
|---------------------|---------------|--------------------------------|
| nickname            | string        | null: false                    |
| email               | string        | null: false, unique: true      |
| encrypted_password  | string        | null: false                    |
| family_name         | string        | null: false                    |
| first_name          | string        | null: false                    |
| family_name_reading | string        | null: false                    |
| first_name_reading  | string        | null: false                    |
| birthday            | date          | null: false                    |

has_many :furimas
has_many :purchases

## furimas テーブル

| Column              | Type          | Options                        |
|---------------------|---------------|--------------------------------|
| title               | string        | null: false                    |
| description         | text          | null: false                    |
| category_id         | integer       | null: false                    |
| condition_id        | integer       | null: false                    |
| burden_id           | integer       | null: false                    |
| area_id             | integer       | null: false                    |
| number_of_days_id   | integer       | null: false                    |
| price               | integer       | null: false                    |
| commission          | integer       | null: false                    |
| profit              | integer       | null: false                    |
| user                | references    | null: false, foreign_key: true |

belongs_to :user
has_one :purchase

## purchases テーブル

| Column              | Type          | Options                        |
|---------------------|---------------|--------------------------------|
| furima              | references    | null: false, foreign_key: true |
| user                | references    | null: false, foreign_key: true |

belongs_to :user
belongs_to :furima
has_one :shipping

## shippings テーブル

| Column              | Type          | Options                        |
|---------------------|---------------|--------------------------------|
| post_code           | string        | null: false                    |
| prefecture          | string        | null: false                    |
| municipalities      | string        | null: false                    |
| street              | string        | null: false                    |
| building            | string        | null: true                     |
| phone               | string        | null: false                    |
| purchase            | references    | null: false, foreign_key: true |

belongs_to :purchase