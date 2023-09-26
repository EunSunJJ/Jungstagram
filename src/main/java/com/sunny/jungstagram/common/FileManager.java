package com.sunny.jungstagram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManager {

	public final static String FILE_UPLOAD_PATH = "C:\\Study\\6_spring_project_info\\upload\\sns";
	
	public static String saveFile(int userId, MultipartFile imageFile) {
		
		if (imageFile == null) {
			return null;
		}
		
		String directoryName = "/" + userId + "_" + System.currentTimeMillis();
		String directoryPath = FILE_UPLOAD_PATH + directoryName;
		File directory = new File(directoryPath);
		
		if (!directory.mkdir()) {
			return null;
		}
		
		String filePath = directoryPath + "/" + imageFile.getOriginalFilename();
		
		try {
			byte[] bytes = imageFile.getBytes();
			
			// 경로를 관리하는 객체로 만들어서 담아준다
			Path path = Paths.get(filePath);
			Files.write(path , bytes);
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
			return null;
		}
		
		return "/images" + directoryName + "/" + imageFile.getOriginalFilename(); 
	}
}
