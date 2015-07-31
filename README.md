# BBS-on-Rails

## Feature
Ruby on Rails + AngularJS + WebSocketの練習
現状シングルページ

### 実装済み
- 書き込み
- 読み込み
- 追加読み込み
- リアルタイムの更新

### 未実装
- Mention
- Passwordを使って編集・削除等

## Usage
### 1. Require  
Ruby on Rails 4.2.*  
MySQL 5.5.*

### 2. Clone
```
git clone https://github.com/HirokiCHIBA/BBS-on-Rails.git
```

### 3. DB Setup  
Edit config/databese.yml
```yml
default: &default
  adapter: mysql2
  encoding: utf8
  pool: 5
  username: YOUR_USERNAME
  password: YOUR_PASSWORD
  socket: /tmp/mysql.sock
```

### 4. Install
```
cd BBS-on-Rails
bundle
rake db:migrate
```
