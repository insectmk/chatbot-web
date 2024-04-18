package cn.insectmk.chatbotweb.util;

import cn.insectmk.chatbotweb.configure.value.AliyunOSSConfigValue;
import cn.insectmk.chatbotweb.exception.BizException;
import com.aliyun.oss.ClientException;
import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.OSSException;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.web.multipart.MultipartFile;
import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;
import java.util.UUID;

/**
 * @Description 阿里云OSS工具类
 * @Author makun
 * @Date 2024/4/10 9:12
 * @Version 1.0
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class AliyunOSSUtil extends AliyunOSSConfigValue {
    // 传入阿里云配置
    public AliyunOSSUtil(AliyunOSSConfigValue aliyunOSSConfig) {
        this.setEndpoint(aliyunOSSConfig.getEndpoint());
        this.setAccessKeyId(aliyunOSSConfig.getAccessKeyId());
        this.setAccessKeySecret(aliyunOSSConfig.getAccessKeySecret());
        this.setBucketName(aliyunOSSConfig.getBucketName());
    }

    /**
     * 上传图片到阿里云OSS
     * @param fileBytes
     * @param folderPath
     * @return
     */
    public String upload(byte[] fileBytes, String folderPath){
        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
        // 定义文件名称
        String fileName = generateFileName("head.jpg");
        // 上传图片
        try {
            ossClient.putObject(getBucketName(), folderPath + fileName, new ByteArrayInputStream(fileBytes));
        } finally {
            // 关闭OSSClient。
            ossClient.shutdown();
        }

        return  url + folderPath + fileName;
    }

    /**
     * 通过URL获取文件名
     * @param urlStr
     * @return
     */
    public String getFileNameByURL(String urlStr) {
        // 创建URL对象
        URL url = null;
        try {
            url = new URL(urlStr);
        } catch (MalformedURLException e) {
            //throw new BizException("文件名异常");
            return null;
        }
        // 使用Paths.get方法将URL转换成Path对象
        Path path = Paths.get(url.getPath());
        return path.getFileName().toString();
    }

    /**
     * 上传图片到阿里云OSS
     * @param multipartFile
     * @param folderPath
     * @return
     */
    public String upload(MultipartFile multipartFile, String folderPath){
        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
        // 定义文件名称
        String fileName = generateFileName(Objects.requireNonNull(multipartFile.getOriginalFilename()));
        // 上传图片
        try {
            ossClient.putObject(getBucketName(), folderPath + fileName, multipartFile.getInputStream());
        } catch (IOException e) {
            throw new BizException("图片上传失败");
        } finally {
            // 关闭OSSClient。
            ossClient.shutdown();
        }

        return  url + folderPath + fileName;
    }

    /**
     * 删除一个文件
     * @param folderPath
     * @param fileName
     */
    public void delete(String folderPath, String fileName) {
        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);

        try {
            // 删除文件或目录。如果要删除目录，目录必须为空。
            ossClient.deleteObject(bucketName, folderPath + fileName);
        } catch (OSSException oe) {
            System.out.println("Caught an OSSException, which means your request made it to OSS, "
                    + "but was rejected with an error response for some reason.");
            System.out.println("Error Message:" + oe.getErrorMessage());
            System.out.println("Error Code:" + oe.getErrorCode());
            System.out.println("Request ID:" + oe.getRequestId());
            System.out.println("Host ID:" + oe.getHostId());
            throw new BizException("阿里云OSS删除图片失败");
        } catch (ClientException ce) {
            System.out.println("Caught an ClientException, which means the client encountered "
                    + "a serious internal problem while trying to communicate with OSS, "
                    + "such as not being able to access the network.");
            System.out.println("Error Message:" + ce.getMessage());
            throw new BizException("阿里云OSS删除图片失败");
        } finally {
            if (ossClient != null) {
                ossClient.shutdown();
            }
        }
    }

    /**
     * 生成唯一的文件名
     * @param originalFilename 文件本来的名称
     * @return
     */
    private String generateFileName(String originalFilename) {
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String suffix = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
        return dateFormat.format(date) + "-" + UUID.randomUUID() + "." + suffix;
    }
}
