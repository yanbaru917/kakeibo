# README
# 使用技術
## 言語
  - Ruby 2.5.1
## フレームワーク
  - Ruby on Rails 5.2.4.3

# アプリケーション概要
家計簿アプリを作成しました。私が人生において感銘を受けた家計簿のアプリを個人でも作ってみたいと考え作成することに挑戦しました。収入、支出、項目を作りトップページに表示されるように致しました。
また、標準の家計簿機能に加えて、自分の大切にしている言葉を貯蓄できる機能を付けました。言葉、教養に関しては貯蓄すればするほど人生が豊かになると考えたからです。大切にしている言葉や名言等がランダムでトップページに表示されるよう設計しました。

## 機能一覧
収入機能
支出機能
名言機能
ユーザー登録機能（途中）

# kakeibo DB設計
# ER図
  https://gyazo.com/10c37b3245ddfb45cd625c850661abb8
## incomsテーブル
|Column|Type|Options|
|------|----|-------|
|income_name|string|null: false|
|income-amount|string|null: false|
### Association


## expensesテーブル
|Column|Type|Options|
|------|----|-------|
|expense_name|string|null: false|
|expense_amount|string|null: false|

### Association


## wisdomテーブル
|Column|Type|Options|
|------|----|-------|

### Association