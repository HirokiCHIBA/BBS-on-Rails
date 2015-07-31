App.controller 'PostsCtrl', ($scope, Post) ->
  # 1ページ分取得
  $scope.posts = Post.query()

  # 投稿フォームのリセット
  $scope.newPost = {
    author: ''
    content: ''
    mail: ''
  }
  # バリデーションのリセット  
  resetValidation = ->
    $scope.validation = {
      author: ''
      mail: ''
      content: ''
    }
  resetValidation()

  # 新規投稿
  $scope.create = ->
    Post.save $scope.newPost, displayPost, displayError
  # 投稿文を表示・フォームクリア
  displayPost = (post) ->
    $scope.newPost = {
      author: post.author
      content: ''
      mail: post.mail
    }
    resetValidation()

  # エラーを表示
  displayError = (msg) ->
    console.log(msg)
    resetValidation()
    for key, value of msg.data.errors
      $scope.validation[key] = 'has-error'
    

  # 読み込み済みのページ
  pageNumber = 1;
  # 次のページ分を読み込み
  $scope.loadMore = ->
    pageNumber++
    Post.query number: pageNumber, (posts) ->
      $scope.posts = $scope.posts.concat posts

  # WebSocket
  dispatcher = new WebSocketRails("ws://#{location.host}/websocket")
  channel = dispatcher.subscribe("streaming")
  # created発生時に未読分を読み込み
  channel.bind "created", (message) ->
    lastId = $scope.posts[0].id
    Post.query 'last_id': lastId, (posts) ->
      # 表示件数を維持
      $scope.posts.splice(-1, posts.length)
      $scope.posts = posts.concat $scope.posts