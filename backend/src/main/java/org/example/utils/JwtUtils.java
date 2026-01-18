package org.example.utils;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.JwtException;

import java.util.Date;
import java.util.Map;

/**
 * JWT 工具类
 * 提供生成与解析/校验方法
 */
public final class JwtUtils {

    // 默认密钥（可以替换为配置文件中的值，当前与测试中一致）
    private static final String DEFAULT_SECRET = "aXRoZWltYQ==";

    // 12小时过期（毫秒）
    private static final long EXPIRE_MILLIS = 12L * 3600L * 1000L;

    private JwtUtils() {
        // 工具类私有构造
    }

    /**
     * 根据载荷信息生成 JWT 令牌，过期时间为 12 小时
     *
     * @param claims 要放入的载荷（例如 id、username 等）
     * @return 生成的 JWT 字符串
     */
    public static String generateToken(Map<String, Object> claims) {
        long now = System.currentTimeMillis();
        Date exp = new Date(now + EXPIRE_MILLIS);

        return Jwts.builder()
                .setClaims(claims)
                .setExpiration(exp)
                .signWith(SignatureAlgorithm.HS256, DEFAULT_SECRET)
                .compact();
    }

    /**
     * 解析并返回 token 中的 Claims。若 token 无效或过期会抛出 JwtException
     *
     * @param token JWT 字符串
     * @return Claims 对象
     * @throws JwtException 当 token 无效或解析失败时抛出
     */
    public static Claims parseToken(String token) throws JwtException {
        return Jwts.parser()
                .setSigningKey(DEFAULT_SECRET)
                .parseClaimsJws(token)
                .getBody();
    }

    /**
     * 校验 token 是否有效（未过期且签名正确）
     *
     * @param token JWT 字符串
     * @return true 有效，false 无效或解析失败
     */
    public static boolean validateToken(String token) {
        try {
            Claims claims = parseToken(token);
            // 额外可以在此加入对 claims 的更多校验（如 id/username 等）
            return claims != null;
        } catch (JwtException | IllegalArgumentException e) {
            return false;
        }
    }
}
