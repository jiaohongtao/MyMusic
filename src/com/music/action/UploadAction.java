package com.music.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.music.util.Util;

public class UploadAction extends ActionSupport {

    private static final long serialVersionUID = 1L;

    private File image; // file控件名
    private String imageFileName; // 文件名称
    private String imageContentType; // 文件类型
    private String type; // 表示报表
    PrintWriter out;
    private String result;

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    // 上传图片
    @SuppressWarnings("deprecation")
    public String alterImage() throws IOException {
        HttpServletRequest request = ServletActionContext.getRequest();

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        try {
            out = response.getWriter();
        } catch (IOException e1) {
            e1.printStackTrace();
            request.setAttribute("message", e1.getMessage());
            return "error";
        }

        String root = request.getRealPath("/file");// 图片要上传到的服务器路径
        String[] names = imageFileName.split("\\.");

        String fileName = "";
        if (names.length >= 1) {
            fileName = getRandomString(20) + "." + names[names.length - 1];
        }
        String picPath = "file/" + fileName;// 图片保存到数据库的路径
        File file1 = new File(root);
        try {
            FileUtils.copyFile(image, new File(file1, fileName));
        } catch (IOException e) {
            request.setAttribute("message", e.getMessage());
            return "error";
        }
        /*
         * JSONObject js = new JSONObject(); js.accumulate("src", picPath);
         * js.accumulate("pas", root); out.println(js);
         */
        Map<String, Object> map = new HashMap<>();
        Map<String, Object> map2 = new HashMap<>();
        map.put("code", 0);// 0表示成功，1失败
        map.put("msg", "上传成功");// 提示消息
        map.put("data", map2);
        map2.put("src", picPath);// 图片url
        map2.put("title", picPath);// 图片名称，这个会显示在输入框里
        result = new JSONObject(map).toString();
        System.out.print(result);
        Util.copyFileUsingFileStreams(image, fileName);
        return "success";
    }

    /* 获取一条随机字符串 */
    public String getRandomString(int length) { // length表示生成字符串的长度
        String base = "abcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public File getImage() {
        return image;
    }

    public void setImage(File image) {
        this.image = image;
    }

    public String getImageFileName() {
        return imageFileName;
    }

    public void setImageFileName(String imageFileName) {
        this.imageFileName = imageFileName;
    }

    public String getImageContentType() {
        return imageContentType;
    }

    public void setImageContentType(String imageContentType) {
        this.imageContentType = imageContentType;
    }

}