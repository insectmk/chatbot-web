package cn.insectmk.chatbotweb;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@MapperScan({"cn.insectmk.chatbotweb.mapper"})
@EnableTransactionManagement
public class ChatbotWebApplication {

    public static void main(String[] args) {
        SpringApplication.run(ChatbotWebApplication.class, args);
    }

}
