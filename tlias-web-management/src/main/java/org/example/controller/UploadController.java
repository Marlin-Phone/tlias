package org.example.controller;

import lombok.extern.slf4j.Slf4j;
import org.example.pojo.Result;
import org.example.utils.AliyunOSSOperator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Slf4j
@RestController
public class UploadController {

    /**
     * 本地磁盘存储，不推荐
     */
//    @PostMapping("/upload")
//    public Result upload(String name, Integer age, MultipartFile file) throws IOException { // 如果前端名不一致，可以使用 @RequestParam("前端名称") 注解指定
//        log.info("接收到的参数：name = {}, age = {}, file = {}", name, age, file);
//        String originalFilename =  file.getOriginalFilename();
//        String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//        String newFilename = UUID.randomUUID().toString() + ext;
//        file.transferTo(new File("D:/images/" + newFilename));
//        return Result.success();
//    }

    @Autowired
    private AliyunOSSOperator aliyunOSSOperator;

    @PostMapping("/upload")
    public Result upload(MultipartFile file) throws Exception {
        log.info("文件上传：" + file.getOriginalFilename());
        // 将文件交给OSS来存储管理
        String url =  aliyunOSSOperator.upload(file.getBytes(), file.getOriginalFilename());
        log.info("文件上传后的url:" + url);

        return Result.success(url);
    }

}
