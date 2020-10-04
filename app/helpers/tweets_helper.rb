module TweetsHelper
  def tweet_lists(tweets)
    html = ''
    tweets.each do |tweet|
      html += render(partial: 'tweet',locals: { tweet: tweet})
    end
    return raw(html) #raw(html)のraw()は、HTMLを正常に表示するためのメソッドと覚えていただいて問題ありません。具体的には「<」「>」「&」などの、特殊文字を意図するように扱うためのメソッドです。
  end
end