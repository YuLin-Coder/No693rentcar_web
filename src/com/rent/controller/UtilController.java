package com.rent.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.rent.entity.Car;
import com.rent.entity.User;
import com.rent.service.CarService;
import com.rent.service.UserService;

@Controller

public class UtilController {
	
	@Autowired
	UserService userService;
	
	@Autowired 
	CarService CarService;
	
	
	@RequestMapping("toEcharts")
	public String toEcharts(HttpServletRequest request) {
		return "view/echarts";
	}
	
	
	@RequestMapping("toLogin")
	public String toLogin(HttpSession session) {
		session.invalidate();
		return "view/login";
	}
	
	
	
	@RequestMapping("toLoginOutAct")
	public String toLoginOutAct(HttpSession session) {
		session.invalidate();
		return "view/login";
	}
	@RequestMapping("toMain")
	public String toMain(HttpServletRequest request,HttpSession session) throws Exception {
		Map<String,Object> maps = new HashMap<>();
		List<User> userList = userService.selectUserList(maps);
		request.setAttribute("userList", userList);
		List<Car> carList = CarService.selectCarList(maps);
		request.setAttribute("carList", carList);
		return "view/main";
	}
	
	@RequestMapping("toConsoleAct")
	public String toWelocmeAct() {	
		return "view/console";
	}
	

    @ResponseBody
    @RequestMapping("/upload2")
    public Map upload2(MultipartFile file,HttpServletRequest request){

        String prefix="";
        String dateStr="";
        OutputStream out = null;
        InputStream fileInput=null;
        try{
            if(file!=null){
                String originalName = file.getOriginalFilename();
                prefix=originalName.substring(originalName.lastIndexOf(".")+1);
                Date date = new Date();
                String uuid = UUID.randomUUID()+"";
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                dateStr = simpleDateFormat.format(date);
                String filepath = "D:\\upload\\" + dateStr+"\\"+uuid+"." + prefix;
                
                File files=new File(filepath);
                System.out.println(filepath);
                if(!files.getParentFile().exists()){
                    files.getParentFile().mkdirs();
                }
                file.transferTo(files);
                Map<String,Object> map2=new HashMap<>();
                Map<String,Object> map=new HashMap<>();
                map.put("code",0);
                map.put("msg","");
                map.put("data",map2);
                map2.put("src",dateStr+"/"+uuid+"." + prefix);
                return map;
            }

        }catch (Exception e){
        }finally{
            try {
                if(out!=null){
                    out.close();
                }
                if(fileInput!=null){
                    fileInput.close();
                }
            } catch (Exception e) {
            }
        }
        Map<String,Object> map=new HashMap<>();
        map.put("code",1);
        map.put("msg","");
        return map;

    }
    
    
    @ResponseBody
    @RequestMapping("/downLoad")
    public void downLoad(HttpServletRequest request, HttpServletResponse response){
		File downLoadFileDir = new File("D:\\upload");
		String aFileName = null;// 要下载的文件名
		FileInputStream in = null;
		ServletOutputStream out = null;
		try {
			request.setCharacterEncoding("utf-8");
			aFileName = request.getParameter("resPath");
			response.setHeader("Content-Type", "application/x-msdownload");// 设置下载文件使用的报头
			response.setHeader("Content-Disposition", "attachment;filename=" + toUTF8String(aFileName));
			in = new FileInputStream(downLoadFileDir + File.separator + aFileName);// 读入文件
			out = response.getOutputStream();// 得到输出流,用于向客户端输出二进制数据
			out.flush();
			int aRead = 0;
			byte b[] = new byte[1024];
			while ((aRead = in.read(b)) != -1 && in != null) {
				out.write(b, 0, aRead);
			}
			out.flush();
			in.close();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

    public static String toUTF8String (String str) {
		StringBuffer sb=new StringBuffer();
		int len=str.length();
		for(int i=0;i<len;i++) {
			char c=str.charAt(i);
			if(c>=0 && c<=255)
			{
				sb.append(c);
			}
			else {
				byte b[];
				try {
					b=Character.toString(c).getBytes("UTF-8");
				}
				catch(UnsupportedEncodingException e) {
					e.printStackTrace();
					b=null;
				}
				for(int j=0;j<b.length;j++) 
				{
					int k=b[j];
					if(k<0) {
						k&=255;
					}
					sb.append("%"+Integer.toHexString(k).toUpperCase());
				}
				
			}
		}
		return sb.toString();
	}
}
