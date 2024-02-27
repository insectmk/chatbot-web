package cn.insectmk.chatbotweb.test;


import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

public class HttpAPICaller {

    public static void main(String[] args) {
        String url = "http://localhost:8000/";

        HttpClient httpClient = new HttpClient();
        PostMethod postMethod = new PostMethod(url);

        postMethod.addRequestHeader("accept", "*/*");
        //设置Content-Type，此处根据实际情况确定
        postMethod.addRequestHeader("Content-Type", "application/json");

        // 构造要发送的JSON数据
        String json = "{\"prompt\": \"你好\", \"history\": []}";
        // 设置请求体x
        try {
            postMethod.setRequestEntity(new StringRequestEntity(json, "application/json;charset=UTF-8", "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }

        String result = "";
        try {
            int code = httpClient.executeMethod(postMethod);
            if (code == 200){
                result = postMethod.getResponseBodyAsString();
                System.out.println("result:" + result);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
