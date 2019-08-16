# SSM-DeptManageGet
调用接口获取数据并插入数据库
---
该项目是整合了Spring Boot+SpringMVC+MyBaits的Maven项目，在项目中通过RestTemplate的getForObject方法发起GET请求，获取相应接口的数据，再将拿到的数据插入数据库。该项目中调用的接口是[DeptManage项目](https://butalways1121.gitee.io/2019/08/16/Spring-Boot-SpringMVC-MyBaits%E5%AE%9E%E7%8E%B0%E6%95%B0%E6%8D%AE%E5%BA%93%E7%9A%84%E5%9F%BA%E6%9C%AC%E6%93%8D%E4%BD%9C/)的/api/findAll方法。
<!-- more -->
## 创建数据库
在Navicat中的deptmanage数据库新建deptget表设计如下,其中id属性选择为自增：
![](https://raw.githubusercontent.com/butalways1121/img-Blog/master/29.png)
## 新建项目
 新建Maven项目，并做相应的配置文件修改（将端口设为8081）。
## 创建项目
### entity层
在src/main/java下新建entity包，创建DeptInfo实体类，该实体类封装的变量对应deptget数据库表中的属性:
```
package com.DeptManageGet.entity;

public class DeptInfo {
	private int id;
	private String name;
	private String address;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
```
### dao层
在src/main/java下新建dao包,新建DeptInfoDao接口，声明对数据库插入操作的方法：
```
package com.DeptManageGet.dao;

import org.apache.ibatis.annotations.Mapper;
import com.DeptManageGet.entity.DeptInfo;

@Mapper
public interface DeptInfoDao {
	void insert(DeptInfo deptInfo);//插入数据信息
}
```
在src/main/resources下创建mapper文件夹，在创建DeptInfoMapper.xml文件，在其中添加对数据库的具体操作:
```
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
"http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="com.DeptManageGet.dao.DeptInfoDao">
	<!-- 插入数据库 -->
	<select id="insert" resultType="DeptInfo" parameterType="DeptInfo">
		insert into deptget(name,address) values(#{name},#{address})
	</select>
</mapper>
```
### service层
在src/main/java下新建service包，新建DeptInfoService接口，声明方法：数据库插入信息的方法和从DeptManage项目获取数据的方法：
```
package com.DeptManageGet.service;

import com.DeptManageGet.entity.DeptInfo;

public interface DeptInfoService {
	boolean insert(DeptInfo deptInfo);//插入信息
	public DeptInfo[] getInfo();//从DeptManage接口获取数据信息,定义的是数组类型
}
```
在src/main/java下新建serviceimpl包,新建DeptInfoServiceImpl类，重写DeptInfoService中声明的方法：
```
package com.DeptManageGet.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.DeptManageGet.dao.DeptInfoDao;
import com.DeptManageGet.entity.DeptInfo;
import com.DeptManageGet.service.DeptInfoService;

@Service
public class DeptInfoServiceImpl implements DeptInfoService{
	@Autowired
	private DeptInfoDao deptInfoDao;

	@Override
	//插入信息
	public boolean insert(DeptInfo deptInfo) {
		// TODO 自动生成的方法存根
		boolean flag=false;
		try {
			deptInfoDao.insert(deptInfo);
			flag=true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	//从DeptManage接口获取信息
	public DeptInfo[] getInfo() {
		// TODO 自动生成的方法存根
		RestTemplate restTemplate=new RestTemplate();//借助 RestTemplate，Spring应用能够方便地使用REST资源,RestTemplate定义了36个与REST资源交互的方法
		System.out.println("获取数据...");
		String url = "http://127.0.0.1:8083/api/findAll";
		DeptInfo[] result = restTemplate.getForObject(url, DeptInfo[].class);//getForObject() 发送一个HTTP GET请求，返回的请求体将映射为一个对象
		System.out.println(result);
		return result;
	}
} 
```
### controller层
在src/main/java下新建controller包，新建DeptInfoController类来处理请求返回数据:
```
package com.DeptManageGet.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.DeptManageGet.entity.DeptInfo;
import com.DeptManageGet.service.DeptInfoService;

@RestController
@RequestMapping(value = "/api")
public class DeptInfoController {
	@Autowired
	private DeptInfoService deptInfoService;
	
	@RequestMapping(value = "/insert",method = RequestMethod.GET)
	public boolean insert() {
		System.out.println("开始从DeptManage的接口获取数据");
		DeptInfo[] infos = deptInfoService.getInfo();
		for(DeptInfo info:infos) {
			System.out.println("插入数据");
			deptInfoService.insert(info);
		}
		return true;
	}
}
```
***
至此，整个项目已创建完毕。
## 测试
首先运行DeptManage项目，开启接口，然后在启动该项目，在postman中设置如下信息，点击send之后，会返回"true":
![](https://raw.githubusercontent.com/butalways1121/img-Blog/master/30.png)
p30
到数据库查看deptget数据表，可以看到数据已插入：
![](https://raw.githubusercontent.com/butalways1121/img-Blog/master/31.png)
***
至此，整个功能已实现！
## OVER！
