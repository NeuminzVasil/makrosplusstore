package store.configurations;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@Component
public class JwtTokenUtil {
    @Value("${jwt.secret}")
    private String secret;


    public String generateToken(UserDetails userDetails) {
        Map<String, Object> claims = new HashMap<>();
        List<String> rolesList = userDetails.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority) // получаем авторити
                .collect(Collectors.toList());
        claims.put("role", rolesList);
        return doGenerateToken(claims, userDetails.getUsername()); // кладем авторити в токен
    }

    private String doGenerateToken(Map<String, Object> claims, String subject) {
        Date issuedDate = new Date();
//        Date expiredDate = new Date(issuedDate.getTime() + 60 * 60 * 1000); // (час issuedDate.getTime() + 60 * 60 * 1000)
        Date expiredDate = new Date(issuedDate.getTime() + 240 * 60 * 1000); // (четыре часа issuedDate.getTime() + 60 * 60 * 1000)
//        Date expiredDate = new Date(issuedDate.getTime() + 60 * 1000); // (одна минута issuedDate.getTime() + 60 * 60 * 1000)
//        Date expiredDate = new Date(issuedDate.getTime() + 3 * 1000); // (10 секунд issuedDate.getTime() + 60 * 60 * 1000)
        System.err.println(issuedDate);
        System.err.println(expiredDate);
        return Jwts.builder()
                .setClaims(claims)
                .setSubject(subject)
                .setIssuedAt(issuedDate)
                .setExpiration(expiredDate)
                .signWith(SignatureAlgorithm.HS256, secret)
                .compact();
    }

    // получаем Юзера из токена
    public String getUsernameFromToken(String token) {
        System.out.println(getClaimFromToken(token, Claims::getSubject));
        return getClaimFromToken(token, Claims::getSubject);
    }

    // получаем Роли из токена
    public List<String> getRolesFromToken(String token){
        return getClaimFromToken (token,
                    (Function <Claims, List<String>>) claims ->claims.get("roles", List.class));
    }

    private <T> T getClaimFromToken(String token, Function<Claims, T> claimsResolver) {
        Claims claims = getAllClaimsFromToken(token);
        return claimsResolver.apply(claims);
    }

    private Claims getAllClaimsFromToken(String token) {
        return Jwts.parser()
                .setSigningKey(secret)
                .parseClaimsJws(token)
                .getBody();
    }

}
