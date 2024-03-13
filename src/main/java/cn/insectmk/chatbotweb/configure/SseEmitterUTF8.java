package cn.insectmk.chatbotweb.configure;

import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
import java.nio.charset.Charset;

/**
 * @Description 重写SseEmitter，改为UTF8
 * @Author makun
 * @Date 2024/3/5 10:06
 * @Version 1.0
 */
public class SseEmitterUTF8 extends SseEmitter {

    public SseEmitterUTF8(Long timeout) {
        super(timeout);
    }

    @Override
    protected void extendResponse(ServerHttpResponse outputMessage) {
        super.extendResponse(outputMessage);

        HttpHeaders headers = outputMessage.getHeaders();
        headers.setContentType( new MediaType("text", "event-stream", Charset.forName("UTF-8")));
    }
}
