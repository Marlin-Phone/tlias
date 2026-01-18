package org.example;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Slf4j
public class JwtTest {

    /**
     * 生成Jwt令牌
     */
    @Test
    public void testGenerateJwt(){
        Map<String,Object> dataMap = new HashMap<>();
        dataMap.put("id", 1);
        dataMap.put("username", "admin");

        String jwt = Jwts.builder().signWith(SignatureAlgorithm.HS256,"aXRoZWltYQ==") // 指定算法及密钥
                .addClaims(dataMap) // 添加载荷信息
                .setExpiration(new Date(System.currentTimeMillis()+3600*1000)) // 设置过期时间1小时
                .compact(); // 生成令牌
        System.out.println("生成的Jwt令牌："+jwt);
    }

//    @Test
//    public void testParseJwt(){
//        String token = "eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsImV4cCI6MTc2Njk5MzE1MX0.mRzEx5Zik-NqxYHSqem8fB4kz-rpTXvCkbCNEikyDIA";
//       Claims claims = Jwts.parser().setSigningKey("aXRoZWltYQ==")
//                .parseClaimsJws(token)
//                .getBody();
//       System.out.println(claims);
//    }

}
