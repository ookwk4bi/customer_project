# README

<br>
  
  
# アプリケーション名
カスタマー情報  

<br>
  

# アプリケーション概要
ユーザーを登録すると顧客情報を
登録することができます。


自身が登録した顧客情報は編集と削除とコメントができます。

<br>
  
# URL
Herokuによるデプロイ
https://customer0711.herokuapp.com/

<br>


# テスト用アカウント
登録用
_メールアドレス: ahkachu@apa.co.jp
_パスワード: ookwk4bi

<br>

# 利用方法
* Chromeの最新版を利用してアクセスしてください。接続先およびログイン情報については、上記の通りです。

* テストアカウントでログイン→トップページから顧客登録ボタン押下

* 顧客情報入力→create customerボタン押下

* トップページにて顧客情報が登録されるので、リンクの詳細ボタンを押すと顧客情報の編集とコメントが可能。

* 顧客編集ページにて対応履歴のコメントや顧客情報の編集・削除が可能。

* トップページにて検索機能あり。該当項目に検索ワードを入力し、検索ボタンを押すと検索も可能。

<br>


# アプリケーションを作成した背景
対応する顧客を事前に認知し、クレームや対応の間違いを減らし顧客満足度を上げる目的。

<br>

# 洗い出した案件
[案件を定義したシート](https://docs.google.com/spreadsheets/d/1uVg2ICpejKJ08BUCTV34auy97JGyp0MfRH5QQo4UIIQ/edit#gid=982722306)

<br>


# 実装した機能

<br>
  

## トップページ<br>
<br>

[![Image from Gyazo](https://i.gyazo.com/5be05dcde4e510126bec07878479ff34.gif)](https://gyazo.com/de9c1cdd78445b3382626d55c4bbfa04)

<br>

## CSVデーターをインポート
CSVデーターをアップロードし、データベースとページに情報を反映することができる。
<br>

[![Image from Gyazo](https://i.gyazo.com/a37386f2d0afefdf4d0476c7b4c260b4.gif)](https://gyazo.com/a37386f2d0afefdf4d0476c7b4c260b4)

<br>


## １.ユーザー登録機能
ユーザー登録することで顧客情報の入力が可能です。

<br>

[![Image from Gyazo](https://i.gyazo.com/f4c5a8f9e97ca8e986f2a1cef30f0aee.gif)](https://gyazo.com/f4c5a8f9e97ca8e986f2a1cef30f0aee)

<br>


## 2.カスタマー登録画面
必要情報入力し、ボタンをクリックすることで顧客情報を入力できる。

登録後は、詳細ページを移動。

<br>


[![Image from Gyazo](https://i.gyazo.com/ceb851fbec39f33c3571cc0cb7e448d8.gif)](https://gyazo.com/ceb851fbec39f33c3571cc0cb7e448d8)

<br>

## 3.顧客情報詳細ページ
登録した顧客情報と対応履歴としてコメントが見ることができます。

<br>

[![Image from Gyazo](https://i.gyazo.com/67aa37f56d5b0ebbfd495cb6161fd190.gif)](https://gyazo.com/67aa37f56d5b0ebbfd495cb6161fd190)

<br>

## 4.顧客情報編集機能
登録した顧客情報について、編集することができます。

その際に、ユーザーの手間を省くため登録時の情報が表示されるようになっています。

<br>

[![Image from Gyazo](https://i.gyazo.com/565858abd7f1bbeec9362035d695ed53.gif)](https://gyazo.com/565858abd7f1bbeec9362035d695ed53)

<br>

## 5.顧客情報削除機能
登録した顧客情報について、削除ボタンを押すことで情報を削除することができます。


<br>

[![Image from Gyazo](https://i.gyazo.com/f33786080c80bfd3d27d84d8c50a557b.gif)](https://gyazo.com/f33786080c80bfd3d27d84d8c50a557b)

<br>

## 6.対応履歴コメント機能
登録した顧客情報について、コメントを残すことができます。

<br>

[![Image from Gyazo](https://i.gyazo.com/6ca06f65e6bc4e82e49a4b1c21dad58b.gif）](https://gyazo.com/6ca06f65e6bc4e82e49a4b1c21dad58b)

<br>


## 7.検索機能
トップページにて、登録した顧客情報をカテゴリー別に検索することができる。

<br>

[![Image from Gyazo](https://i.gyazo.com/53714c30357fbf7c57ff3e317d97a732.gif)](https://gyazo.com/53714c30357fbf7c57ff3e317d97a732)

<br>

## ８.評価機能
コメントの数に応じて対応注意度の平均評価を数値化している

<br>

[![Image from Gyazo](https://i.gyazo.com/6ca06f65e6bc4e82e49a4b1c21dad58b.gif）](https://gyazo.com/6ca06f65e6bc4e82e49a4b1c21dad58b)

<br>

# テーブル設計

<br>

## users テーブル

| Column             | Type   | Options     
| ------------------ | ------ | ----------- 
| email              | string | null: false 
| encrypted_password | string | null: false 
| family_name        | string | null: false 
| given_name         | string | null: false 
| image_url          | string | null: false 



### Association

- has_many :comments<br>
<br>


## costomer テーブル

| Column             | Type   | Options     
| ------------------ | ------ | ----------- 
| family_name         | string | null: false 
| detail             | text   | null: false 
| given_name         | string |    null: false 
| account_number     | string |  null: false 



### Association

- has_many :comments<br>
<br>

## comments テーブル

| Column | Type       | Options                        
| ------ | ---------- | ------------------------------ 
| user       | references | null: false, foreign_key: true 
| customer   | references | null: false, foreign_key: true 
| body       | string|  null: false 
  
### Association

- belongs_to :customer
- belongs_to :user<br>
<br>


## documents テーブル

| Column             | Type   | Options     
| ------------------ | ------ | ----------- 
| last_name          | string | null: false 
| personal_name      | string | null: false 
| content            | text   | null: false 
| number             | string | null: false 

<br>


# ER図
[![Image from Gyazo](https://i.gyazo.com/c411647de0d5d8495656a2f871f933b4.png)](https://gyazo.com/c411647de0d5d8495656a2f871f933b4)<br>
<br>

# 開発環境
Ruby/Ruby on Rails/JavaScript/MySQL/Github/AWS/Visual Studio Code<br>
<br>

# ローカルでの動作方法  
% git clone  https://git.heroku.com/customer9438.git

% cd customer_info

% bundle install

% rails db:create

% rails db:migrate

% yarn install<br>

<br>

# 工夫したポイント
*  Gemを多く活用しました。
