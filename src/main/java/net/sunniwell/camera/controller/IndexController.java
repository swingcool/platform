package net.sunniwell.camera.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/** 
 * @author  763915703@qq.com
 * @date 创建时间：2017年4月25日 上午9:30:39 
 * @version 1.0 
 * @since  
 * @description  
 */
@Controller
public class IndexController {
	/**
	 * 跳转至首页
	 * @return
	 */
	@RequestMapping("/index.do")
	public String index(){
		return "index";
	}
	/**
	 * 首页欢迎页面
	 * @return
	 */
	@RequestMapping("/welcomeShow.do")
	public String welcomeShow(){
		return "welcome";
	}
}
