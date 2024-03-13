package cn.insectmk.chatbotweb.util;

import cn.insectmk.chatbotweb.entity.User;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;
import java.util.Date;

/**
 * @Description JWT工具类
 * @Author makun
 * @Date 2023/10/8 15:55
 * @Version 1.0
 */
public class JWTUtil {
    @Value("${jwt.subject}")
    private String subject;
    @Value("${jwt.secret}")
    private String secret;
    @Value("${jwt.prefix}")
    private String prefix;
    @Value("${jwt.expire}")
    private Long expire;

    /**
     * 通过一个User对象生成一个JWT令牌
     * @param user
     * @return
     */
    public String generateJWT(User user) {
        String token = Jwts.builder()
                // 设置主题
                .setSubject(subject)
                // 设置负载信息
                .claim("id",user.getId())
                // 设置发布时间
                .setIssuedAt(new Date())
                // 设置过期时间
                .setExpiration(new Date(System.currentTimeMillis() + expire))
                // 设置加密规则和密钥
                .signWith(SignatureAlgorithm.HS256,secret)
                // 生成令牌
                .compact();
        // 给令牌加上前缀（更安全）
        token = prefix + token;
        return token;
    }

    /**
     * 校验token令牌是否合法
     * @param token
     * @return
     */
    public Claims checkJWT(String token) {
        try{
            return Jwts.parser()
                    // 填入密钥
                    .setSigningKey(secret)
                    // 替换令牌前缀
                    .parseClaimsJws(token.replace(prefix,""))
                    // 获取负载信息
                    .getBody();
        }catch (Exception e){
            return null;
        }
    }
}
