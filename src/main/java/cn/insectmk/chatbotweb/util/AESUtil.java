package cn.insectmk.chatbotweb.util;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

/**
 * @Description AES对称加密工具类
 * @Author makun
 * @Date 2024/2/26 17:37
 * @Update 2024/4/19 10:41
 * @Version 1.0
 */
@Component
@Slf4j
public class AESUtil {
	@Value("${aes.secret-key}")
	private String secretKey;
	@Value("${aes.init-vector}")
	private String initVector;

	@Autowired
	private JsonUtil jsonUtil;

	/**
	 * 将加密后的字符串解密为JSON字符串后再转为对象
	 * @param value 需要解密的字符串
	 * @param objectClass 需要转为的对象Class
	 * @return
	 * @param <T>
	 */
	public <T> T decrypt(String value, Class<T> objectClass) {
		return jsonUtil.toObject(decrypt(value), objectClass);
	}

	/**
	 * 将对象转为Json字符串再加密
	 * @param value 需要加密的对象
	 * @return
	 */
	public String encrypt(Object value) {
		return encrypt(jsonUtil.toJson(value));
	}

	/**
	 * 加密
	 * @param value 需要加密的数据
	 * @return
	 */
	public String encrypt(String value) {
		try {
			IvParameterSpec iv = new IvParameterSpec(initVector.getBytes(StandardCharsets.UTF_8));
			SecretKeySpec skeySpec = new SecretKeySpec(secretKey.getBytes(StandardCharsets.UTF_8), "AES");

			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
			cipher.init(Cipher.ENCRYPT_MODE, skeySpec, iv);

			byte[] encrypted = cipher.doFinal(value.getBytes());
			// 使用URL安全的Base64编码
			return Base64.getUrlEncoder().withoutPadding().encodeToString(encrypted);
		} catch (Exception e) {
			// 在这里处理异常，例如记录错误
			log.error("加密异常：", e);
			return ""; // 返回空字符串作为默认值
		}
	}

	/**
	 * 解密
	 * @param encrypted 需要解密的数据
	 * @return
	 */
	public String decrypt(String encrypted) {
		try {
			IvParameterSpec iv = new IvParameterSpec(initVector.getBytes(StandardCharsets.UTF_8));
			SecretKeySpec skeySpec = new SecretKeySpec(secretKey.getBytes(StandardCharsets.UTF_8), "AES");

			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
			cipher.init(Cipher.DECRYPT_MODE, skeySpec, iv);

			byte[] original = cipher.doFinal(Base64.getUrlDecoder().decode(encrypted));

			return new String(original);
		} catch (Exception e) {
			// 在这里处理异常，例如记录错误
			log.error("加密异常：", e);
			return ""; // 返回空字符串作为默认值
		}
	}
}
