package com.music.util;

import sun.misc.BASE64Encoder;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

/**
 * 通用工具类
 */
public class Util {

    /**
     * 对字符串进行MD5加密
     *
     * @param str
     * @return String
     */
    public static String md5Encryption(String str) {
        String newStr = null;
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            BASE64Encoder base = new BASE64Encoder();
            newStr = base.encode(md5.digest(str.getBytes(StandardCharsets.UTF_8)));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return newStr;
    }

    /**
     * 判断字符串是否为空
     *
     * @param str 字符串
     * @return true：为空； false：非空
     */
    public static boolean isNull(String str) {
        return str == null || "".equals(str.trim());
    }

    /**
     * 得到抛异常的信息
     *
     * @param t
     * @return
     */
    public static String getTrace(Throwable t) {
        StringWriter stringWriter = new StringWriter();
        PrintWriter writer = new PrintWriter(stringWriter);
        t.printStackTrace(writer);
        StringBuffer buffer = stringWriter.getBuffer();
        return buffer.toString();
    }

    public static String setKey(String key) {
        if (key.trim().length() == 0) {
            return key;
        } else {
            return " where " + key;
        }
    }

    // /分页
    public static String setPageSql(String tableName, Pages p) {
        return " from " + tableName + setKey(p.getKey()) + " order by "
                + p.getOrder();
    }

    // /获取数量
    public static String setCountSql(String tableName, Pages p) {
        return "select count(*) from " + tableName + setKey(p.getKey());
    }

    static String getPath() {
        // return "C:/Users/dajiaotao/Desktop/music";
        // 当前路径？ 为什么到了tomcat中
        String path = System.getProperty("user.dir");
        // 打包后的file中
        return "";
    }

    public static void copyFileUsingFileStreams(File source, String newfilename)
            throws IOException {
        String projectPath = getPath();
        // 同时复制附件到项目下面
        projectPath += !projectPath.toLowerCase().contains("webroot") ? "/WebRoot/file/" : "";
        // 新文件
        File newFile = new File(projectPath + File.separator + File.separator + newfilename);
        // 判断目标文件所在的目录是否存在
        if (!newFile.getParentFile().exists()) {
            // 如果目标文件所在的目录不存在，则创建父目录
            newFile.getParentFile().mkdirs();
        }
        try (InputStream input = new FileInputStream(source); OutputStream output = new FileOutputStream(newFile)) {
            byte[] buf = new byte[1024];
            int bytesRead;
            while ((bytesRead = input.read(buf)) > 0) {
                output.write(buf, 0, bytesRead);
            }
        }
    }

}
