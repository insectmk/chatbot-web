package cn.insectmk.chatbotweb.test;


import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.StringRequestEntity;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

public class OpenAIAPICaller {

    public static void main(String[] args) {
        String url = "http://localhost:8000/v1/chat/completions";

        HttpClient httpClient = new HttpClient();
        PostMethod postMethod = new PostMethod(url);

        postMethod.addRequestHeader("accept", "*/*");
        //设置Content-Type，此处根据实际情况确定
        postMethod.addRequestHeader("Content-Type", "application/json");

        // 构造要发送的JSON数据
        String json = "{\"model\":\"chatglm2-6b\",\"messages\":[{\"role\":\"user\",\"content\":\"你好\"}],\"stream\":true}";
        // 设置请求体x
        try {
            postMethod.setRequestEntity(new StringRequestEntity(json, "application/json", "UTF-8"));
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
