package com.etoak.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.etoak.util.UUIDGenerator;

@Controller
public class loginController {
	@RequestMapping("/ajaxUpload")
	@ResponseBody
	public String asyncUpload(@RequestParam("myfile") MultipartFile myfile,
			HttpServletRequest request) throws IOException{
		//文件上传类型
		String filename = myfile.getOriginalFilename();
		String comtentType = myfile.getContentType();
		long size = myfile.getSize();

		InputStream is = myfile.getInputStream();
		//上传到的文件目录
		String path = request.getSession().getServletContext().getRealPath("/file");
		System.out.println("path-->"+path);
		String newFilename = new UUIDGenerator().generate().toString()
												+filename.substring(filename.lastIndexOf("."));
		File file = new File(path,newFilename);

		OutputStream os = new FileOutputStream(file);
		byte[] data = new byte[1024];
		int length=0;
		while((length=is.read(data))!=-1){
			os.write(data,0,length);
		}
		os.flush();
		is.close();
		os.close();
		
		return newFilename;
	}

}
