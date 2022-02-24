package com.music.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import com.music.util.ResponseUtil;

public class Util {

	public static String setMap(String mgf, boolean b, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<>();
		map.put("mgf", mgf);
		map.put("success", b);
		String result = new JSONObject(map).toString();
		ResponseUtil.write(response, result);
		return null;
	}
}
