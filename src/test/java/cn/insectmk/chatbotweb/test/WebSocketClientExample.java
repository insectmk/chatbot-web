package cn.insectmk.chatbotweb.test;

import org.java_websocket.client.WebSocketClient;
import org.java_websocket.handshake.ServerHandshake;

import java.net.URI;

/**
 * @Description WebSocket接口访问案例
 * @Author makun
 * @Date 2024/2/27 18:01
 * @Version 1.0
 */
public class WebSocketClientExample {

    public static void main(String[] args) {
        String wsUrl = "ws://localhost:8000/v1/chat/completions";
        URI uri = URI.create(wsUrl);

        WebSocketClient client = new WebSocketClient(uri) {
            @Override
            public void onOpen(ServerHandshake serverHandshake) {
                System.out.println("Connection established!");
                send("{\"model\":\"chatglm2-6b\",\"messages\":[{\"role\":\"user\",\"content\":\"你好\"}],\"stream\":true}");
            }

            @Override
            public void onMessage(String s) {
                System.out.println("Received: " + s);
            }

            @Override
            public void onClose(int i, String s, boolean b) {
                System.out.println("Connection closed: " + s);
            }

            @Override
            public void onError(Exception e) {
                System.out.println("Error: " + e.getMessage());
            }
        };

        client.connect();
    }
}

