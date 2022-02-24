package com.music.util;

import javax.servlet.http.HttpServletRequest;

public class Pages {

    private HttpServletRequest request;

    public Pages(HttpServletRequest request) {
        this.request = request;
    }

    private int startIndex = 1;
    private int pageSize = 20;
    private Object[] param = new Object[]{};
    // 搜索关键词,如title like ?,?用"%x%"代替
    private String order = "id desc";
    private String key = "";

    public Object[] getParam() {
        return param;
    }

    public void setParam(Object[] param) {
        this.param = param;
    }

    public int getSum() {
        return startIndex * pageSize;
    }

    public void setSum(int sum) {
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public int getStartIndex() {
        // 起始页，默认从第1页开始读
        return request.getParameter("startIndex") == null ? 1 : Integer
                .parseInt(request.getParameter("startIndex"));
    }

    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getBase() {
        // /music/admin/News_get.action
        String url = request.getRequestURI();
        url = url.substring(1);
        url = url.substring(url.indexOf("/") + 1);
        return url;
    }
}
