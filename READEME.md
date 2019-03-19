## 总览
![效果图](https://upload-images.jianshu.io/upload_images/13670095-e54345707ff6c903.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![实现](https://upload-images.jianshu.io/upload_images/13670095-1a7df71802d75f53.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
这个小项目的目标是通过API请求 获取OpenWeatherMap的基础天气信息和WAQI的空气质量信息, 并将这些信息存入MySQL数据库, 并从前端展示出来. 展示Node-RED在可视化编程和UI界面快速构建方面的强大能力.
相关资源可在Github获取, https://github.com/bing-zhub/WeatherNode. 如果对您有用也请赏个Star吧

## 数据库设计
![ER图](https://upload-images.jianshu.io/upload_images/13670095-13fb1996755f3b3e.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
以Weather表为主表其余为副表, 通过外键关联各个副表. 大体含义可以通过域名推测.

## API Token获取
### OpenWeatherMap
1. https://home.openweathermap.org/users /sign_up 注册
2. https://home.openweathermap.org/api_keys 添加项目
3. 在2的页面中可以查看到你获取的Token
具体的API参数参照 https://openweathermap.org/current

### WAQI
1. https://aqicn.org/data-platform/token/# 注册
2. 注册成功后便可以在当前页面获取到Token
具体的API参数参照 https://aqicn.org/json-api/doc/ 

## Node-RED编写
如果曾看过之前的文章, 应该知道 Node-RED每个flow是通过一个msg对象进行传递数据的. 所以这里我们在`init`节点生成一个msg对象, 来替代Node-RED本身生成的msg对象(这样可以更加方便添加键值对).
``` js
msg = {
    city:"",
    country:"",
    basic_api:"",
    air_api:"",
    data:{
        basic:{

        },
        air:{

        }
    },
    topic:"",
    ids:{
        location:0,
        temp:0,
        wind:0,
        air:0,
        iaqi:0
    },
    payload:{
        urls:""
    }
}

return msg;
```
`city`/`country`用来放置即将在`config`节点中即将添加的城市和国家. `data`用来存储从API获取的数据. `topic`在后续节点主要用于存放SQL语句. `ids`用于存放,在存入副表数据过程中产生的副表ID, 主要用于主表外键关联. 

### 从数据源获取数据
在初始化完成后, 下面构造API
``` js
city = "London";
country = "UK";
basic_token = "OpenWeatherMap token";
air_token = "WAQI token";

msg.city = city;
msg.country = country;
msg.basic_api = `http://api.openweathermap.org/data/2.5/weather?q=${city},${country}&appid=${basic_token}`;
msg.air_api = `https://api.waqi.info/feed/${city}/?token=${air_token}`;

msg.url = msg.basic_api;
return msg;
```
构造完成后, API地址被放入了msg对象, 在下一步的Request请求便可以调用.
Request节点可以通过可视化配置的方式配置API地址, 也可通过`msg.ur`l动态配置, 所以我们把基础天气信息的API放入`msg.url`.

Request(GET)请求后, 返回的数据通过`JSON`节点, 将字符串转为JavaScript对象, 这样更加方便操作. 转换好之后, 将获得的数据放入事先为数据预留的`msg.data`.

这是我们就已经获取到了对应城市的基础天气. 

空气质量信息与之类似, 不赘述.

### 数据库存储
数据源数据获取后, 我们便可以操作`msg`, 将需要的信息存储进入数据库.
首先我们安装Mysql Connector
![节点管理](https://upload-images.jianshu.io/upload_images/13670095-36d8fe013298010a.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![MySQL](https://upload-images.jianshu.io/upload_images/13670095-559bdddb755fe21b.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

``` js
latitude = msg.data.basic.coord.lon;
longitude = msg.data.basic.coord.lat;

sql = `insert into Location (latitude, longitude) values(${latitude}, ${longitude});`;
msg.topic = sql;
return msg;
```
首先获取`msg`对象中的`latitude`和`longitude`.
接下来构造DML, 这里使用JavaScript的模板语法, 把获取的`latitude`和`longitude`填入SQL语句. 
由于Node-RED中的MySQL驱动从以`msg.topic`为SQL, 所以我们要将构造好的SQL放入`msg.topic`. 

之后, 从左侧节点栏拖出MySQL, 配置数据库, 完成后用连线将二者(function节点与MySQL节点)进行连接, 如总图.

当数据到来时, MySQL节点便会执行`msg.topic`中的SQL语句, 将对应的信息存入数据库. 数据存储成功后, MySQL节点会将SQL执行的结果返回到`msg.payload`, 其中包含插入的`id`, 我们将获取到的`id`放入`ids`对应的键中, 以便后续使用. 

其余过程相似性很大, 不再赘述.
在对主表进行操作时, 将`msg.ids`中的数据获取出来, 便可以产生外键约束, 保持数据整体性.

### 可视化
未完待续...

