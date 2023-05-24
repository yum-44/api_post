package chat_api_post;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet("/chat_api_post/ChatGptCookingClient")
public class ChatGptCookingClient extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // コンストラクタ
    public ChatGptCookingClient() {
        super();
    }
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        // 入力格納用変数
        // 引数のリストをそのままリスト化
        List<String> itemList = new ArrayList<>(Arrays.asList(request.getParameterValues("itemList")));
        // リストの空白を削除
        itemList.removeAll(Arrays.asList("", null));
        // パラメータ渡し
        String item1 = String.join("、",itemList);
        String item2 = request.getParameter("item2");

        // ChatGPT APIのエンドポイントURLとAPIキーを設定
        String apiUrl = "https://api.openai.com/v1/chat/completions";
        String apiKey = "";

        // 入力メッセージ
        String prompt = item1 + "を使った簡単なレシピを" + item2 + "品教えてください。";

        // ChatGPTモデル設定
        String model = "gpt-3.5-turbo";

        // 表示メッセージ
        String viewContents = null;

        String responseBody = null;

        // リクエストbody構築
        String message = "{\"role\": \"system\", \"content\": \"返答は日本語\"},{\"role\": \"user\", \"content\": \"" + prompt + "\"}";
        String requestBody = "{\"model\": \"" + model + "\", \"messages\": [" + message + "]}";

        // HttpClientを作成
        HttpClient httpClient = HttpClientBuilder.create().build();

        // POSTリクエストを作成
        HttpPost gptRequest = new HttpPost(apiUrl);

        gptRequest.setHeader("Content-Type", "application/json");
        gptRequest.setHeader("Authorization", "Bearer " + apiKey);
        gptRequest.setEntity(new StringEntity(requestBody, "UTF-8"));

        try {
            // APIにリクエストを送信
            HttpResponse gptResponse = httpClient.execute(gptRequest);

            // レスポンスボディを取得
            responseBody = EntityUtils.toString(gptResponse.getEntity(), "UTF-8");

            Gson gson = new Gson();
            JsonObject jsonResponse = gson.fromJson(responseBody, JsonObject.class);
            JsonArray choicesArray = jsonResponse.getAsJsonArray("choices");
            JsonObject messageObject = choicesArray.get(0).getAsJsonObject().get("message").getAsJsonObject();
            viewContents = messageObject.get("content").getAsString();

        } catch ( Exception e ) {
            log("★エラー発生！！");
            log(responseBody);
            viewContents = "【!】ChatGPTでエラーが発生しました。暫くたってから再度トライしてください。";
        }

        // 画面出力設定
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        // 画面に出力するためのWriterクラスインスタンスを取得
        PrintWriter pw = response.getWriter();

        // 回答の改行コードをbr変換
        viewContents = viewContents.replace("\n","<br />");

        // HTMLを出力
        pw.println("<!DOCTYPE html>");
        pw.println("<html>");
        pw.println("<head>");
        pw.println("<meta charset='UTF-8'>");
        pw.println("<meta name=\"viewport\n" +
                    "content=\"width=320\",\n" +
                    "height=480,\n" +
                    "initial-scale=1.0,\n" +
                    "minimum-scale=1.0,\n" +
                    "maximum-scale=2.0,\n" +
                    "user-scalable=yes\">");
        pw.println("<title>ChatGPT考案簡単レシピ</title>");
        pw.println("<link rel='stylesheet' type='text/CSS' href='/apiPost/css/responceConfirm.css'>");
        pw.println("</head>");
        pw.println("<body>");
        pw.println("<div id=\"title\">ChatGPT考案！今夜の晩御飯♪</div>");
        pw.println("<h3>★ChatGPTにリクエストした内容</h3>");
        pw.println("<p name=\"response\">" + prompt + "</p>");
        pw.println("<h3>★ChatGPTのレシピ提案</h3>");
        pw.println("<p name=\"response\">" + viewContents + "</p>");
        pw.println("<br /><div class=\"back_button\"><a href=\"/apiPost/chatgptCookingQuestion.jsp\" class=\"btn_09\">入力画面に戻る</a></div>");
        pw.println("</body>");
        pw.println("</html>");
    }
}
