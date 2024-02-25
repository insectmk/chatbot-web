package cn.insectmk.chatbotweb;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan({"cn.insectmk.chatbotweb.mapper"})
public class ChatbotWebApplication {

    public static void main(String[] args) {
        SpringApplication.run(ChatbotWebApplication.class, args);
    }

}
