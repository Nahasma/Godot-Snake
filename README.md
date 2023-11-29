# Godot-Snake

## 注意事项
1. Godot版本为3.5.3LTS
2. src文件夹里的文件为我收集的资源，以及部分自己绘画的资源，***仅限个人学习使用，严禁商用***。
3. 由于是边学边做的，所以脚本风格与命名风格不太统一，同时耦合也比较严重，后续有机会会重构。
4. 这是我的参考学习资源，最先是将这位老哥的项目[youtube-tutorials](https://github.com/uheartbeast/youtube-tutorials)导入后进行修改，所以有一些遗留的没用上的内容。
5. 感谢b站up主[timothyqiu](https://space.bilibili.com/7092?spm_id_from=333.337.0.0)，很多godot开发知识是我看他视频收获到的，大家有机会可以支持一下。
6. 这是我的第一个作品，各位有什么问题，建议和意见都可以反馈给我，我看到之后会及时答复，谢谢！
7. 如果你要做课程设计，建议不要直接copy，这个版本还有很多不足之处，更像是一个半成品。

## 感谢
1. b站up主[timothyqiu](https://space.bilibili.com/7092?spm_id_from=333.337.0.0)在b站提供的教程
2. 油管主[HeartBeast](https://www.youtube.com/@uheartbeast)在油管提供的教程
3. 图片转像素网站[LZ迷你工具箱](http://www.lizibuluo.com/xs)帮助我节省了很多绘画时间
4. 开源字体网站[1001 Fonts](https://www.1001fonts.com/)及字体作者，我用到了**back-to-1982**，**lotsofdotz**，**ponderosa**，**8-bit-limit**，**pixelart-halloween**，**凤凰点阵体**字体设计者
5. 像素画绘制软件[aseprite](http://www.lizibuluo.com/xs)提供了免费可编译的文件

---
## 背景
```
基于Godot引擎的贪吃蛇类游戏开发，北京理工大学自动化专业《软件工程导论》课程大作业
``` 

## 游戏
风格预览  
![森林关卡](https://github.com/Nahasma/Godot-Snake/blob/main/src/PREVIEW/%E8%B4%AA%E5%90%83%E8%9B%87.png)


关于玩家和收集物
```
1. 贪吃蛇移动方式为：每隔一段时间移动一段距离（32px）
2. 贪吃蛇死亡判定：触碰障碍物（边界、障碍区域）和蛇身死亡
3. 收集物生成方式：单个场景下仅存在一个收集物，收集物会通过一个不可见的Testapple判定是否在合法区域，下次会生成在Testapple位置
4. 达到通关条件：达到一定分数（默认3分，level6除外）
5. 通关方式：触碰通关门
```

关于关卡
```
1. level1：普通场景，新手关卡
2. level2：普通场景，障碍物比较丰富
3. level3：沙漠场景，分布有仙人掌敌人
4. level4. 熔岩场景，地形为熔岩地貌，岩浆有概率爆发
5. level5. 雪地场景，障碍物比较丰富，存在熔岩地貌（致敬mc），每隔一段时间会爆发雪崩
6. level6. 海洋场景，彩蛋关卡，收集试卷达到60分即可触碰海洋
```

关于彩蛋
```
1. 通关门为写轮眼
2. Title场景下触碰蛇身会移动吃苹果
3. level6通关后出现开发者寄语
```

## 文件目录
```
.import  引擎生成的导入文件
Scene    打包的场景文件
script   脚本文件，里面是对应的场景
src      资源文件
project.godot 工程文件
```
## 场景文件简介
godot开发时我以场景为单元进行的，这里简单介绍一下场景文件夹下各场景含义
```
Area: 区域场景，对应着环境与地形
Collection: 收集物场景，对应着蛇的收集物（目前只有苹果）
enemy: 敌人场景，目前只有仙人掌
Global：全局场景，主要负责全局的参数和场景调控、通信
HUD：平视显示场景
UI：用户场景，包括通过、失败、暂停、标题界面
Snake：蛇场景，包括蛇头和蛇身场景
world：世界场景，即各个难度等级的场景
```

## 脚本
挂载脚本放在了script文件夹，godot项目可以自行匹配，这里不介绍
