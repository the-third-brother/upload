**项目名：软件上传**

## 功能摘要

1、软件上传（单文件，不限大小）

2、软件信息列表查询

2.1 查询所有软件信息

2.2 按条件查询软件信息（未实现）

3、软件下载

3.1 单个下载

3.2 批量下载（未实现）

4、软件删除（不删实际文件）

4.1 单个删除

4.2 批量删除（未实现）

5、修改软件信息

5.1 添加软件分类

5.2 修改分类信息

5.3 修改软件名字等信息

 6 文件寄存

6.1 多文件上传

6.2 单文件下载

6.3 多文件下载（未实现）

## 页面设计及交互逻辑

1、 导航页面

![img](http://ssange.com/navigation.png)

交互逻辑：当点击“软件仓库”导航菜单时，直接跳转主页。当用户未登录时，显示“登录”按钮，当用户登录后，显示用户信息及“退出登录”入口，如下：

![img](http://ssange.com/navigation2.png)

此项目不设置用户注册操作，只有拥有账号的用户才能进行除软件下载外的软件上传、软件修改、软件分类管理等操作。

该导航页面应当在其他页面中被引入。

2、 软件列表页面

![img](http://ssange.com/softwareList.png)

该页面为项目主页，当用户访问网站主页时，如<http://localhost:8080>时，后台查询所有软件信息，并返回该页面，暂不设置分页操作。

3、 软件上传页面

当用户点击主页的“上传软件”按钮时，弹出文件选择对话框，当选中文件后，我们需要将文件上传服务器并获取其文件名及文件大小，该项目使用layui的“文件上传组件”，其官网地址为：<https://www.layui.com/doc/modules/upload.html>。请求后台后由后台返回软件上传页面，如下：

![img](http://ssange.com/uploadPage.png)

该页面使用layui的表单组件，官网地址为：<https://www.layui.com/doc/element/form.html> 。“软件名称”根据上传文件名自动填充，“软件类别”则是由后台查询数据库获取，“软件说明” 可填可不填，当点击添加分类按钮时，弹出一个窗口填写新分类名，这样设计是为了尽量简约，避免页面跳转带来的繁琐，如下：

![img](http://ssange.com/uploadPage2.png)

弹窗使用的是layui的弹窗组件，官网地址为：<https://www.layui.com/doc/modules/layer.html>。当点击“保存”时，调用jQuery的ajax，向后台提交请求，将分类信息存入数据库并刷新当前页面，为了防止“软件名称”、“软件说明”内容丢失，将其一同绑定到请求参数中。

当点击“立即提交”按钮时，将软件明细信息存入数据库并返回到主页，同时刷新数据。

4、 软件分类管理页面

![img](http://ssange.com/categoryPage.png)

当点击主页的“分类管理”按钮时，后台查询所有软件分类信息，使用jstl的forEach标签绑定数据。

当点击“添加”按钮时，弹出新增分类名字窗口，如下：

![img](http://ssange.com/categoryPage2.png)

当点击“确定”后，前端发送一个Ajax请求，将该新增分类信息存入数据库，并自动刷新数据。

当点击“修改”按钮，同样弹出一个窗口，用来填入分类信息，截图同上。当点击当点击“确定”后，前端发送一个Ajax请求，根据所在cId（注意，cId不是编号数字），更新数据库分类信息，并自动刷新前端数据。

当点击“删除”按钮，为防止用户误操作，弹出一个确认窗口，如下：

![img](http://ssange.com/categoryPage3.png)

当用户点击“确定”时，前端发送一个Ajax请求，根据所在cId，数据库中该项记录，并自动刷新前端数据。

5、 软件信息修改页面

当用户点击主页的“修改”按钮，根据所在sId，查询该项数据库信息，前端跳转软件信息修改页面，并自动填入数据。如下：

![img](http://ssange.com/SModifyPage.png)

当点击“立即提交”按钮时，更新数据库信息，并返回主页，同时刷新前端数据。

当点击“删除”按钮时，为防止误操作，弹出确认窗口，当点击“确定”时，前端发送一个Ajax请求，数据库删除该项数据，但实际文件不删除。

当用户点击“下载”按钮，根据所在sId查询数据库中该软件的URL，并直接跳转到该URL。

<font color='red'>（bug： 这里的软件类别加载不出来，但在浏览器的检查页面中，是可以看到起代码并带有后端数据的，暂未修复）</font>

6、 用户登录页面

当用户点击导航栏“登录”按钮时，直接跳转到登录页面，如下：

![img](http://ssange.com/login.png)

当用户点击“登录”，后台查询数据库是否存在该用户或者用户名密码是否正确，若存在则将该用户信息存入服务器session，前端跳转到主页；若不存在或用户名密码不正确，则重新返回当前页面进行重填。

7、多文件上传页面

当用户未登录时，显示如下：

![img](http://ssange.com/MutiUpload.png)

当用户登录时，显示如下：

![img](http://ssange.com/MutiUpload2.png)

8、文件下载

当用户未登录时，显示如下：

![img](http://ssange.com/download1.png)

当用户登录时，显示如下：

![img](http://ssange.com/Download.png)

## 数据库设计

1、 软件明细表

![img](http://ssange.com/SoftwareDetail.png)

2、 软件分类表

![img](http://ssange.com/SoftwareCategory.png)

3、 用户表

![img](http://ssange.com/user.png)

4、寄存文件表

![img](http://ssange.com/deposit.png)

## 具体实现及问题解决方案

1.  点击绑定onclick事件的按钮无反应？

 检查js代码是否报错
 检查js变量的声明是否冲突

2. Mybatis的Mapper接口出现两个或两个以上的情况下，需要绑定变量，如下：

```c
public interface UserMapper {
    User login(@Param("user") String user, @Param("password") String password);

    int updateLoginTime(@Param("uId") int uId, @Param("loginTime") String loginTime);
}
```

3. 当Mybatis的Mapper传入的是一个对象，SQL语句怎么获取对象成员变量？
   直接选择成员变量即可，如下：

   ```c
   //Mapper接口 
   @Override
       public int updateSoftwareInfoById(SoftwareDetails software) {
           return softwareMapper.updateSoftwareInfoById(software);
       }
   -----------------------------------------------------------------------------
   //Mapper XML配置文件
   <update id="updateSoftwareInfoById">
           update software_details
           set name = #{name},c_id = #{cId},statement = #{statement}
   where s_id = #{sId}
   </update>
   ```

4. jQuery怎么获取某个元素的值，比如常见的获取某个输入框的值？
   给输入框指定一个`id`，在js代码中使用`var value = $("#id").val();`即可获取。注意，但凡使用`jQuery`框架，必须引入其js文件，且代码引入顺序必须注意先后，最好放在`<head></head`标签里。

5. SpringMVC怎么获取request的请求参数？

   - 封装一个对象接收

     ```c
     @RequestMapping("/login")
         public String login(User user){
         	//...
             return "login";
         }
     ```

     

   - 按传入参数顺序声明对应的参数类型接收

     ```c
     @RequestMapping("/toModifySoftwareById")
         public String toModifySoftwareById(int sId){
             //...
             return "modify";
         }
     ```

   - 参数绑定路径接收

     ```c
     @RequestMapping("/toModifySoftwareById/{sId}")
         public String toModifySoftwareById(@PathVariable int sId){
             //...
             return "modify";
         }
     ```

   6. 调用Ajax请求服务器时，服务器怎么返回json格式的字符串到客户端？
      添加`@ResponseBody`注解，返回`JSONObject`对象，引入对应的`fastjson`这个jar包。此外，返回`JSONObject`对象返回的还不是`json`字符串，因此我们需要引入自动将java对象转化为json字符串格式的jar包，包括三个：`Jackson databind`,`Jackson core`,`Jackson Annotations`
      （注意：如果不添加`@ResponseBody`注解，Ajax会进行错误回调）

      ```c
      //Controller方法
      	@ResponseBody
          @RequestMapping("/download")
          public JSONObject download(int sId){
          JSONObject jsonObject = new JSONObject();
          jsonObject.put("xxx", "xxx");
          return jsonObject;
      }
      -----------------------------------------------------------------
      //添加依赖
      <!-- https://mvnrepository.com/artifact/com.alibaba/fastjson -->
          <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>fastjson</artifactId>
            <version>1.2.58</version>
          </dependency>
          <!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-databind -->
          <dependency>
            <groupId>com.fasterxml.jackson.core</groupId>
            <artifactId>jackson-databind</artifactId>
            <version>2.9.9</version>
          </dependency>
          <!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-core -->
          <dependency>
            <groupId>com.fasterxml.jackson.core</groupId>
            <artifactId>jackson-core</artifactId>
            <version>2.9.9</version>
          </dependency>
          <!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-annotations -->
          <dependency>
            <groupId>com.fasterxml.jackson.core</groupId>
            <artifactId>jackson-annotations</artifactId>
            <version>2.9.9</version>
          </dependency>
      ```

   7. 当`Model`请求域中的键与`Session`中的键相同时，优先调用`Model`的键

   8. 访问jsp文件出现中文乱码怎么解决？
      在jsp文件最前面引入以下这行代码，设置编码方案为`utf-8`

      ```jsp
      <%@ page contentType="text/html;charset=utf-8" %>
      ```

      为了避免每次使用IDEA新建jsp文件都要手动引入这行代码的繁琐，可在设置中修改jsp模板，在文件最前面添加这行代码。

   9. Linux启动Tomcat后，在没有运行防火墙的情况下无法访问8080端口？
      在正常情况下，我们不考虑window防火墙问题（假设没有对该端口进行限制），则考虑服务器的安全组设置，比如我的服务器时腾讯服务器，则在其管理后台设置该服务器的安全组规则，开放8080端口。

   10. `selec`元素怎么在根据动态获取到的数据自动切换选中的`option`？
     给`option`设定一个`datasetId`，js代码绑定该`select`元素，遍历每一个`option`，根据返回的数据进行选中。

     ```jsp
     //html代码
     <select id="categorySelect" name="cId" lay-verify="required">
                     <c:forEach items="${categories}" var="category">
                         <option datasetId="${category.cId}" value="${category.cId}">${category.name}</option>
                     </c:forEach>
                 </select>
     
     ------------------------------------------------------------------------
     //js代码
     <script>
         var cId = ${software.cId};	//获取返回数据的option值
         $("#categorySelect option").each(function () {
             var value = $(this).attr("datasetId");
             if(cId == value)
                 $(this).attr("selected", "selected");
         });
     </script>
     ```

   11. js代码函数命名`download`时无法调用，将其命名`download1`即可。

   12. 使用Ajax时必须引入`jQuery`文件

   13. jsp绑定数据后无法显示？
       除了问题大家都有嫌疑，但责任出现谁身上就得进行排除。当确保后台成功从数据库拿到数据后并成功返回页面后，问题一般就出现在前端了，既然绑定数据的格式没有问题，我们通常用`jstl`标签库进行数据绑定，那可能是没有声明`jstl`前缀，如下：

       ```jsp
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       ```

   14. 获取文件输入流后，怎么获取文件大小并转化为平常可读方式，如`5M`等？
       使用FileUtils工具类，接收文件时使用`MultipartFile`类，如下：

       ```c
        @RequestMapping("/doUploadFile")
           public JSONObject doUploadFile(MultipartFile file, Model model){
               String fileSize = "";
               String fileName = "";
       
               if(!file.isEmpty()){
                   try {
                       FileUtils.copyInputStreamToFile(file.getInputStream(), new File("/xxx/xxx/",
                               file.getOriginalFilename()));
                       fileSize = FileUtils.byteCountToDisplaySize(file.getSize());
                       fileName = file.getOriginalFilename();
                   } catch (IOException e) {
                       e.printStackTrace();
                   }
               }
       ```

       注意：这里的路径`/xxx/xxx/`是针对linux服务器路径的，对于window系统，则会根据tomcat服务器所在盘为根路径进行存储。

   15. 为了避免上传文件放在tomcat内部容易丢失且使项目过大，则文件放置在其他路径，但tomcat服务器怎么进行访问项目外的文件呢？
       使用虚拟路径映射，在tomcat服务器根目录下`/conf/server.xml`中末尾添加如下配置：

       ```xml
       //在文件末尾的<host></host>标签对里添加以下配置
       <Context path="/data" docBase="/data/software/" reloadable="true" debug="0"></Context>
       //意为当访问项目路径下的/data时，自动映射到物理服务器的/data/software/路径下
       ```

       

   16. Controller怎么转发到另一个Controller？
       对于网上说的转发用`return "forward:/xxx/xxx"`，重定向用`return "redirect:/xxx/xxx"`,一直无效，不知道是因为是什么原因，因此使用`RedirectView`对象，则可正常转发

       ```c
       @RequestMapping("/doUploadInfo")
           public RedirectView doUploadInfo(SoftwareDetails softwareDetails, Model model,){
               H
               String toUrl = "/all/queryAllSoftwareInfo";
               return new RedirectView(toUrl);
           }
       ```

   17. Controller怎么获取session值？

       ```c
       @RequestMapping("/doUploadInfo")
           public RedirectView doUploadInfo(SoftwareDetails softwareDetails, Model model, HttpServletRequest request){
               HttpSession session = request.getSession();
               //...
               User u = (User)session.getAttribute("u");
               //...
               String toUrl = "/all/queryAllSoftwareInfo";
               return new RedirectView(toUrl);
           }
       ```

   18. SpringMVC怎么返回数据给前端？
       使用`ResponseBody`注解即可返回json字符串给前端（注意引入转化java对象为json字符串的jar包）

   19. 前端怎么获取返回的json字符串的键值？
       通过`var data = res.data`即可，如下：

       ```jsp
       $.ajax({
       url: ''
       ,type: 'post'
       ,data: {}
       ,dataType: 'json'
       ,success: function (res) {
       var url = res.url;	//看这里看这里看这里
       //window.location.replace("${ctx}"+url);
       }
       ,error: function () {
       }
       })
       ```

   20. js怎么进行重定向？

       ```jsp
       window.location.replace("");
       //或者
       window.location.href = "";
       ```

   21. Mybatis的实体对象中的成员变量必须与数据库中的字段一一对应，否则接收不到数据库对应字段的数据。

   22. 怎么让两个div处在同一行？

       - 使用`display: flex`

       - 使用`display: float`

       - 使用`display: inline-block`(推荐与float结合使用)

         最后给两个div套一个div即可

   23. 为了避免css文件、js文件引入混乱，最好`<head></head>`标签对里或者`<body></body>`里靠前位置引入，便于查找。

   24. 数据库设计，对于有时间字段的建议设置`varchar`型，便于后台进行格式化处理后存储并显示。

   25. mybatis根据记录id进行`update`操作时，必须根据主键进行查找

   26. 调用Mpaper时不能返回空，因为即使操作数据库没有数据要返回，mybatis会返回0或1的处理结果。

   27. 当tomcat启动异常时，可通过tomcat服务器根目录下的`logs/catalina.out`进行查看，里边的内容就是我们本地调试时程序控制台的内容，即为tomcat日志。

   28. 怎么对tomcat添加ssl？
       在tomcat服务器根目录下`/conf/server.xml`的`<service></service>`标签对中添加以下配置并修改相关参数。以下意为对`xxx.jks`中的`xxx`域名访问的`8443`端口添加`ssl`证书，

       ```xml
       <Connector
       protocol="org.apache.coyote.http11.Http11NioProtocol" 
       port="8443" maxThreads="200" 
       scheme="https" secure="true" SSLEnabled="true" 
       keystoreFile="/root/tomcats/tomcat2/conf/xxx.jks" keystorePass="xxx" 
       clientAuth="false" sslProtocol="TLS"/> 
       ```

       - `keystoreFile`：优先使用绝对路径，因为在相对路径下测试后无效
       - `keystorePass`：与`keystoreFile`证书文件同路径下有个`txt`文件，复制里边内容到这里

   29. 本地调试可以正常调用Controller，但部署到服务器访问时一直报404
       因为我配置了服务器的虚拟路径映射，不小心将请求映射的路径与`Controller`路径命名重合，导致在每次请求`Controller`的时候，服务器会根据虚拟路径映射请求到文件其他路径去，并没有真正访问`Contrller`。由于映射路径没有文件，所以报`404`。


