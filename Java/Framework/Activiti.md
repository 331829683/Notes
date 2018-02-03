`目录 start`
 
- [Activiti](#activiti)
    - [基础概念](#基础概念)
        - [什么是流程](#什么是流程)
        - [流程引擎](#流程引擎)
        - [BPMN流程图](#bpmn流程图)
        - [数据库的设计](#数据库的设计)
            - [1.资源库流程规则表](#1资源库流程规则表)
            - [2.运行时数据库表](#2运行时数据库表)
            - [3.历史数据库表](#3历史数据库表)
            - [4.组织机构表](#4组织机构表)
            - [5.通用数据表](#5通用数据表)
        - [核心配置文件](#核心配置文件)
        - [大致原理讲解](#大致原理讲解)

`目录 end` *目录创建于2018-02-03* | 更多: [CSDN](http://blog.csdn.net/kcp606) | [oschina](https://my.oschina.net/kcp1104) | [码云](https://gitee.com/kcp1104) 
****************************************

# Activiti
> [参考笔记](https://github.com/dragonhht/Notes/blob/master/Java/Activiti%E5%AD%A6%E4%B9%A0%E7%AC%94%E8%AE%B0.md)

******************************
## 基础概念
*****************************
### 什么是流程

*****************************
### 流程引擎

******************************
### BPMN流程图
[案例视频](http://www.jikexueyuan.com/course/1777_2.html?ss=1)
![最简单示例图](https://raw.githubusercontent.com/Kuangcp/ImageRepos/master/Tech/activiti/activiti-first.png)
`bpmn是最原始的单纯的流程定义文件，与Springboot整合就是bpmn20.xml文件(区别在于动态注入)`

> bpmn文件2.0结点是definitions节点，这个元素中可以定义多个流程定义（建议每个文件只包含一个流程定义,可简化维护难度).  
> definitions元素最少也要包含xmlns和targetNamespace的声明，targetNamespace可以是任意值，它用来对流程实例进行分类  
> [最简单的示例 FirstDemo.bpmn20.xml](https://gitee.com/kcp1104/codes/9cm6pdsqo5vrauij41xbk68#FirstDemo.bpmn20.xml)

*****************************************
### 数据库的设计
> 所有表都以ACT开头

#### 1.资源库流程规则表
> ACT_RE开头

#### 2.运行时数据库表
> ACT_RU开头

#### 3.历史数据库表
> ACT_HI开头

#### 4.组织机构表
> ACT_ID开头

#### 5.通用数据表
> ACT_GE开头

******************************
### 核心配置文件
> activiti.cfg.xml 含数据库配置,默认的JDBC是默认Mybatis连接池

### 大致原理讲解

![来源](https://raw.githubusercontent.com/Kuangcp/ImageRepos/master/Tech/activiti/simple.png)



