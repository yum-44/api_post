<%@page contentType= "text/html; charset=UTF-8" %>

<!DOCTYPE html>

<html lang="jp">
<meta charset="utf-8">
<meta name="viewport"
   content="width=320,
      height=480,
      initial-scale=1.0,
      minimum-scale=1.0,
      maximum-scale=2.0,
      user-scalable=yes" />
    <head>
        <link rel='stylesheet' type='text/CSS' href='/apiPost/css/chatgptTravelQuestion.css'>
    </head>

    <body>
        <form action="/apiPost/ChatGptTravelClient" method="post">

            <div id="title" name="title">旅行の予定を立てましょう</div>
            <br />
            <div id="explanation" name="explanation">
                旅行予定の都道府県と日数を選択すると、ChatGPTが旅行プランを立てて回答してくれます！
            </div>
            <div id="form_area" name="form_area">
                <h3 class="sub_title">・旅行予定の都道府県</h3>
                <select name="item1" id="item1">
                    <option hidden>都道府県を選択してください</option>
                    <option value="北海道">北海道</option>
                    <option value="青森県">青森県</option>
                    <option value="岩手県">岩手県</option>
                    <option value="宮城県">宮城県</option>
                    <option value="秋田県">秋田県</option>
                    <option value="山形県">山形県</option>
                    <option value="福島県">福島県</option>
                    <option value="茨城県">茨城県</option>
                    <option value="栃木県">栃木県</option>
                    <option value="群馬県">群馬県</option>
                    <option value="埼玉県">埼玉県</option>
                    <option value="千葉県">千葉県</option>
                    <option value="東京都">東京都</option>
                    <option value="神奈川県">神奈川県</option>
                    <option value="新潟県">新潟県</option>
                    <option value="富山県">富山県</option>
                    <option value="石川県">石川県</option>
                    <option value="福井県">福井県</option>
                    <option value="山梨県">山梨県</option>
                    <option value="長野県">長野県</option>
                    <option value="岐阜県">岐阜県</option>
                    <option value="静岡県">静岡県</option>
                    <option value="愛知県">愛知県</option>
                    <option value="三重県">三重県</option>
                    <option value="滋賀県">滋賀県</option>
                    <option value="京都府">京都府</option>
                    <option value="大阪府">大阪府</option>
                    <option value="兵庫県">兵庫県</option>
                    <option value="奈良県">奈良県</option>
                    <option value="和歌山県">和歌山県</option>
                    <option value="鳥取県">鳥取県</option>
                    <option value="島根県">島根県</option>
                    <option value="岡山県">岡山県</option>
                    <option value="広島県">広島県</option>
                    <option value="山口県">山口県</option>
                    <option value="徳島県">徳島県</option>
                    <option value="香川県">香川県</option>
                    <option value="愛媛県">愛媛県</option>
                    <option value="高知県">高知県</option>
                    <option value="福岡県">福岡県</option>
                    <option value="佐賀県">佐賀県</option>
                    <option value="長崎県">長崎県</option>
                    <option value="熊本県">熊本県</option>
                    <option value="大分県">大分県</option>
                    <option value="宮崎県">宮崎県</option>
                    <option value="鹿児島県">鹿児島県</option>
                    <option value="沖縄県">沖縄県</option>
                </select>

                <h3 class="sub_title">・旅行予定の日数</h3>
                <select name="item2" id="item2">
                    <option hidden>予定日数を選択してください</option>
                    <option value="1">1日間</option>
                    <option value="2">2日間</option>
                    <option value="3">3日間</option>
                    <option value="4">4日間</option>
                    <option value="5">5日間</option>
                    <option value="6">6日間</option>
                </select>
                <br />
                <br />
                <br />
                <input class="btn" type="submit" id="button" name="keep_submit" value="プラン検索実行" />
            </div>
        </form>
        <br />
        <a href="/apiPost/index.jsp" class="btn_09">アプリ集に戻る</a>
        <script type="text/javascript" src="/apiPost/js/chatgptTravelQuestion.js"></script>
    </body>
</html>