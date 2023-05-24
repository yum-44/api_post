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
        <link rel='stylesheet' type='text/CSS' href='/apiPost/css/chatgptCookingQuestion.css'>
    </head>

    <body>
        <form action="/apiPost/ChatGptCookingClient" method="post">

            <div id="title" name="title">今夜の献立を考えます！</div>
            <br />
            <div id="explanation" name="explanation">
                食材と品数を入力するとChatGPTが簡単にできる料理のレシピを回答してくれます！
            </div>
            <div id="form_area" name="form_area">
                <h3 class="sub_title">★使いたい食材(すべて入力しなくても大丈夫)</h3>
                <div id="input_field">
                    <span class="text">・食材1：</span><input type="text" name="itemList" /><br />
                    <span class="text">・食材2：</span><input type="text" name="itemList" /><br />
                    <span class="text">・食材3：</span><input type="text" name="itemList" /><br />
                    <span class="text">・食材4：</span><input type="text" name="itemList" /><br />
                    <span class="text">・食材5：</span><input type="text" name="itemList" />
                </div>
                <h3 class="sub_title">★品数</h3>
                <select name="item2" id="item2">
                    <option hidden>品数を選択してください。</option>
                    <option value="1">1品</option>
                    <option value="2">2品</option>
                    <option value="3">3品</option>
                    <option value="4">4品</option>
                    <option value="5">5品</option>
                </select>
                <br />
                <br />
                <br />
                <input class="btn" type="submit" id="button" name="keep_submit" value="レシピを教えろ！" />
            </div>
        </form>
        <br />
        <a href="/apiPost/index.jsp" class="btn_09">アプリ集に戻る</a>
        <script type="text/javascript" src="/apiPost/js/chatgptCookingQuestion.js"></script>
    </body>
</html>