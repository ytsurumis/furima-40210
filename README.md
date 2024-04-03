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
| year_of_birth       | integer       | null: false                    |
| birth_month         | integer       | null: false                    |
| birth_day           | integer       | null: false                    |

has_many :furimas
has_many :purchases

## furimas テーブル

| Column              | Type          | Options                        |
|---------------------|---------------|--------------------------------|
| title               | string        | null: false                    |
| description         | text          | null: false                    |
| category            | string        | null: false                    |
| condition           | string        | null: false                    |
| burden              | string        | null: false                    |
| area                | string        | null: false                    |
| number_of_days      | text          | null: false                    |
| price               | integer       | null: false                    |
| commission          | integer       | null: false                    |
| profit              | integer       | null: false                    |
| user                | references    | null: false, foreign_key: true |

belongs_to :users
has_one :purchases

## purchases テーブル

| Column              | Type          | Options                        |
|---------------------|---------------|--------------------------------|
| furima              | references    | null: false, foreign_key: true |
| user                | references    | null: false, foreign_key: true |

belongs_to :users
belongs_to :furimas
has_one :shippings

## shippings テーブル

| Column              | Type          | Options                        |
|---------------------|---------------|--------------------------------|
| post_code           | string        | null: false                    |
| prefecture          | string        | null: false                    |
| municipalities      | string        | null: false                    |
| street              | string        | null: false                    |
| building            | string        | null: true                     |
| phone               | string        | null: false                    |

belongs_to :purchases