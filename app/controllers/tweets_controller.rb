class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]#このままの記述では、未ログイン時に検索をするとトップページへリダイレクトされてしまいます。これを回避するために、before_actionのexceptオプションに:searchを追加しています。
  
  def index
    # @tweets = Tweet.includes(:user).order("created_at DESC")
  query = "SELECT * FROM tweets" #"SELECT * FROM tweets"は、tweetsテーブルからすべてのレコードを取得するSQL文、Tweet.allと同義になります。
  @tweets = Tweet.find_by_sql(query)
  end

  def new
    @tweet = Tweet.new
  end

  def create
   @tweet = Tweet.new(tweet_params)
   # バリデーションで問題があれば保存されずに「投稿画面」に戻る
   if @tweet.valid?
    @tweet.save
    redirect_to root_path
   else
    # 保存されなければnew(投稿画面)に戻る
    render 'new'
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def search
    @tweets = SearchTweetsService.search(params[:keyword])
  end#searchメソッドの引数にparams[:keyword]と記述して、検索結果を渡しています。

  private

  def tweet_params
    params.require(:tweet).permit(:image, :text).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end