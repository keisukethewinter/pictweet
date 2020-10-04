class SearchTweetsService
  def self.search(search)#引数のsearchは、検索フォームから送信されたパラメーターが入るため、
    if search != "" #と記述し、検索フォームに何か値が入力されていた場合を条件としています。
      Tweet.where('text LIKE(?)', "%#{search}%") #あいまい検索 モデル名.where("カラム名 like '%検索テキスト%'")
    else
      Tweet.all
    end
    search = "%#{search}%" #searchという変数に入力値の仮引数searchを展開し、それをLIKE句で検索するために%で囲っています。
    Tweet.find_by_sql(["select * from tweets where text like ? ", search])
    #SQL文を直接書いてレコードを取得するメソッドfind_by_sqlです。そして、このfind_by_sqlメソッドを使用する際にSQLインジェクションの脆弱性が潜んでいます。
    #find_by_sql内ではプレースホルダー ? をいれることによって、ユーザーの入力を適用する前にSQL文を確定します。[]はプレースホルダーを利用するために用いています。
    #このようにプレースホルダーを使うことによって、SQL文を入力値を適用する前に確定することができます。したがって、その後入力されるものがSQLインジェクションを突く攻撃コードだったとしても、単純な文字列として扱われるため安全になります。
  end
end