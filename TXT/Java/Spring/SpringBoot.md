# Spring Boot 框架
## 目录


*************************************

## 安装SpringBootCLI
- 安装SDKMAN
    - 使用git bash运行  `curl -s get.sdkman.io | bash`
    - `source "/Users/{yourname}/.sdkman/bin/sdkman-init.sh" `根据实际目录去运行
    - spring --version

- *注意：所有Controller类要和*Application类同包或子包*


## Springboot的测试模块
- 可以使用MockMvc来测试Controller层的代码
- 可以使用MockMvc的SpringSecurity支持来测试安全模块
- 使用 WebIntegraionTest 测试运行中的Web容器
	- 启动嵌入式的Servlet容器来进行测试，下断言
- 使用随机端口启动服务器 配置local.server.port=0
- 使用Selenium来测试HTML页面，模拟浏览器的动作，查看系统运行状态

****************************************
## Web模块
### REST的使用
1.添加依赖
```
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-data-rest</artifactId>
    </dependency>
```
2.引入自动配置类
```
    @Configuration
    public class RestConfiguration extends RepositoryRestMvcConfiguration {
        @Override
        public RepositoryRestConfiguration config() {
            return super.config();
        }
        // 还可以重写Config开头的方法
    }
```
3.配置repository的名字例如：
```
    @RepositoryRestResource(path = "book")
    public interface BookDao extends JpaRepository<Book,Long>{
```
4.启动应用，控制台有如下输出

- ![输出](https://raw.githubusercontent.com/Kuangcp/Notes/master/TXT/Images/Spring/output.png)
- 可以清楚的看到有关路径的使用方法
    - GET 查询单个 /repo/id 成功：200 失败404
    - GET查询所有 /repo 成功200 失败404
    - POST 新增 /repo json数据发送 成功 201 失败404
    - DELETE 删除 /repo/id json数据 成功204 失败404
    - PUT更新 /repo/id json 更新成功200 没有该id就插入201 失败404（使用主键自动增长就不会遇到404）

***************************************
## 部署
### war
部署为war必须的类
```
    public class ServletInitializer extends SpringBootServletInitializer {

        @Override
        protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
            return application.sources(DemoApplication.class);
        }

    }
```

### jar



